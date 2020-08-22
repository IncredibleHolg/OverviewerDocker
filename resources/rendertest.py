# This is a sample config file, meant to give you an idea of how to format your
# config file and what's possible.

# Define the path to your world here. 'My World' in this case will show up as
# the world name on the map interface. If you change it, be sure to also change
# the referenced world names in the render definitions below.
worlds['Testworld'] = "/WRK/testworld/"
texturepath = "/WRK/resourcepack"
#texturepath = "/home/hdunkel/WRK/Minecraft/diverses/new-vanilla-default.zip"

# Define where to put the output here.
outputdir = "/WRK/test-map"

# This is an item usually specified in a renders dictionary below, but if you
# set it here like this, it becomes the default for all renders that don't
# define it.
# Try "smooth_lighting" for even better looking maps!
rendermode = "lighting"
end_lighting = [Base(), EdgeLines(), Lighting(strength=0.5)]
end_smooth_lighting = [Base(), EdgeLines(), SmoothLighting(strength=0.5)]

renders["render1"] = {
        'world': 'Testworld',
        'title': 'Testworld',
}
