

```python
import folium
'''
Creates web maps
Generates HTML, CSS, Javascript
print(dir(folium))
print(help(folium.Map))
'''

# Base map
map = folium.Map(location=[45, -93], zoom_start=6, tiles="Mapbox Bright")

# Define feature goup
fg = folium.FeatureGroup(name="My Map")

# Add markers to feature group
for coordinates in [[45, -93], [43, -92]]:
    fg.add_child(folium.Marker(location=coordinates, popup="This is a thing", icon=folium.Icon(color='green')))

# Add feature group to map
map.add_child(fg)

# Save map to file
map.save("Map1.html")
```