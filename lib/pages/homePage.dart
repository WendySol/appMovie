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
  void dispose() {
    blocInitial.close();
    super.dispose();
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
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(height: responsive.hp(3)),

                // CheckBox(
                //   checkitem: checkRated,
                //   title: 'Rated',
                //   blocInitial: blocInitial,
                //   event: GetPopularMovie(),
                // ),

                SizedBox(height: responsive.hp(3)),
                BlocBuilder<BlocMovieBloc, BlocMovieState>(
                  builder: (context, state) {
                    return Container(
                      //  color: Colors.pink,
                      width: responsive.wp(90),
                      height: responsive.hp(80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "FILTERS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
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
                                  blocInitial
                                      .add(GetPopularMovie(checkPopular));
                                },
                              )),
                          SizedBox(height: responsive.hp(2)),
                          const Text("RESULTS",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: responsive.hp(3)),
                          (state is MovieLoading)
                              ? _buildLoading()
                              : gridMovie(
                                  context, responsive, state.popularModel)
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

  Widget gridMovie(BuildContext context, Responsive responsive,
      List<PopularModel> listmovie) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: listmovie.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                // width: responsive.wp(20),
                // height: responsive.hp(50),
                child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ));
                    },
                    child: Center(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/loading.gif',
                        image:
                            'http://image.tmdb.org/t/p/w500/${listmovie[index].posterPath}',
                        width: responsive.wp(38),
                        height: responsive.hp(22),
                        fit: BoxFit.cover,
                      ),

                      //         Image.network(
                      //   'http://image.tmdb.org/t/p/w500/${listmovie[index].posterPath}',
                      //   fit: BoxFit.fitWidth,
                      //   width: responsive.wp(40),
                      //   // height: responsive.hp(30),
                      // )
                    )),
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
