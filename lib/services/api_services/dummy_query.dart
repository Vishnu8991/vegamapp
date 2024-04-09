class Apiddummy {
  static String queryHome = '''
  {
  homepage {
    blocks {
      data {
        id
        desktop_status
        desktop_status
        title
        mobile_status
        title
        show_title
        store
        store_label
        __typename
        # If SliderBlock is available, uncomment this block
        #... on SliderBlock{
        #  templateType
        #  slider_width
        #  autoplay
        #  show_slider_title
        #  autoplay_timeout
        #  autoplay_hover_pause
        #  show_dots
        #  banners {
        #    image
        #    layout
        #    link_info {
        #      category_id
        #      external_url
        #      link_type
        #      link_url
        #      open_tab
        #      page_id
        #      product_id
        #      product_sku
        #    }
        #  }
        #  sliders {
        #    position
        #    description
        #    start_date
        #    end_date
        #    slider_image
        #    link_info{
        #      link_type
        #      category_id
        #      link_url
        #      external_url
        #      product_id
        #      product_sku
        #    }
        #  }
        #}
        ... on BannerBlock {
          banner_template
          banneritems {
            image
            layout
            title
            position
            link_info {
              category_id
              external_url
              link_type
              link_url
              open_tab
              page_id
              product_id
              product_sku
            }
          }
        }
        # If ContentBlock is available, uncomment this block
        #...on ContentBlock{
        #  content
        #
        #}
        ... on ProductBlock {
          show_title
          product_type
          display_style
          products {
            __typename
            type_id
            name
            url_suffix
            url_key
            sku
            id
            #wishlistData{
            # wishlistItem
            #}
            stock_status
            rating_summary
            review_count
            categories {
              image
              name
              __typename
            }
            image {
              url
              label
              __typename
            }
            small_image {
              url
              label
              __typename
            }
            special_price
            price_range {
              minimum_price {
                regular_price {
                  value
                  currency
                }
                discount {
                  amount_off
                  percent_off
                }
              }
              maximum_price {
                regular_price {
                  value
                  currency
                }
                discount {
                  amount_off
                  percent_off
                }
              }
            }
            ... on ConfigurableProduct {
              configurable_options {
                id
                attribute_id_v2
                label
                position
                use_default
                attribute_code
                values {
                  uid
                  value_index
                  label
                  swatch_data {
                    value
                  }
                }
                product_id
              }
              variants {
                product {
                  id
                  name
                  sku
                  attribute_set_id
                  media_gallery {
                    url
                    label
                  }
                  ... on PhysicalProductInterface {
                    weight
                  }

                  price_range {
                    minimum_price {
                      regular_price {
                        value
                        currency
                      }
                    }
                    maximum_price {
                      regular_price {
                        value
                        currency
                      }
                      discount {
                        amount_off
                        percent_off
                      }
                    }
                  }
                }
                attributes {
                  uid
                  label
                  code
                  value_index
                }
              }
            }
          }

          __typename
        }
        ... on CategoryBlock {
          title
          category_info {
            category_id
            url_key
            image
            name
          }
          id
          mobile_status
          desktop_status
          show_title
          store
          store_label
        }

        # If CustomBlock is available, uncomment this block
        # ... on CustomBlock {
        #   description
        #   viewall_status
        #   image
        #   link_info {
        #     category_id
        #     external_url
        #     link_type
        #     link_url
        #     open_tab
        #     page_id
        #     product_id
        #     product_sku
        #   }
        #   products {
        #     name
        #   }
        # }

        # If PopUp is available, uncomment this block
        # ... on PopUp {
        #   popup_type
        #   popup_image
        #   click_url {
        #     link_type
        #     link_url
        #     external_url
        #     category_id
        #     page_id
        #     product_id
        #     product_sku
        #     page_id
        #   }
        #   video_thumbnail
        #   video_link
        #   block_identifier
        #   start_date
        #   end_date
        # }
      }
      page_info {
        current_page
        page_size
        total_pages
        __typename
      }
      total_count
      __typename
    }
  }
}

''';
}