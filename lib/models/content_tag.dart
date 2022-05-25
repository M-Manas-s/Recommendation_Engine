class ContentTag{
  final String tagName;
  final double tagValue;
  
  ContentTag({required this.tagName,required this.tagValue});

  ContentTag add(double val)
  {
    return ContentTag(tagName: tagName,tagValue: tagValue+val);
  }

}