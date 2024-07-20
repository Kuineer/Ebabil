import 'package:flutter/cupertino.dart';

const Map<String, dynamic> stylesheet =
{
  "*colors": {
    "bu_red": Color(0xFFCC0000),
    "light_gray": Color(0xFFE6E6E6),
    "dogder_blue": Color(0xFF1E90FF),
    "white": Color(0xFFFFFFFF)
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
  },

  "ListTile": {
    "subtitle": {
      "style": {
        "color": "light_gray"
      }
    }
  }
};
