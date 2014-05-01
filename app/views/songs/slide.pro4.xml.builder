
# TODO:
# - colors (highlightColor) for diferent slide types
# - Check for utf8 formatting, see: https://github.com/danthedeckie/OpenLP-To-ProPresenter5-Converter/blob/master/converter.py#L116

# DONE:
# - ensure hotKeys are unique.
# - ensure that the slides are getting imported in correct order.

rtf_magic_string_pre = '{\rtf1\ansi\ansicpg1252\cocoartf1138\cocoasubrtf510
{\fonttbl\f0\fnil\fcharset0 FeSaCondStdDemi;}
{\colortbl;\red255\green255\blue255;\red230\green230\blue230;}
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\qc

\f0\b\fs144 \cf2 \CocoaLigature2 '

rtf_magic_string_post = '}'


xml.instruct! :xml, :version=>"1.0"
xml.RVPresentationDocument( "height"=>"768", "width"=>"1024", "versionNumber"=>"400", "docType"=>"0", 
	"creatorCode"=>"1349676880",
	"lastDateUsed"=> @song.updated_at.strftime("%FT%TGMT%:z"), # 2014-02-23T11:14:52GMT+01:00 => not quite iso8601
	"usedCount"=>"0", "category"=>"Presentation",
	"resourcesDirectory"=>"", "backgroundColor"=>"0 0 0 1", "drawingBackgroundColor"=>"0", "notes"=>"", 
	"artist"=>"", "author"=>"", "album"=>"", "CCLIDisplay"=>"0", "CCLIArtistCredits"=>"", "CCLISongTitle"=> @song.title, 
	"CCLIPublisher"=>"", "CCLICopyrightInfo"=>"", "CCLILicenseNumber"=>"", ) {
  xml.slides( "containerClass" => "NSMutableArray") {
    prev_shortcut_key = []
    @song.verses.each_with_index do |verse, idx|
    cur_shortcut_key = verse.verse_type.shortcut_key
    if prev_shortcut_key.include? cur_shortcut_key
      cur_shortcut_key = ''
    else
      prev_shortcut_key << cur_shortcut_key
    end
    xml.RVDisplaySlide(  "backgroundColor"=>"0 0 0 0", "enabled"=>"1",
        "highlightColor"=>"0 0 1 1", #highlight color, is the frame color, useful for us. should come from the verse_type.
        "hotKey"=> cur_shortcut_key, "label"=> verse.verse_type.name,
        "notes"=>"", "slideType"=>"1", "sort_index"=> idx, 
        "UUID"=> SecureRandom.uuid, "drawingBackgroundColor"=> "0",
        "serialization-array-index"=> idx ){
      xml.cues("containerClass"=>"NSMutableArray")
      xml.displayElements("containerClass"=>"NSMutableArray"){
      	xml.RVTextElement( "displayDelay"=>"0", "displayName"=>"", "locked"=>"0", "persistent"=>"0",
            "typeID"=>"0", "fromTemplate"=>"0", "bezelRadius"=>"0", "drawingFill"=>"0",
            "drawingShadow"=>"1", "drawingStroke"=>"0", "fillColor"=>"1 1 1 1", "rotation"=>"0",
            "source"=>"", "adjustsHeightToFit"=>"0", "verticalAlignment"=>"0",
            "RTFData"=> Base64.strict_encode64( rtf_magic_string_pre + plain_to_rtf( verse.content ) + rtf_magic_string_post ),
      	    "serialization-array-index"=>"0") {
          xml.tag! "_-RVRect3D-_position", "x"=>"13.7926", "y"=>"7.264877", "z"=>"0", "width"=>"996.4149", "height"=>"753.4703"
          xml.tag! "_-D-_serializedShadow", "containerClass"=>"NSMutableDictionary" do
			xml.NSNumber("serialization-native-value"=>"3", "serialization-dictionary-key"=>"shadowBlurRadius")
			xml.NSColor("serialization-native-value"=>"0 0 0 1", "serialization-dictionary-key"=>"shadowColor")
			xml.NSMutableString("serialization-native-value"=>"{2.12132, -2.12132}", "serialization-dictionary-key"=>"shadowOffset")
          end
          xml.stroke("containerClass"=>"NSMutableDictionary"){
          	xml.NSColor("serialization-native-value"=>"0 0 0 1", "serialization-dictionary-key"=>"RVShapeElementStrokeColorKey")
          	xml.NSNumber("serialization-native-value"=>"1", "serialization-dictionary-key"=>"RVShapeElementStrokeWidthKey")
          }
        }
      }
    }
    end
  }
  xml.timeline( "timeOffSet"=>"0", "selectedMediaTrackIndex"=>"0", "unitOfMeasure"=>"60", "duration"=>"0", "loop"=>"0" ){
    xml.timeCues("containerClass"=>"NSMutableArray")
    xml.mediaTracks("containerClass"=>"NSMutableArray")
  }
  xml.bibleReference("containerClass"=>"NSMutableDictionary")
}
