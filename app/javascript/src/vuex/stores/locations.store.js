const locationStore = {
  namespaced: true,
  state: {
    locations: [],
    location: {}
  },
  mutations: {
    one(state, data) {
      state.location = data.location;
      return state;
    },
    many(state, data) {
      state.locations= data.locations;
      return state;
    }
  },
  actions: {
    index(context, query) {
      $.ajax({
        url: `locations`,
        type: 'get',
        data: query,
        success: function(data) {
          context.commit('many', data)
        }
      })
    },
    show(context, id) {
      $.ajax({
        url: `locations/${id}`,
        type: 'get',
        success: function(data) {
          context.commit('one', data)
        }
      })
    },
  }
};

export default locationStore;
