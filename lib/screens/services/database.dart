import'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_berry/models/del.dart';

import '../../models/del.dart';
  class DataBaseService{
    final String uid;
    DataBaseService({ required this.uid});
    //collection reference
    final CollectionReference delaureCollection = FirebaseFirestore.instance.collection("del");
        Future updateUserDatas(String sugars,String name,int strenght) async{
          return await delaureCollection.doc(uid).set({
            'sugars':sugars,
            'name':name,
            'strenght': strenght,
            }
          );
        }
        //del lst from snapshot
    List<Del> _delListFromSnapshots(QuerySnapshot snapshot){
          return snapshot.docs.map((doc){
            return Del(
              name: doc.data() != null ?'name':'' ,
                strength: doc.data() != null ? 100:0,
                sugars: doc.data() != null ?'sugars':'0',
            );

          }
          ).toList();
    }
        //GET delaure stream
  Stream<List<Del>> get del {
          return delaureCollection.snapshots().map(_delListFromSnapshots);


  }
  }