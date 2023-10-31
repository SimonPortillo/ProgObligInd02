fun flag(width-small-cross-1, height-small-cross-1, small-cross-x, small-cross-y, width-small-cross-2, height-small-cross-2, width-big-cross-1, height-big-cross-1, big-cross-x, big-cross-y, width-big-cross-2, height-big-cross-2, background-width, background-height, small-cross-color,big-cross-color,background-color) -> Image :

  
  
  if small-cross-color == "":
    
    #| Tegner kun det store korset |#
    
    overlay(overlay-xy(rectangle(width-big-cross-1, height-big-cross-1, "solid", big-cross-color), big-cross-x, big-cross-y,
        rectangle(width-big-cross-2, height-big-cross-2, "solid", big-cross-color)),
      rectangle(background-width, background-height, "solid", background-color))
  else:
    
    #| Tegner begge korsene |#
    
    overlay(overlay(overlay-xy(rectangle(width-small-cross-1, height-small-cross-1, "solid", small-cross-color), small-cross-x, small-cross-y ,
          rectangle(width-small-cross-2, height-small-cross-2, "solid", small-cross-color)), overlay-xy(rectangle(width-big-cross-1, height-big-cross-1, "solid", big-cross-color), big-cross-x, big-cross-y,
          rectangle(width-big-cross-2, height-big-cross-2, "solid", big-cross-color))),
      rectangle(background-width, background-height, "solid", background-color))
  
  end
end

#| Norge |#
flag(220, 20, 60, -70, 20, 160, 220, 40, 50, -60, 40, 160, 220, 160, "midnight-blue", "white", "firebrick")

#| Finland |#
flag(220, 20, 60, -70, 20, 110, 180, 30, 50, -40, 30, 110, 180, 110, "", "midnight-blue", "white")

#| Danmark |#
flag(220, 20, 60, -70, 20, 160, 370, 40, 120, -120, 40, 280, 370, 280, "", "white", "crimson")

#| Island |#
flag(250, 20, 80, -80, 20, 180, 250, 40, 70, -70, 40, 180, 250, 180, "crimson", "white", "royal-blue")

#| Sverige |#
flag(220, 20, 60, -70, 20, 160, 160, 20, 50, -40, 20, 100, 160, 100, "", "gold", "royal-blue")

#| Færøyene |#
flag(220, 20, 60, -70, 20, 160, 220, 40, 50, -60, 40, 160, 220, 160, "red", "royal-blue", "white")