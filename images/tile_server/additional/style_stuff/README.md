
The original carto style is change to a more monochrome color scheme and unnessesary layers are removed.

# Useful commands do extract colors from the style file
```bash
# extract fill colors from the render style
cat my_mapnik.xml | grep "fill=" | sed -e 's-.*fill=-fill=-' -e 's-.*255, 255, 255, .*--' | grep fill | awk '{print $1}' | sort | uniq > fill_colors.txt

# extract stroke colors from the render style
cat my_mapnik.xml | grep "stroke=" | sed -e 's-.*stroke="-stroke=-' | awk '{print $1}' | sort | uniq  > stroke_colors.txt

# concat the color files
cat stroke_colors.txt > colors.txt
cat fill_colors.txt >> colors.txt
cat colors.txt | sed -e 's-=- -' -e 's-"--g' | awk '{print $2}' | sort | uniq > unique_colors.txt 
```

