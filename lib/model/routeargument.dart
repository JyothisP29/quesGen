class RouteArgument {
  String? id;
  String? heroTag;
  dynamic param;
  dynamic control;
  dynamic other;
  dynamic delivery;
  dynamic timeSlots;
  int? attend;
  int? mpq;
  int?sectionCount;

  RouteArgument({
    this.id,
    this.heroTag,
    this.param,
    this.control,
    this.other,
    this.delivery,
    this.timeSlots,
    this.attend,
    this.mpq,
    this.sectionCount
  });

  @override
  String toString() {
    return '{id: $id, heroTag:${heroTag.toString()},param:$param,control:$control,other:$other,delivery:$delivery,timeSlots:$timeSlots,attend:$attend,mpq:$mpq}';
  }
}
