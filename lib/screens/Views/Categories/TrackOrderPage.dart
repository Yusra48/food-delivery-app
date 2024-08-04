import 'package:flutter/material.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF180649),
              Color(0xFF3910AA),
              Color(0xFF240970),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Track order',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,width: 30),
              Text(
                'Order ID : 4544858266',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 5,width: 30),
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 20),
              _buildTimeline(),
              SizedBox(height: 20),
              Text(
                'Order Track',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              _buildOrderTrack(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        _buildTimelineItem("04:30pm", "Confirmed", true),
        _buildTimelineItem("04:38pm", "Preprocessing", true),
        _buildTimelineItem("04:42pm", "On the way", true),
        _buildTimelineItem("04:46pm", "Delivered", false),
      ],
    );
  }

  Widget _buildTimelineItem(String time, String status, bool isCompleted) {
    return Padding(padding: EdgeInsets.only(left: 190),
   child:  Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
              height: 20,
              width: 2,
              color: isCompleted ? Colors.white : Colors.grey,
            ),
            Icon(
              Icons.circle,
              size: 12,
              color: isCompleted ? Colors.white : Colors.grey,
            ),
            Container(
              height: 20,
              width: 2,
              color: isCompleted ? Colors.white : Colors.grey,
            ),
          ],
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 5),
            Text(
              status,
              style: TextStyle(
                color: isCompleted ? Colors.white : Colors.grey,
                fontSize: 16,
                fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
   ),
    );
  }

  Widget _buildOrderTrack() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepPurpleAccent,width: 2)
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_640.jpg'),
            radius: 30,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mr. Kemplas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '25 minutes on the way',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF03237C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            ),
            child: Text(
              'Call',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
