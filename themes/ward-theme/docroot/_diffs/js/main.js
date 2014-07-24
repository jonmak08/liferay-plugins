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


// // Image cropper
// YUI().use(
//   'aui-image-cropper',
//   function(Y) {
//     var imageCropper = new Y.ImageCropper(
//       {
//         srcNode: '#image',
//         x: 100,
//         y: 100
//       }
//     ).render();

//     var croppedImage = Y.one('#croppedImage');

//     if (croppedImage != null) {

//         var statusTPL = '<strong class="x">x: {x}</strong><strong class="y">y: {y}</strong><strong class="height">height: {height}</strong><strong class="width">width: {width}</strong>';

//         var updateImage = function() {
//           var cropRegion = imageCropper.get('region');

//           croppedImage.setStyles(
//             {
//               'backgroundPosition': (-cropRegion.x) + 'px ' + (-cropRegion.y) + 'px',
//               height: cropRegion.height,
//               width: cropRegion.width
//             }
//           );

//           croppedImage.html(Y.Lang.sub(statusTPL, cropRegion));
//         };

//         imageCropper.after(
//           'crop',
//           function(event) {
//             updateImage();
//           }
//         );        

//         var croppedStatus = Y.one('#croppedStatus');

//         croppedImage.show();

//         updateImage();

//         Y.one('#cropLink').on(
//           'click',
//           function (event) {
//             imageCropper.setAttrs(
//               {
//                 cropHeight: 125,
//                 cropWidth: 390,
//                 x: 45,
//                 y: 5
//               }
//             );
//           }
//         );
//       } // end if
//   }
// );

// Scroll to top button
$(function(){
 
    $(document).on( 'scroll', function(){
 
        if ($(window).scrollTop() > 100) {
            $('.scroll-top-wrapper').addClass('show');
        } else {
            $('.scroll-top-wrapper').removeClass('show');
        }
    });
 
    $('.scroll-top-wrapper').on('click', scrollToTop);
}); 
function scrollToTop() {
    verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;
    element = $('body');
    offset = element.offset();
    offsetTop = offset.top;
    $('html, body').animate({scrollTop: offsetTop}, 500, 'linear');
}

// // carousel
// YUI().use(
//   'aui-carousel',
//   function(Y) {
//     new Y.Carousel(
//       {
//         activeIndex: 'rand',
//         contentBox: '#myCarousel',
//         height: 300,
//         intervalTime: 5,
//         width: 1200
//       }
//     ).render();
//   }
// );


// // tabview
// YUI().use(
//   'aui-tabview',
//   function(Y) {
//     new Y.TabView(
//       {
//         children: [
//           {
//               content: '<br><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus dicta aspernatur beatae fuga neque cupiditate laudantium itaque pariatur deleniti tenetur modi voluptatem animi sunt eligendi nisi corporis expedita quaerat facilis.</p>',
//               label: 'Tab #1'
//           },
//           {
//               content: '<br><p>Doloremque beatae rem voluptate nulla perspiciatis atque laudantium nihil impedit molestiae fuga veritatis quibusdam nam maiores aliquid. Deserunt dolorum quas temporibus enim ex nihil nemo perspiciatis. Nisi deserunt rem id pariatur in nostrum?</p>',
//               label: 'Tab #2'
//           },
//           {
//               content: '<br><p>Aliquid ipsum asperiores alias temporibus autem impedit soluta ut id iure explicabo veritatis consectetur debitis eaque recusandae odit quas nobis maxime saepe. Incidunt amet obcaecati. Ducimus soluta unde repellat laboriosam fuga modi rem itaque!</p>',
//               label: 'Tab #3'
//           }
//        ],
//        srcNode: '#myTab',
//        stacked: true,
//        type: 'pills'
//       }
//     ).render();
//   }
// );