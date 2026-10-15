CLASS zcl_virtual_element_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_sadl_exit_calc_element_read.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_virtual_element_calc IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    CHECK NOT it_original_data IS INITIAL.

    DATA : lt_calculated_data TYPE STANDARD TABLE OF zi_cds_virtual_element WITH DEFAULT KEY.

    MOVE-CORRESPONDING it_original_data TO lt_calculated_data.

    LOOP AT lt_calculated_data ASSIGNING FIELD-SYMBOL(<flight>).
      <flight>-SeatsAvailable =  <flight>-MaximumSeats - <flight>-OccupiedSeats.
    ENDLOOP.

    MOVE-CORRESPONDING lt_calculated_data TO ct_calculated_data.

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    et_requested_orig_elements = VALUE #( BASE et_requested_orig_elements
                                          ( CONV #( 'MaximumSeats' ) )
                                          ( CONV #( 'OccupiedSeats' ) )
*                                          ( CONV #( 'FLDATE' ) )
                                        ).
  ENDMETHOD.

ENDCLASS.
