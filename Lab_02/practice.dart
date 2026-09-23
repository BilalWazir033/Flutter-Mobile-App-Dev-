// abstract class
abstract class vehicle{
  void start();
  void stop();
}
class car1 extends vehicle{
  @ override
  void start(){
    print("Car is started");
  }
  @override
  void stop(){
    print("Car is stopped");
  }
}

abstract class sample{
  String? SampleName;
  double? price;

  sample(String spn, double pr){
    this.SampleName=spn;
    this.price=pr;
  }
  void method();
}

class SubSample extends sample{
  String? sampleid;

  SubSample(String spn, double pr, String spid):super(spn, pr){
    this.sampleid=spid;
  }
  @override
  void method(){
    print("Subsample method inheriated from sample");
  }

}

void main(){
  SubSample sb=SubSample("Cell Nucleus", 234.53, "234.5493std");
  sb.method();
  print("Sample Name: ${sb.SampleName}");
  print("Sample Price: ${sb.price}");
  print("Sample ID: ${sb.sampleid}");




  car1 c1=car1();
  c1.start();
  c1.stop();
}

git add .
git commit -m "Added abstract class and its implementation"
git push origin main