
# TODO:
# - ensure hotKeys are unique.

rtf_magic_string_pre = '{\rtf1\ansi\ansicpg1252\cocoartf1138\cocoasubrtf510
{\fonttbl\f0\fnil\fcharset0 FeSaCondStdDemi;}
{\colortbl;\red255\green255\blue255;\red230\green230\blue230;}
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\qc

\f0\b\fs144 \cf2 \CocoaLigature2 '

rtf_magic_string_post = '}'


xml.instruct! :xml, :version=>"1.0"
xml.RVPresentationDocument( "height"=>"768", "width"=>"1024", "versionNumber"=>"400", "docType"=>"0", 
	"creatorCode"=>"1349676880", "lastDateUsed"=> @song.updated_at.iso8601, # 2014-03-16T18:27:15Z // 2014-02-23T11:14:52GMT+01:00 // %FT%TGMT%z
	"usedCount"=>"0", "category"=>"Presentation",
	"resourcesDirectory"=>"", "backgroundColor"=>"0 0 0 1", "drawingBackgroundColor"=>"0", "notes"=>"", 
	"artist"=>"", "author"=>"", "album"=>"", "CCLIDisplay"=>"0", "CCLIArtistCredits"=>"", "CCLISongTitle"=> @song.title, 
	"CCLIPublisher"=>"", "CCLICopyrightInfo"=>"", "CCLILicenseNumber"=>"", ) {
  xml.slides( "containerClass" => "NSMutableArray") {
  	@song.verses.each do |verse|
    xml.RVDisplaySlide(  "backgroundColor"=>"0 0 0 0", "enabled"=>"1", "highlightColor"=>"0 0 1 1",
        "hotKey"=> verse.verse_type.shortcut_key, "label"=> verse.verse_type.name,
        "notes"=>"", "slideType"=>"1", "sort_index"=> verse.position, 
        "UUID"=> SecureRandom.uuid, "drawingBackgroundColor"=> "0",
        "serialization-array-index"=> "0"){
      xml.cues("containerClass"=>"NSMutableArray")
      xml.displayElements("containerClass"=>"NSMutableArray"){
      	xml.RVTextElement( "displayDelay"=>"0", "displayName"=>"", "locked"=>"0", "persistent"=>"0",
      	    "typeID"=>"0", "fromTemplate"=>"0", "bezelRadius"=>"0", "drawingFill"=>"0",
      	    "drawingShadow"=>"1", "drawingStroke"=>"0", "fillColor"=>"1 1 1 1", "rotation"=>"0",
      	    "source"=>"", "adjustsHeightToFit"=>"0", "verticalAlignment"=>"0",
      	    #"RTFData"=>"e1xydGYxXGFuc2lcYW5zaWNwZzEyNTJcY29jb2FydGYxMTM4XGNvY29hc3VicnRmNTEwCntcZm9udHRibFxmMFxmbmlsXGZjaGFyc2V0MCBGZVNhQ29uZFN0ZERlbWk7fQp7XGNvbG9ydGJsO1xyZWQyNTVcZ3JlZW4yNTVcYmx1ZTI1NTtccmVkMjMwXGdyZWVuMjMwXGJsdWUyMzA7fQpccGFyZFx0eDU2MFx0eDExMjBcdHgxNjgwXHR4MjI0MFx0eDI4MDBcdHgzMzYwXHR4MzkyMFx0eDQ0ODBcdHg1MDQwXHR4NTYwMFx0eDYxNjBcdHg2NzIwXHBhcmRpcm5hdHVyYWxccWMKClxmMFxiXGZzMTQ0IFxjZjIgXENvY29hTGlnYXR1cmUyIEFtYXppbmcgZ3JhY2UsXHVjMFx1ODIzMiBob3cgc3dlZXQgdGhlIHNvdW5kXHU4MjMyIHRoYXQgc2F2ZWQgYSB3cmV0Y2ggbGlrZSBtZVx1ODIzMiBJIG9uY2Ugd2FzIGxvc3QsIGJ1dCBub3cgSVwnOTJtIGZvdW5kLCB3YXMgYmxpbmQsIGJ1dCBub3cgSSBzZWV9",
      	    "RTFData"=> Base64.encode64(rtf_magic_string_pre + verse.content + rtf_magic_string_post),
      	    "serialization-array-index"=>"0") {
          xml.tag! ("_-RVRect3D-_position") #, "val of t", "x"=>"13.7926", "y"=>"7.264877", "z"=>"0", "width"=>"996.4149", "height"=>"753.4703")
          xml.tag! ("_-D-_serializedShadow") { #, "containerClass"=>"NSMutableDictionary", )
			xml.NSNumber("serialization-native-value"=>"3", "serialization-dictionary-key"=>"shadowBlurRadius")
			xml.NSColor("serialization-native-value"=>"0 0 0 1", "serialization-dictionary-key"=>"shadowColor")
			xml.NSMutableString("serialization-native-value"=>"{2.12132, -2.12132}", "serialization-dictionary-key"=>"shadowOffset")
          }
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
    xml.timeCues("containerClass"=>"NSMutableArray")
  }
  xml.bibleReference("containerClass"=>"NSMutableDictionary")
}
