import 'package:app_movie/bloc/movie/movie_bloc.dart';
import 'package:app_movie/models/populars_model.dart';
import 'package:app_movie/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var checkPopular = false;
  var checkRated = false;
  final blocInitial = BlocMovieBloc();

  @override
  void initState() {
    //blocInitial.add(GetPopularMovie());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Scaffold(
        appBar: AppBar(title: const Text("FIND AND ENJOY YOUR MOVIE")),
        body: SafeArea(
            child: BlocProvider.value(
          value: blocInitial,
          child: Container(
            width: 400,
            height: 600,
            child: Column(
              children: [
                SizedBox(height: responsive.hp(3)),
                const Text("FILTERS"),

                // CheckBox(
                //   checkitem: checkRated,
                //   title: 'Rated',
                //   blocInitial: blocInitial,
                //   event: GetPopularMovie(),
                // ),
                const Text("RESULTS"),
                SizedBox(height: responsive.hp(3)),
                BlocBuilder<BlocMovieBloc, BlocMovieState>(
                  builder: (context, state) {
                    return Container(
                      width: 400,
                      height: 500,
                      child: Column(
                        children: [
                          SizedBox(
                              height: 40,
                              child: CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                activeColor: Colors.purple,
                                title: Text("Popular",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700])),
                                value: checkPopular,
                                onChanged: (newValue) {
                                  checkPopular = newValue!;
                                  blocInitial.add(GetPopularMovie(checkPopular));
                                },
                              )),
                          (state is MovieLoading)
                              ? _buildLoading()
                              : gridMovie(context, state.popularModel)
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        )));
  }

  Widget gridMovie(BuildContext context, List<PopularModel> listmovie) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: listmovie.length,
        itemBuilder: (BuildContext context, int index) {
          return  Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.blue,
                      width: 100,
                      height: 120,
                      child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => DetallefotoPage(
                            //             lecturaData: lectura[0],
                            //             index: index,
                            //             nombreImage: nombreImage)));
                          },
                          child: Center(child: Text(listmovie[index].title!))),
                    ),
                  ),
                );
        },
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}

// class CheckBox extends StatefulWidget {
//   CheckBox({
//     Key? key,
//     required this.checkitem,
//     required this.title,
//     required this.blocInitial,
//     required this.state1,
//     // required this.event,
//   }) : super(key: key);

//   bool checkitem;
//   String title;
//   BlocMovieBloc blocInitial;
//   //dynamic event;
//   BlocMovieState state1;
//   @override
//   State<CheckBox> createState() => _CheckBoxState();
// }

// class _CheckBoxState extends State<CheckBox> {
//   bool chhh;
//   @override
//   void initState() {
//     chhh=widget.state1;
//     if(widget.state1 is MovieCheckState){
//       widget.state1.
//     }
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
    
             
//     return SizedBox(
//         height: 40,
//         child: CheckboxListTile(
//           contentPadding: EdgeInsets.zero,
//           controlAffinity: ListTileControlAffinity.leading,
//           activeColor: Colors.purple,
//           title: Text(widget.title,
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[700])),
//           value: 
//               : widget.checkitem,
//           // widget.checkitem,
//           onChanged: (newValue) {
//             widget.checkitem = newValue!;
//             CheckMovie(widget.checkitem);
//             if (widget.checkitem) {
//               widget.blocInitial.add(GetPopularMovie());
//             }
//           },
//         ));
//   }
// }
