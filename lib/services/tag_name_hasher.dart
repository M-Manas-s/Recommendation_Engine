import 'dart:collection';

import '../models/models.dart';

// This service will hash Strings as well as Content Tag Names
// for efficient search

class TagNameHasher {

  late Map<String, int> hashedValues;
  late int _limit; //  Stores the maximum size of string
  late int _mod; //  Stores the maximum limit of hash
  late int _base; //  Stores the base for hashing
  late List<int> _pw; //  Stores the powers of base from 0 to N

  TagNameHasher() {
    hashedValues = SplayTreeMap();
    _limit = 100;
    _mod = 1000000007;
    _base = 33;
    _pw = List.filled(_limit, 0);
    preCalculate();
  }

  void preCalculate() {
    _pw[0] = 1;
    for(int i = 1; i < _limit; i++) {
      _pw[i] = multiply(_pw[i - 1], _base, _mod);
    }
  }

  int add(int a, int b, int mod){
    int res = (a + b) % mod;
    if(res < 0) {
      res += mod;
    }
    return res;
  }

  int multiply(int a, int b, int mod){
    int res = (a * b) % mod;
    if(res < 0) {
      res += mod;
    }
    return res;
  }

  int power(int a, int b, int mod){
    int res = 1;
    while(b>0){
      if((b % 2) == 1) {
        res = multiply(res, a, mod);
      }
      a = multiply(a, a, mod);
      b = (b/2) as int;
    }
    return res;
  }

  int hashString(String s)
  {

    // If we already have the hashValue stored, we can return it. This is where SplayTrees are faster than
    // normal self-balancing binary trees - they can store commonly fetches words with higher priority ( near
    // the root). Hence, retrieval might even take less than logarithmic time.

    if ( hashedValues.containsKey(s) )
      {
        return hashedValues[s]!;
      }
    int n = s.length;
    int hash = 0;
    for(int i = 0; i < n ; ++i){
      hash = add(hash, multiply(_pw[i], s.codeUnitAt(i) - 'a'.codeUnitAt(0) + 1, _mod), _mod);
    }
    hashedValues[s] = hash;
    return hash;
  }

  List<ContentTagHashed> hashList(List<ContentTag> tagList){
    List<ContentTagHashed> hashedList = [];
    for ( ContentTag contentTag in tagList )
      {
        // hash the tagName data member
        hashedList.add(ContentTagHashed(tagNameHash: hashString(contentTag.tagName), tagValue: contentTag.tagValue));
      }
    return hashedList;
  }

}