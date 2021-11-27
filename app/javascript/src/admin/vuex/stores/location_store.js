import helpers from '../../helpers';

const locationStore = {
  namespaced: true,
  state: {
    locations: [],
    location: {},
    errors: {},
    bands: [],
    progress: '',
    pagination: {}
  },
  mutations: {
    one(state, data) {
      state.errors = {}
      state.location = data.location;
      return state;
    },
    many(state, data) {
      state.bands = data.bands;
      state.locations= data.locations;
      state.pagination = data.pagination;
      return state;
    },
    progress(state, step) {
      state.progress = step;
      return state.progress;
    },
    errors(state, data) {
      state.errors = helpers.showErrors(data);
      return state.errors;
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
    new(context, id) {
      $.ajax({
        url: `locations/new`,
        type: 'get',
        success: function(data) {
          context.commit('one', data)
        }
      })
    },
    create(context, form) {
      context.commit('progress', 'loading')
      return new Promise((resolve, reject) => {
        $.ajax({
          url: `locations`,
          type: 'post',
          data: {
            location: form
          },
          success: function(data) {
            context.commit('progress', 'success')
            resolve(data);
          },
          error: function(data) {
            context.commit('progress', 'failed')
            context.commit('errors', data)
          }
        })
      })
    },
    edit(context, id) {
      $.ajax({
        url: `locations/${id}/edit`,
        type: 'get',
        success: function(data) {
          context.commit('one', data);
        }
      });
    },
    update(context, location) {
      context.commit('progress', 'loading')
      $.ajax({
        url: `locations/${location.id}`,
        type: 'put',
        data: {
          location: location
        },
        success: function(data) {
          context.commit('progress', 'success')
          context.commit('one', data);
        },
        error: function(data) {
          context.commit('progress', 'failed')
          context.commit('errors', data);
        }
      })
    },
    destroy(context, location_id) {
      return new Promise((resolve, reject) => {
        $.ajax({
          url: `locations/${location_id}`,
          type: 'delete',
          success: function(data) {
            resolve(data);
          },
          error: function(data) {
            reject(data);
          }
        });
      });
    }
  }
};

export default locationStore;
