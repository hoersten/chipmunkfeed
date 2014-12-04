# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.Maps =
  init_map: ->
    google.setOnLoadCallback(Maps.drawRegionsMap)

  drawRegionsMap: ->
    center_lat  = $('#map_div').attr('data-center-lat');
    center_long = $('#map_div').attr('data-center-long');
    center_zoom = $('#map_div').attr('data-center-zoom');
    map = new google.maps.Map(document.getElementById('map_div'), {
      center: new google.maps.LatLng(center_lat, center_long),
      zoom: parseInt(center_zoom),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      zoomControlOptions: {
        style: google.maps.ZoomControlStyle.SMALL
      },
      heatmap: { enabled: false }
    });

    state    = $('#map_div').attr('data-state');
    county   = $('#map_div').attr('data-county');
    city     = $('#map_div').attr('data-city');
    cityLat  = $('#map_div').attr('data-city-lat');
    cityLong = $('#map_div').attr('data-city-long');
    state_layer = new google.maps.FusionTablesLayer();
    Maps.updateStateLayerQuery(state_layer, state);
    state_layer.setMap(map);
    if (city && cityLat && cityLong)
      cityLatlng = new google.maps.LatLng(cityLat, cityLong);
      marker = new google.maps.Marker({
        position: cityLatlng,
        map: map,
        title: city
      });
    if (county)
      layer  = new google.maps.FusionTablesLayer();
      Maps.updateCountyLayerQuery(layer, state, county);
      layer.setMap(map);

  updateCountyLayerQuery: (layer, state, county) ->
    where = "'State-County'= '" + state + "-" + county + "'";

    layer.setOptions({
      query: {
        select: 'geometry',
        from: '0IMZAFCwR-t7jZnVzaW9udGFibGVzOjIxMDIxNw',
        where: where
      },
      styles: [{
        where: where,
        polygonOptions: {
          fillColor: "#097664",
          strokeColor: "#097664"
        }
      }]
    });

  updateCityLayerQuery: (layer, state, city) ->
    where = "'State-County'= '" + state + "-" + city + "'";

    layer.setOptions({
      query: {
        select: 'geometry',
        from: '0IMZAFCwR-t7jZnVzaW9udGFibGVzOjIxMDIxNw',
        where: where
      }
    });

  updateStateLayerQuery: (layer, state) ->
    where = "id= '" + state + "'";

    layer.setOptions({
      query: {
        select: 'geometry',
        from: '17aT9Ud-YnGiXdXEJUyycH2ocUqreOeKGbzCkUw',
        where: where
      },
#      styles: [{
#        polygonOptions: {
#          fillColor: "#0b957e",
#          strokeColor: "#0b957e"
#        }
#      }],
      clickable: false
    });

jQuery ->
  if ($('.states.show').length > 0 || $('.counties.show').length > 0 || $('.cities.show').length > 0 || $('.counties.index').length > 0 || $('.cities.index').length > 0)
    Maps.init_map()
