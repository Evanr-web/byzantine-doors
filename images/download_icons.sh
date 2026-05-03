#!/bin/bash
# Public domain Byzantine icons from Wikimedia Commons
# All pre-1400 or photographically reproduced 2D PD works

# Baptism/Theophany icon - for Journey 09 (Mysteries)
curl -sL -o theophany-icon.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Baptism_of_Christ_icon_%28Kirillo-Belozersky%29.jpg/800px-Baptism_of_Christ_icon_%28Kirillo-Belozersky%29.jpg"

# Communion of the Apostles - Ohrid, 14th c - for Eucharist/Communion topics
curl -sL -o communion-apostles.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Communion_of_the_Apostles_%28Ohrid%29.jpg/800px-Communion_of_the_Apostles_%28Ohrid%29.jpg"

# St. John Chrysostom icon - for liturgy pages
curl -sL -o chrysostom-icon.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Ioann_Zlatoust.jpg/600px-Ioann_Zlatoust.jpg"

# Annunciation - Ustyug, 12th c - for Marian topics
curl -sL -o annunciation-ustyug.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Ustyug_Annunciation.jpg/573px-Ustyug_Annunciation.jpg"

# Entry into Jerusalem - for liturgical year
curl -sL -o entry-jerusalem.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Entry_into_Jerusalem_%28Novgorod_School%2C_15th_century%29.jpg/566px-Entry_into_Jerusalem_%28Novgorod_School%2C_15th_century%29.jpg"

# Crucifixion - Dionysiou monastery, 16th c
curl -sL -o crucifixion-icon.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Orthodox_Crucifixion_icon.jpg/480px-Orthodox_Crucifixion_icon.jpg"

# Ascension icon - Novgorod, 15th c
curl -sL -o ascension-icon.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Ascension_icon_%28Novgorod%2C_15th_c%29.jpg/544px-Ascension_icon_%28Novgorod%2C_15th_c%29.jpg"

# Hagia Sophia exterior - for East/West topics (distinct from interior)
curl -sL -o hagia-sophia-exterior.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Hagia_Sophia_Mars_2013.jpg/1024px-Hagia_Sophia_Mars_2013.jpg"

# Christ Pantocrator mosaic, Monreale Cathedral (12th c Norman-Byzantine)
curl -sL -o monreale-pantocrator.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Monreale_-_Mosaics_%28Christ%29.jpg/800px-Monreale_-_Mosaics_%28Christ%29.jpg"

# Desert of Judea - for fasting/desert pages
curl -sL -o judean-desert.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Judean_desert%2C_Wadi_Qelt.jpg/1024px-Judean_desert%2C_Wadi_Qelt.jpg"

# Basil the Great icon - for Holy Spirit / fasting
curl -sL -o basil-great-icon.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Vassily_SaintBasilCathedral_Moscow.jpg/489px-Vassily_SaintBasilCathedral_Moscow.jpg"

# Deesis row - Theophanes, 15th c
curl -sL -o deesis-theophanes.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Feofan_Grek._Deisus_chin._Spas..jpg/407px-Feofan_Grek._Deisus_chin._Spas..jpg"

# Prayer rope / komboskini
curl -sL -o prayer-rope.jpg "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Komboskini.jpg/800px-Komboskini.jpg"

echo "Downloads complete"
for f in *.jpg; do
  size=$(stat -f%z "$f" 2>/dev/null || stat -c%s "$f" 2>/dev/null)
  if [ "$size" -lt 5000 ]; then
    echo "WARNING: $f is very small ($size bytes) - may have failed"
  else
    echo "OK: $f ($size bytes)"
  fi
done
