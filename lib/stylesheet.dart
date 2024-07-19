import 'package:flutter/cupertino.dart';

const Map<String, dynamic> stylesheet =
{
  "*colors": {
    "bu_red": 3422552319,
    "dogder_blue": 512819199,
    "white": 4294967295
  },

  "Scaffold": {
    "backgroundColor": "bu_red"
  },

  "AppBar": {
    "backgroundColor": "dogder_blue",
    "title": {
      "style": {
        "color": "white"
      }
    },
    "actions": {
      "icon": {
        "color": "white"
      }
    }
  },

  "HomeButton": {
    "SizedBox": {
      "width": 8.0
    }
  },

  "Center": {
    "Padding:": {
      "padding": EdgeInsets.all(20.0)
    }
  },

  "Column": {
    "mainAxisAlignment": MainAxisAlignment.center
  },

  "TextField": {
    "borderRadius": Radius.circular(10.0)
  },

  "SizedBox": {
    "height": 20.0
  },

  "Text": {
    "style": {
      "color": "white"
    }
  }
};
