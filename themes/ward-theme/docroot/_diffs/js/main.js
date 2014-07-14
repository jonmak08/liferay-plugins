AUI().ready(
  'liferay-hudcrumbs', 'liferay-navigation-interaction', 'liferay-sign-in-modal',
  function(A) {
    var navigation = A.one('#navigation');

    if (navigation) {
      navigation.plug(Liferay.NavigationInteraction);
    }

    var siteBreadcrumbs = A.one('#breadcrumbs');

    if (siteBreadcrumbs) {
      siteBreadcrumbs.plug(A.Hudcrumbs);
    }

    var signIn = A.one('li.sign-in a');

    if (signIn && signIn.getData('redirect') !== 'true') {
      signIn.plug(Liferay.SignInModal);
    }
  }
);

// Date picker
YUI({ lang: 'en' }).use(
  'aui-datepicker',
  function(Y) {
    var datepicker = new Y.DatePicker(
      {
        trigger: '#input-datepicker',
        // trigger: '#picker-btn',
        mask: '%a, %b %d, %Y',
        popover: {
          toolbars: {
            header: [[
              {
                icon:'icon-trash',
                label: 'Clear',
                on: {
                  click: function() {
                    datepicker.clearSelection();
                  }
                }
              },
              {
                icon:'icon-globe',
                label: 'Travel date',
                on: {
                  click: function() {
                    datepicker.clearSelection();
                    datepicker.selectDates(new Date());
                  }
                }
              }
            ]]
          },
          zIndex: 1
        }
      }
    );
  }
);

// Image cropper
YUI().use(
  'aui-image-cropper',
  function(Y) {
    var imageCropper = new Y.ImageCropper(
      {
        srcNode: '#image',
        x: 100,
        y: 100
      }
    ).render();

    var statusTPL = '<strong class="x">x: {x}</strong><strong class="y">y: {y}</strong><strong class="height">height: {height}</strong><strong class="width">width: {width}</strong>';

    var updateImage = function() {
      var cropRegion = imageCropper.get('region');

      croppedImage.setStyles(
        {
          'backgroundPosition': (-cropRegion.x) + 'px ' + (-cropRegion.y) + 'px',
          height: cropRegion.height,
          width: cropRegion.width
        }
      );

      croppedImage.html(Y.Lang.sub(statusTPL, cropRegion));
    };

    imageCropper.after(
      'crop',
      function(event) {
        updateImage();
      }
    );

    var croppedImage = Y.one('#croppedImage');

    var croppedStatus = Y.one('#croppedStatus');

    croppedImage.show();

    updateImage();

    Y.one('#cropLink').on(
      'click',
      function (event) {
        imageCropper.setAttrs(
          {
            cropHeight: 125,
            cropWidth: 390,
            x: 45,
            y: 5
          }
        );
      }
    );
  }
);