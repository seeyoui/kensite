var current_active_ueitem = null;
function changeColor(color_value){
$('#1_599 .yead_bdc').css({'border-color':color_value});
$('#1_599 .yead_bgc').css({'background-color':color_value});
$('#1_598 .yead_bdc').css({'border-color':color_value});
$('#1_595 .yead_bdc').css({'border-color':color_value});
$('#1_595 .yead_bgc').css({'background-color':color_value});
$('#1_595 .yead_color').css({'color':color_value});
$('#1_594 .yead_bdtc').css({'border-top-color':color_value});
$('#1_594 .yead_color').css({'color':color_value});
$('#1_593 .yead_bgc').css({'background-color':color_value});
$('#1_593 .yead_color').css({'color':color_value});
$('#1_592 .yead_bgc').css({'background-color':color_value});
$('#1_587 .yead_bgc').css({'background-color':color_value});
$('#1_587 .yead_color').css({'color':color_value});
$('#1_586 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_586 .yead_bdtc').css({'border-top-color':color_value});
$('#1_586 .yead_color').css({'color':color_value});
$('#1_585 .yead_bdc').css({'border-color':color_value});
$('#1_585 .yead_bgc').css({'background-color':color_value});
$('#1_584 .yead_bdc').css({'border-color':color_value});
$('#1_584 .yead_bgc').css({'background-color':color_value});
$('#1_559 .yead_bdc').css({'border-color':color_value});
$('#1_559 .yead_color').css({'color':color_value});
$('#1_557 .yead_bgc').css({'background-color':color_value});
$('#1_556 .yead_bgc').css({'background-color':color_value});
$('#1_556 .yead_bdlc').css({'border-left-color':color_value});
$('#1_556 .yead_bdtc').css({'border-top-color':color_value});
$('#1_555 .yead_color').css({'color':color_value});
$('#1_554 .yead_bgc').css({'background-color':color_value});
$('#1_553 .yead_bgc').css({'background-color':color_value});
$('#1_551 .yead_bdc').css({'border-color':color_value});
$('#1_551 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_550 .yead_bdtc').css({'border-top-color':color_value});
$('#1_550 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_549 .yead_color').css({'color':color_value});
$('#1_548 .yead_color').css({'color':color_value});
$('#1_547 .yead_bdc').css({'border-color':color_value});
$('#1_547 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_547 .yead_color').css({'color':color_value});
$('#1_545 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_545 .yead_bdc').css({'border-color':color_value});
$('#1_544 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_544 .yead_color').css({'color':color_value});
$('#1_544 .yead_bgc').css({'background-color':color_value});
$('#1_538 .yead_bdlc').css({'border-left-color':color_value});
$('#1_538 .yead_bgc').css({'background-color':color_value});
$('#1_536 .yead_bgc').css({'background-color':color_value});
$('#1_536 .yead_bdtc').css({'border-top-color':color_value});
$('#1_536 .yead_color').css({'color':color_value});
$('#1_525 .yead_bgc').css({'background-color':color_value});
$('#1_525 .yead_bdtc').css({'border-top-color':color_value});
$('#1_525 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_524 .yead_bdc').css({'border-color':color_value});
$('#1_524 .yead_bgc').css({'background-color':color_value});
$('#1_524 .yead_color').css({'color':color_value});
$('#1_523 .yead_bgc').css({'background-color':color_value});
$('#1_523 .yead_color').css({'color':color_value});
$('#1_518 .yead_bgc').css({'background-color':color_value});
$('#1_501 .yead_bdtc').css({'border-top-color':color_value});
$('#1_501 .yead_color').css({'color':color_value});
$('#1_501 .yead_bdc').css({'border-color':color_value});
$('#1_493 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_493 .yead_bdtc').css({'border-top-color':color_value});
$('#1_492 .yead_bdtc').css({'border-top-color':color_value});
$('#1_492 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_492 .yead_color').css({'color':color_value});
$('#1_490 .yead_bdc').css({'border-color':color_value});
$('#1_490 .yead_color').css({'color':color_value});
$('#1_488 .yead_bgc').css({'background-color':color_value});
$('#1_488 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_486 .yead_bgc').css({'background-color':color_value});
$('#1_485 .yead_bgc').css({'background-color':color_value});
$('#1_476 .yead_bgc').css({'background-color':color_value});
$('#1_476 .yead_color').css({'color':color_value});
$('#1_474 .yead_bgc').css({'background-color':color_value});
$('#1_474 .yead_bdrc').css({'border-right-color':color_value});
$('#1_473 .yead_bgc').css({'background-color':color_value});
$('#1_473 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_473 .yead_color').css({'color':color_value});
$('#1_472 .yead_bdc').css({'border-color':color_value});
$('#1_472 .yead_bdtc').css({'border-top-color':color_value});
$('#1_472 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_472 .yead_color').css({'color':color_value});
$('#1_471 .yead_color').css({'color':color_value});
$('#1_470 .yead_color').css({'color':color_value});
$('#1_470 .yead_bgc').css({'background-color':color_value});
$('#1_466 .yead_bgc').css({'background-color':color_value});
$('#1_465 .yead_bgc').css({'background-color':color_value});
$('#1_464 .yead_bgc').css({'background-color':color_value});
$('#1_463 .yead_bgc').css({'background-color':color_value});
$('#1_461 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_439 .yead_bdc').css({'border-color':color_value});
$('#1_439 .yead_bgc').css({'background-color':color_value});
$('#1_439 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_433 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_433 .yead_bgc').css({'background-color':color_value});
$('#1_433 .yead_color').css({'color':color_value});
$('#1_432 .yead_bgc').css({'background-color':color_value});
$('#1_432 .yead_color').css({'color':color_value});
$('#1_431 .yead_bdc').css({'border-color':color_value});
$('#1_431 .yead_bgc').css({'background-color':color_value});
$('#1_404 .yead_bgc').css({'background-color':color_value});
$('#1_404 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_403 .yead_bgc').css({'background-color':color_value});
$('#1_403 .yead_color').css({'color':color_value});
$('#1_402 .yead_bgc').css({'background-color':color_value});
$('#1_401 .yead_bdlc').css({'border-left-color':color_value});
$('#1_400 .yead_bgc').css({'background-color':color_value});
$('#1_400 .yead_bdtc').css({'border-top-color':color_value});
$('#1_398 .yead_bgc').css({'background-color':color_value});
$('#1_398 .yead_color').css({'color':color_value});
$('#1_398 .yead_bdtc').css({'border-top-color':color_value});
$('#1_399 .yead_bgc').css({'background-color':color_value});
$('#1_397 .yead_bgc').css({'background-color':color_value});
$('#1_396 .yead_bdc').css({'border-color':color_value});
$('#1_396 .yead_bgc').css({'background-color':color_value});
$('#1_394 .yead_bgc').css({'background-color':color_value});
$('#1_395 .yead_color').css({'color':color_value});
$('#1_395 .yead_bdlc').css({'border-left-color':color_value});
$('#1_395 .yead_bdrc').css({'border-right-color':color_value});
$('#1_395 .yead_bdtc').css({'border-top-color':color_value});
$('#1_393 .yead_bgc').css({'background-color':color_value});
$('#1_392 .yead_bgc').css({'background-color':color_value});
$('#1_392 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_392 .yead_bdlc').css({'border-left-color':color_value});
$('#1_392 .yead_bdrc').css({'border-right-color':color_value});
$('#1_391 .yead_bdrc').css({'border-right-color':color_value});
$('#1_391 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_391 .yead_bdtc').css({'border-top-color':color_value});
$('#1_391 .yead_color').css({'color':color_value});
$('#1_390 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_390 .yead_bdtc').css({'border-top-color':color_value});
$('#1_390 .yead_color').css({'color':color_value});
$('#1_389 .yead_color').css({'color':color_value});
$('#1_388 .yead_color').css({'color':color_value});
$('#1_387 .yead_bgc').css({'background-color':color_value});
$('#1_387 .yead_color').css({'color':color_value});
$('#1_385 .yead_bdc').css({'border-color':color_value});
$('#1_384 .yead_bgc').css({'background-color':color_value});
$('#1_383 .yead_bdc').css({'border-color':color_value});
$('#1_383 .yead_bgc').css({'background-color':color_value});
$('#1_383 .yead_color').css({'color':color_value});
$('#1_381 .yead_bdc').css({'border-color':color_value});
$('#1_381 .yead_color').css({'color':color_value});
$('#1_379 .yead_bgc').css({'background-color':color_value});
$('#1_378 .yead_bdtc').css({'border-top-color':color_value});
$('#1_378 .yead_bdlc').css({'border-left-color':color_value});
$('#1_378 .yead_bdrc').css({'border-right-color':color_value});
$('#1_378 .yead_color').css({'color':color_value});
$('#1_375 .yead_bdtc').css({'border-top-color':color_value});
$('#1_375 .yead_bdlc').css({'border-left-color':color_value});
$('#1_375 .yead_bdrc').css({'border-right-color':color_value});
$('#1_367 .yead_bgc').css({'background-color':color_value});
$('#1_367 .yead_color').css({'color':color_value});
$('#1_309 .yead_color').css({'color':color_value});
$('#1_306 .yead_bdc').css({'border-color':color_value});
$('#1_306 .yead_bgc').css({'background-color':color_value});
$('#1_305 .yead_bdc').css({'border-color':color_value});
$('#1_305 .yead_bgc').css({'background-color':color_value});
$('#1_304 .yead_color').css({'color':color_value});
$('#1_304 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_303 .yead_bdc').css({'border-color':color_value});
$('#1_303 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_302 .yead_bdc').css({'border-color':color_value});
$('#1_302 .yead_bgc').css({'background-color':color_value});
$('#1_302 .yead_color').css({'color':color_value});
$('#1_301 .yead_bgc').css({'background-color':color_value});
$('#1_301 .yead_bdlc').css({'border-left-color':color_value});
$('#1_300 .yead_bdc').css({'border-color':color_value});
$('#1_300 .yead_color').css({'color':color_value});
$('#1_299 .yead_bgc').css({'background-color':color_value});
$('#1_299 .yead_color').css({'color':color_value});
$('#1_298 .yead_bdc').css({'border-color':color_value});
$('#1_298 .yead_color').css({'color':color_value});
$('#1_297 .yead_bgc').css({'background-color':color_value});
$('#1_297 .yead_color').css({'color':color_value});
$('#1_296 .yead_color').css({'color':color_value});
$('#1_293 .yead_bdc').css({'border-color':color_value});
$('#1_291 .yead_bdc').css({'border-color':color_value});
$('#1_291 .yead_color').css({'color':color_value});
$('#1_290 .yead_bdc').css({'border-color':color_value});
$('#1_290 .yead_bgc').css({'background-color':color_value});
$('#1_284 .yead_bdc').css({'border-color':color_value});
$('#1_284 .yead_bgc').css({'background-color':color_value});
$('#1_276 .yead-bd').css({'border-color':color_value});
$('#1_276 .yead-bg').css({'background-color':color_value});
$('#1_265 .yead').css({'border-top-color':color_value});
$('#1_265 .yead2').css({'background-color':color_value});
$('#1_264 .yead').css({'border-top-color':color_value});
$('#1_264 .yead').css({'border-bottom-color':color_value});
$('#1_259 .yead').css({'border-color':color_value});
$('#1_254 .yead').css({'background-color':color_value});
$('#1_249 .yead').css({'background-color':color_value});
$('#1_249 .yead').css({'border-color':color_value});
$('#1_220 .yead').css({'border-top-color':color_value});
$('#1_220 .yead1').css({'background-color':color_value});
$('#1_219 .yead').css({'border-left-color':color_value});
$('#1_219 .yead').css({'border-bottom-color':color_value});
$('#1_219 .yead1').css({'border-color':color_value});
$('#1_219 .yead2').css({'background-color':color_value});
$('#1_218 .yead').css({'border-top-color':color_value});
$('#1_218 .yead1').css({'background-color':color_value});
$('#1_218 .yead1').css({'border-color':color_value});
$('#1_217 .yead').css({'border-color':color_value});
$('#1_217 .yead').css({'background-color':color_value});
$('#1_217 .yead1').css({'border-bottom-color':color_value});
$('#1_217 .yead2').css({'border-color':color_value});
$('#1_217 .yead2').css({'color':color_value});
$('#1_217 .yead3').css({'border-color':color_value});
$('#1_217 .yead4').css({'color':color_value});
$('#1_217 .yead4').css({'border-color':color_value});
$('#1_216 .yead').css({'border-top-color':color_value});
$('#1_216 .yead1').css({'border-top-color':color_value});
$('#1_216 .yead2').css({'background-color':color_value});
$('#1_216 .yead3').css({'background-color':color_value});
$('#1_216 .yead4').css({'background-color':color_value});
$('#1_216 .yead5').css({'background-color':color_value});
$('#1_216 .yead6').css({'border-top-color':color_value});
$('#1_216 .yead7').css({'border-top-color':color_value});
$('#1_216 .yead8').css({'border-top-color':color_value});
$('#1_216 .yead9').css({'border-top-color':color_value});
$('#1_215 .yead').css({'background-color':color_value});
$('#1_214 .yead').css({'border-color':color_value});
$('#1_214 .yead').css({'background-color':color_value});
$('#1_214 .yead1').css({'border-color':color_value});
$('#1_214 .yead1').css({'background-color':color_value});
$('#1_209 .main').css({'background-color':color_value});
$('#1_209 .main2').css({'border-bottom-color':color_value});
$('#1_209 .main2').css({'border-top-color':color_value});
$('#1_208 .main').css({'color':color_value});
$('#1_208 .main').css({'border-color':color_value});
$('#1_208 .main2').css({'border-color':color_value});
$('#1_208 .main3').css({'border-bottom-color':color_value});
$('#1_208 .main3').css({'border-top-color':color_value});
$('#1_188 .yead_bd').css({'border-color':color_value});
$('#1_188 .yead_bg').css({'background-color':color_value});
$('#1_188 .yead_bdr').css({'border-right-color':color_value});
$('#1_188 .yead_bdt').css({'border-top-color':color_value});
$('#1_165 .main').css({'border-color':color_value});
$('#1_165 .main2').css({'border-color':color_value});
$('#1_165 .main2').css({'background-color':color_value});
$('#1_165 .main3').css({'border-top-color':color_value});
$('#1_165 .main3').css({'border-bottom-color':color_value});
$('#1_153 .main').css({'border-color':color_value});
$('#1_153 .main2').css({'color':color_value});
$('#1_153 .main2').css({'border-color':color_value});
$('#1_153 .main3').css({'border-color':color_value});
$('#1_153 .main4').css({'border-bottom-color':color_value});
$('#1_153 .main4').css({'border-top-color':color_value});
$('#1_148 .main').css({'color':color_value});
$('#1_146 .main').css({'border-color':color_value});
$('#1_146 .main').css({'color':color_value});
$('#1_146 .main2').css({'border-color':color_value});
$('#1_146 .main3').css({'border-color':color_value});
$('#1_146 .main4').css({'border-color':color_value});
$('#1_146 .main5').css({'border-color':color_value});
$('#1_146 .main6').css({'border-color':color_value});
$('#1_146 .main7').css({'border-color':color_value});
$('#1_146 .main8').css({'border-color':color_value});
$('#1_145 .main').css({'border-color':color_value});
$('#1_145 .main2').css({'background-color':color_value});
$('#1_145 .main3').css({'border-color':color_value});
$('#1_144 .main').css({'background-color':color_value});
$('#1_143 .main').css({'background-color':color_value});
$('#1_140 .main').css({'border-color':color_value});
$('#1_140 .main').css({'color':color_value});
$('#1_140 .main2').css({'border-color':color_value});
$('#1_139 .main').css({'border-color':color_value});
$('#1_139 .main2').css({'background-color':color_value});
$('#1_139 .main4').css({'border-color':color_value});
$('#1_139 .main5').css({'border-color':color_value});
$('#1_54 .main').css({'background-color':color_value});
$('#1_53 .main').css({'text-shadow':color_value});
$('#1_52 .main').css({'border-left-color':color_value});
$('#1_51 .main').css({'border-color':color_value});
$('#1_51 .main2').css({'background-color':color_value});
$('#1_51 .main3').css({'border-top-color':color_value});
$('#1_51 .main3').css({'border-bottom-color':color_value});
$('#1_51 .main3').css({'border-right-color':color_value});
$('#1_51 .main4').css({'border-top-color':color_value});
$('#1_51 .main4').css({'border-bottom-color':color_value});
$('#1_51 .main4').css({'border-left-color':color_value});
$('#1_50 .yead_bdlc').css({'border-left-color':color_value});
$('#1_50 .yead_color').css({'color':color_value});
$('#1_49 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_49 .yead_color').css({'color':color_value});
$('#1_48 .yead_color').css({'color':color_value});
$('#1_48 .yead_bdbc').css({'border-bottom-color':color_value});
$('#1_47 .main').css({'background-color':color_value});
$('#1_46 .main').css({'background-color':color_value});
$('#1_45 .main').css({'background-color':color_value});
$('#1_44 .main').css({'border-bottom-color':color_value});
$('#1_44 .main2 ').css({'border-bottom-color':color_value});
$('#1_43 .main').css({'background-color':color_value});
$('#1_43 .main2').css({'color':color_value});
$('#1_43 .main3').css({'border-bottom-color':color_value});
$('#1_42 .main').css({'background-color':color_value});
$('#1_42 .main2').css({'border-bottom-color':color_value});
$('#1_42 .main3').css({'color':color_value});
$('#1_41 .main').css({'border-top-color':color_value});
$('#1_41 .main').css({'border-bottom-color':color_value});
$('#1_41 .main2').css({'border-top-color':color_value});
$('#1_41 .main2').css({'border-bottom-color':color_value});
$('#1_40 .main').css({'color':color_value});
$('#1_40 .main2').css({'background-color':color_value});
$('#1_39 .main').css({'color':color_value});
$('#1_39 .main2').css({'background-color':color_value});
$('#1_38 .main').css({'background-color':color_value});
$('#1_38 .main2').css({'color':color_value});
$('#1_37 .main').css({'border-top-color':color_value});
$('#1_37 .main').css({'border-bottom-color':color_value});
$('#1_36 .main').css({'border-bottom-color':color_value});
$('#1_36 .main2').css({'background-color':color_value});
$('#1_36 .main3').css({'border-bottom-color':color_value});
$('#1_36 .main').css({'color':color_value});
$('#1_35 .main').css({'background-color':color_value});
$('#1_34 .main_3').css({'background-color':color_value});
$('#1_34 .main_4').css({'border-left-color':color_value});
$('#1_34 .main_4').css({'border-right-color':color_value});
$('#1_33 .main1').css({'border-color':color_value});
$('#1_33 .main2').css({'background-color':color_value});
$('#1_32 .main').css({'border-top-color':color_value});
$('#1_32 .main').css({'color':color_value});
$('#1_31 .main').css({'border-top-color':color_value});
$('#1_31 .main2').css({'background-color':color_value});
$('#1_30 .main').css({'border-color':color_value});
$('#1_30 .main2').css({'color':color_value});
$('#1_30 .main3').css({'background-color':color_value});
$('#1_30 .main4').css({'border-color':color_value});
$('#1_1 .main').css({'background-color':color_value});
$('#2_596 .yead_bdc').css({'border-color':color_value});
$('#2_572 .yead_bgc').css({'background-color':color_value});
$('#2_572 .yead_bdc').css({'border-color':color_value});
$('#2_543 .yead_bdc').css({'border-color':color_value});
$('#2_543 .yead_color').css({'color':color_value});
$('#2_540 .yead_bdc').css({'border-color':color_value});
$('#2_535 .yead_bdc').css({'border-color':color_value});
$('#2_534 .yead_bdlc').css({'border-left-color':color_value});
$('#2_534 .yead_bdc').css({'border-color':color_value});
$('#2_534 .yead_color').css({'color':color_value});
$('#2_517 .yead_bdc').css({'border-color':color_value});
$('#2_497 .yead_bgc').css({'background-color':color_value});
$('#2_496 .yead_bdc').css({'border-color':color_value});
$('#2_496 .yead_color').css({'color':color_value});
$('#2_495 .yead_bdc').css({'border-color':color_value});
$('#2_495 .yead_color').css({'color':color_value});
$('#2_494 .yead_bdc').css({'border-color':color_value});
$('#2_494 .yead_color').css({'color':color_value});
$('#2_491 .yead_bdc').css({'border-color':color_value});
$('#2_491 .yead_bgc').css({'background-color':color_value});
$('#2_491 .yead_bdlc').css({'border-left-color':color_value});
$('#2_487 .yead_bdc').css({'border-color':color_value});
$('#2_484 .yead_bdc').css({'border-color':color_value});
$('#2_484 .yead_color').css({'color':color_value});
$('#2_482 .yead_bdc').css({'border-color':color_value});
$('#2_482 .yead_bgc').css({'background-color':color_value});
$('#2_482 .yead_color').css({'color':color_value});
$('#2_480 .yead_bdc').css({'border-color':color_value});
$('#2_479 .yead_bgc').css({'background-color':color_value});
$('#2_478 .yead_bdc').css({'border-color':color_value});
$('#2_478 .yead_bgc').css({'background-color':color_value});
$('#2_477 .yead_bdc').css({'border-color':color_value});
$('#2_477 .yead_bgc').css({'background-color':color_value});
$('#2_475 .yead_bdc').css({'border-color':color_value});
$('#2_475 .yead_color').css({'color':color_value});
$('#2_468 .yead_bdc').css({'border-color':color_value});
$('#2_468 .yead_bgc').css({'background-color':color_value});
$('#2_467 .yead_bdc').css({'border-color':color_value});
$('#2_467 .yead_color').css({'color':color_value});
$('#2_437 .yead_color').css({'color':color_value});
$('#2_437 .yead_bdtc').css({'border-top-color':color_value});
$('#2_437 .yead_bdbc').css({'border-bottom-color':color_value});
$('#2_436 .yead_bdbc').css({'border-bottom-color':color_value});
$('#2_436 .yead_bdtc').css({'border-top-color':color_value});
$('#2_436 .yead_color').css({'color':color_value});
$('#2_436 .yead_bgc').css({'background-color':color_value});
$('#2_435 .yead_bdrc').css({'border-right-color':color_value});
$('#2_435 .yead_bdlc').css({'border-left-color':color_value});
$('#2_435 .yead_bgc').css({'background-color':color_value});
$('#2_435 .yead_color').css({'color':color_value});
$('#2_434 .yead_bdc').css({'border-color':color_value});
$('#2_434 .yead_bgc').css({'background-color':color_value});
$('#2_434 .yead_bdtc').css({'border-top-color':color_value});
$('#2_421 .yead_bgc').css({'background-color':color_value});
$('#2_420 .yead_bdtc').css({'border-top-color':color_value});
$('#2_420 .yead_bgc').css({'background-color':color_value});
$('#2_419 .yead_bdc').css({'border-color':color_value});
$('#2_418 .yead_bdc').css({'border-color':color_value});
$('#2_418 .yead_bdtc').css({'border-top-color':color_value});
$('#2_418 .yead_bdbc').css({'border-bottom-color':color_value});
$('#2_418 .yead_color').css({'color':color_value});
$('#2_417 .yead_bgc').css({'background-color':color_value});
$('#2_416 .yead_bdc').css({'border-color':color_value});
$('#2_416 .yead_bgc').css({'background-color':color_value});
$('#2_415 .yead_bgc').css({'background-color':color_value});
$('#2_414 .yead_bdc').css({'border-color':color_value});
$('#2_413 .yead_bdc').css({'border-color':color_value});
$('#2_413 .yead_color').css({'color':color_value});
$('#2_412 .yead_bdc').css({'border-color':color_value});
$('#2_412 .yead_bgc').css({'background-color':color_value});
$('#2_412 .yead_bdtc').css({'border-top-color':color_value});
$('#2_412 .yead_bdrc').css({'border-right-color':color_value});
$('#2_412 .yead_bdlc').css({'border-left-color':color_value});
$('#2_412 .yead_bdbc').css({'border-bottom-color':color_value});
$('#2_411 .yead_bdc').css({'border-color':color_value});
$('#2_411 .yead_bdtc').css({'border-top-color':color_value});
$('#2_411 .yead_bdlc').css({'border-left-color':color_value});
$('#2_411 .yead_bdrc').css({'border-right-color':color_value});
$('#2_411 .yead_bdbc').css({'border-bottom-color':color_value});
$('#2_410 .yead_bdc').css({'border-color':color_value});
$('#2_410 .yead_bdtc').css({'border-top-color':color_value});
$('#2_410 .yead_color').css({'color':color_value});
$('#2_409 .yead_bgc').css({'background-color':color_value});
$('#2_408 .yead_bgc').css({'background-color':color_value});
$('#2_407 .yead_bdc').css({'border-color':color_value});
$('#2_407 .yead_bgc').css({'background-color':color_value});
$('#2_406 .yead_bdc').css({'border-color':color_value});
$('#2_406 .yead_bdrc').css({'border-right-color':color_value});
$('#2_406 .yead_bdbc').css({'border-bottom-color':color_value});
$('#2_406 .yead_bgc').css({'background-color':color_value});
$('#2_405 .yead_bgc').css({'background-color':color_value});
$('#2_377 .yead_bdc').css({'border-color':color_value});
$('#2_376 .yead_bdlc').css({'border-left-color':color_value});
$('#2_376 .yead_bgc').css({'background-color':color_value});
$('#2_374 .yead_bgc').css({'background-color':color_value});
$('#2_374 .yead_color').css({'color':color_value});
$('#2_374 .yead_bdc').css({'border-color':color_value});
$('#2_373 .yead_bgc').css({'background-color':color_value});
$('#2_373 .yead_color').css({'color':color_value});
$('#2_366 .yead_bdc').css({'border-color':color_value});
$('#2_366 .yead_color').css({'color':color_value});
$('#2_327 .yead_bdc').css({'border-color':color_value});
$('#2_326 .yead_bgc').css({'background-color':color_value});
$('#2_325 .yead_bdc').css({'border-color':color_value});
$('#2_324 .yead_bgc').css({'background-color':color_value});
$('#2_323 .yead_bdc').css({'border-color':color_value});
$('#2_323 .yead_bgc').css({'background-color':color_value});
$('#2_323 .yead_color').css({'color':color_value});
$('#2_322 .yead_bdc').css({'border-color':color_value});
$('#2_322 .yead_bgc').css({'background-color':color_value});
$('#2_322 .yead_bdrc').css({'border-right-color':color_value});
$('#2_321 .yead_bdc').css({'border-color':color_value});
$('#2_321 .yead_bgc').css({'background-color':color_value});
$('#2_321 .yead_bdlc').css({'border-left-color':color_value});
$('#2_320 .yead_bdc').css({'border-color':color_value});
$('#2_320 .yead_bgc').css({'background-color':color_value});
$('#2_319 .yead_bdc').css({'border-color':color_value});
$('#2_319 .yead_bgc').css({'background-color':color_value});
$('#2_318 .yead_bdc').css({'border-color':color_value});
$('#2_318 .yead_bdrc').css({'border-right-color':color_value});
$('#2_318 .yead_bgc').css({'background-color':color_value});
$('#2_317 .yead_bgc').css({'background-color':color_value});
$('#2_317 .yead_bdbc').css({'border-bottom-color':color_value});
$('#2_316 .yead_bdc').css({'border-color':color_value});
$('#2_316 .yead_bdtc').css({'border-top-color':color_value});
$('#2_315 .yead_bgc').css({'background-color':color_value});
$('#2_314 .yead_bdc').css({'border-color':color_value});
$('#2_314 .yead_bgc').css({'background-color':color_value});
$('#2_313 .yead_bdlc').css({'border-left-color':color_value});
$('#2_312 .yead_color').css({'color':color_value});
$('#2_311 .yead_color').css({'color':color_value});
$('#2_310 .yead_bdc').css({'border-color':color_value});
$('#2_310 .yead_bgc').css({'background-color':color_value});
$('#2_266 .yead').css({'border-color':color_value});
$('#2_261 .yead').css({'border-color':color_value});
$('#2_261 .yead2').css({'border-left-color':color_value});
$('#2_261 .yead2').css({'border-top-color':color_value});
$('#2_258 .yead').css({'border-color':color_value});
$('#2_258 .yead2').css({'color':color_value});
$('#2_257 .yead').css({'border-color':color_value});
$('#2_224 .yead').css({'border-color':color_value});
$('#2_213 .yead').css({'border-top-color':color_value});
$('#2_213 .yead').css({'border-bottom-color':color_value});
$('#2_213 .yead1').css({'background-color':color_value});
$('#2_213 .yead1').css({'border-color':color_value});
$('#2_212 .yead').css({'border-color':color_value});
$('#2_212 .yead1').css({'border-color':color_value});
$('#2_212 .yead2').css({'border-color':color_value});
$('#2_212 .yead2').css({'background-color':color_value});
$('#2_212 .yead3').css({'border-color':color_value});
$('#2_212 .yead3').css({'background-color':color_value});
$('#2_212 .yead4').css({'border-color':color_value});
$('#2_212 .yead5').css({'border-color':color_value});
$('#2_212 .yead5').css({'background-color':color_value});
$('#2_212 .yead6').css({'border-color':color_value});
$('#2_212 .main').css({'border-color':color_value});
$('#2_212 .yead7').css({'border-color':color_value});
$('#2_212 .yead7').css({'background-color':color_value});
$('#2_212 .yead8').css({'border-color':color_value});
$('#2_212 .yead8').css({'background-color':color_value});
$('#2_212 .yead9').css({'border-color':color_value});
$('#2_212 .yead10').css({'border-color':color_value});
$('#2_212 .yead10').css({'background-color':color_value});
$('#2_212 .yead11').css({'border-color':color_value});
$('#2_212 .yead11').css({'background-color':color_value});
$('#2_210 .main').css({'background-color':color_value});
$('#2_207 .main').css({'border-color':color_value});
$('#2_207 .main2').css({'background-color':color_value});
$('#2_207 .main3').css({'border-top-color':color_value});
$('#2_207 .main3').css({'border-right-color':color_value});
$('#2_207 .main4').css({'border-left-color':color_value});
$('#2_207 .main4').css({'border-top-color':color_value});
$('#2_206 .main').css({'border-color':color_value});
$('#2_206 .main2').css({'border-color':color_value});
$('#2_206 .main2').css({'background-color':color_value});
$('#2_206 .main3').css({'border-left-color':color_value});
$('#2_206 .main3').css({'border-right-color':color_value});
$('#2_205 .yead').css({'background-color':color_value});
$('#2_205 .yead2').css({'color':color_value});
$('#2_190 .main').css({'background-color':color_value});
$('#2_189 .main').css({'background-color':color_value});
$('#2_189 .main2').css({'border-color':color_value});
$('#2_189 .main3').css({'border-color':color_value});
$('#2_155 .main').css({'background-color':color_value});
$('#2_155 .main').css({'border-color':color_value});
$('#2_152 .main').css({'border-color':color_value});
$('#2_152 .main2').css({'border-color':color_value});
$('#2_152 .main3').css({'border-color':color_value});
$('#2_152 .main3').css({'color':color_value});
$('#2_152 .main4').css({'border-color':color_value});
$('#2_152 .main5').css({'border-color':color_value});
$('#2_152 .main6').css({'border-color':color_value});
$('#2_152 .main7').css({'border-color':color_value});
$('#2_152 .main7').css({'background-color':color_value});
$('#2_152 .main8').css({'border-color':color_value});
$('#2_152 .main9').css({'background-color':color_value});
$('#2_152 .main9').css({'border-color':color_value});
$('#2_151 .main').css({'border-color':color_value});
$('#2_151 .main2').css({'border-color':color_value});
$('#2_151 .main3').css({'border-color':color_value});
$('#2_151 .main4').css({'border-color':color_value});
$('#2_151 .main5').css({'border-color':color_value});
$('#2_151 .main6').css({'border-color':color_value});
$('#2_151 .main7').css({'border-color':color_value});
$('#2_83 .main').css({'color':color_value});
$('#2_82 .main').css({'border-color':color_value});
$('#2_82 .main2').css({'color':color_value});
$('#2_81 .main').css({'border-color':color_value});
$('#2_80 .main').css({'border-top-color':color_value});
$('#2_80 .main').css({'border-bottom-color':color_value});
$('#2_79 .main').css({'border-color':color_value});
$('#2_79 .s0001').css({'background-color':color_value});
$('#2_79 .s0002').css({'border-top-color':color_value});
$('#2_79 .s0002').css({'border-bottom-color':color_value});
$('#2_78 .main').css({'border-color':color_value});
$('#2_78 .main2').css({'background-color':color_value});
$('#2_78 .main3 ').css({'border-color':color_value});
$('#2_77 .main').css({'background-color':color_value});
$('#2_77 .main2').css({'border-color':color_value});
$('#2_76 .main').css({'background-color':color_value});
$('#2_76 .main2').css({'border-color':color_value});
$('#2_75 .main').css({'background-color':color_value});
$('#2_74 .main').css({'background-color':color_value});
$('#2_73 .main').css({'background-color':color_value});
$('#2_72 .main').css({'background-color':color_value});
$('#2_72 .main2').css({'border-color':color_value});
$('#2_71 .yead_bdc').css({'border-color':color_value});
$('#2_71 .yead_bgc').css({'background-color':color_value});
$('#2_70 .yead_bdc').css({'border-color':color_value});
$('#2_70 .yead_bdtc').css({'border-top-color':color_value});
$('#2_70 .yead_bgc').css({'background-color':color_value});
$('#2_68 .yead_bdc').css({'border-color':color_value});
$('#2_68 .yead_bdtc').css({'border-top-color':color_value});
$('#2_68 .yead_bgc').css({'background-color':color_value});
$('#2_67 .main').css({'background-color':color_value});
$('#2_67 .main2').css({'border-color':color_value});
$('#2_66 .main').css({'border-color':color_value});
$('#2_65 .main').css({'border-color':color_value});
$('#2_64 .main').css({'border-left-color':color_value});
$('#2_63 .main').css({'border-color':color_value});
$('#2_62 .main').css({'border-color':color_value});
$('#2_61 .main').css({'border-color':color_value});
$('#2_60 .main').css({'background-color':color_value});
$('#2_60 .main2').css({'border-color':color_value});
$('#2_59 .main').css({'background-color':color_value});
$('#2_58 .main').css({'border-color':color_value});
$('#2_57 .main').css({'border-color':color_value});
$('#2_57 .main2').css({'border-color':color_value});
$('#2_57 .main3').css({'border-color':color_value});
$('#2_57 .main4').css({'border-color':color_value});
$('#2_57 .main5').css({'border-color':color_value});
$('#2_56 .main').css({'background-color':color_value});
$('#2_55 .main').css({'color':color_value});
$('#10_498 .yead_bdrc').css({'border-right-color':color_value});
$('#10_498 .yead_bdlc').css({'border-left-color':color_value});
$('#10_462 .yead_bdc').css({'border-color':color_value});
$('#10_462 .yead_bdlc').css({'border-left-color':color_value});
$('#10_462 .yead_color').css({'color':color_value});
$('#10_440 .yead_bgc').css({'background-color':color_value});
$('#10_371 .yead_bdc').css({'border-color':color_value});
$('#10_370 .yead_bdc').css({'border-color':color_value});
$('#10_330 .yead_bdc').css({'border-color':color_value});
$('#10_330 .yead_bgc').css({'background-color':color_value});
$('#10_329 .yead_bgc').css({'background-color':color_value});
$('#10_328 .yead_bgc').css({'background-color':color_value});
$('#10_236 .yead').css({'background-color':color_value});
$('#10_230 .yead').css({'border-color':color_value});
$('#10_230 .yead').css({'background-color':color_value});
$('#10_230 .yead2').css({'border-color':color_value});
$('#10_230 .yead3').css({'border-color':color_value});
$('#10_230 .yead4').css({'border-color':color_value});
$('#10_230 .yead5').css({'border-color':color_value});
$('#10_230 .yead6').css({'border-color':color_value});
$('#10_230 .yead7').css({'border-color':color_value});
$('#10_230 .yead8').css({'border':color_value});
$('#10_230 .yead9').css({'border-color':color_value});
$('#10_230 .yead10').css({' border-color':color_value});
$('#10_230 .yead11').css({'border-color':color_value});
$('#10_230 .yead12').css({'border-color':color_value});
$('#10_229 .yead').css({'border-color':color_value});
$('#10_229 .yead2').css({'background-color':color_value});
$('#10_229 .yead3').css({'border-left-color':color_value});
$('#10_229 .yead3').css({'border-top-color':color_value});
$('#10_228 .yead').css({'background-color':color_value});
$('#10_227 .yead').css({'border-color':color_value});
$('#10_227 .yead2').css({'background-color':color_value});
$('#10_226 .yead').css({'background-color':color_value});
$('#10_225 .yead').css({'border-color':color_value});
$('#10_225 .yead').css({'background-color':color_value});
$('#10_225 .yead2').css({'border-color':color_value});
$('#10_225 .yead3').css({'border-color':color_value});
$('#10_225 .yead4').css({'border-color':color_value});
$('#10_225 .yead5').css({'border-color':color_value});
$('#10_199 .yead_bdc').css({'border-color':color_value});
$('#10_199 .yead_bgc').css({'background-color':color_value});
$('#10_157 .yead').css({'border-color':color_value});
$('#10_157 .yead2').css({'border-color':color_value});
$('#10_157 .yead2').css({'color':color_value});
$('#10_157 .yead3').css({'border-color':color_value});
$('#10_157 .yead4').css({'border-color':color_value});
$('#10_157 .yead5').css({'border-color':color_value});
$('#3_262 .yead_bdc ').css({'border-color':color_value});
$('#3_203 .main').css({'border-color':color_value});
$('#3_150 .main').css({'background-color':color_value});
$('#3_150 .main').css({'border-color':color_value});
$('#3_149 .main').css({'border-top-color':color_value});
$('#3_149 .main').css({'border-bottom-color':color_value});
$('#3_149 .main2').css({'border-color':color_value});
$('#3_149 .main2').css({'background-color':color_value});
$('#3_9 .main').css({'border-color':color_value});
$('#3_9 .main2').css({'border-color':color_value});
$('#3_8 .main').css({'background-color':color_value});
$('#3_8 .main2').css({'border-bottom-color':color_value});
$('#3_6 .main').css({'background-color':color_value});
$('#3_6 .main2').css({'border-color':color_value});
$('#3_6 .main3').css({'color':color_value});
$('#3_5 .main').css({'background-color':color_value});
$('#3_5 .main2').css({'border-color':color_value});
$('#3_4 .main').css({'background-color':color_value});
$('#3_4 .main2').css({'background-color':color_value});
$('#3_4 .main3').css({'color':color_value});
$('#3_3 .main').css({'border-color':color_value});
$('#4_247 .yead_bdtc').css({'border-top-color':color_value});
$('#4_247 .yead_color').css({'color':color_value});
$('#4_201 .yead').css({'border-color':color_value});
$('#4_105 .main').css({'background-color':color_value});
$('#4_104 .main').css({'border-color':color_value});
$('#4_103 .main').css({'border-color':color_value});
$('#4_102 .main').css({'border-color':color_value});
$('#4_101 .main').css({'border-color':color_value});
$('#5_111 .main').css({'background-color':color_value});
$('#5_111 .main2').css({'border-top-color':color_value});
$('#5_110 .main').css({'background-color':color_value});
$('#5_110 .main2').css({'background-color':color_value});
$('#5_110 .main3').css({'border-color':color_value});
$('#5_110 .main4').css({'color':color_value});
$('#5_7 .main').css({'background-color':color_value});
$('#5_7 .main2').css({'border-color':color_value});
$('#14_558 .yead_bdtc').css({'border-top-color':color_value});
$('#7_263 .yead').css({'background-color':color_value});
$('#7_263 .yead2').css({'border-bottom-color':color_value});
$('#7_263 .yead2').css({'border-top-color':color_value});
$('#7_154 .main').css({'border-color':color_value});
$('#7_154 .main').css({'background-color':color_value});
$('#7_120 .main').css({'border-color':color_value});
$('#7_120 .main2').css({'border-color':color_value});
$('#7_120 .main2').css({'background-color':color_value});
$('#7_119 .main').css({'background-color':color_value});
}
function showSuccessMessage(text) {
    if ($.fn.jGrowl) {
        $.jGrowl("<i class='icon-bell'></i> " + text, {
            theme: 'alert alert-success',
            closer: false,
            life: 2000,
            position: 'bottom-right',
            closeTemplate: 'X'
        });
    } else {
        alert(text);
    }
    return true;
}

function getEditorHtml() {
    var html = wwei_editor.getContent();
    var htmlObj = $('<div>' + html + ' </div>');
    var htmlTable = htmlObj.find('table');
    if (htmlTable.size() > 0) {
        htmlTable.removeAttr('width').attr('style', 'width:100%;');
        htmlTable.find('td').removeAttr('width').attr('style', 'border:1px solid #eeeeee;');
    }
    return htmlObj.html();
}
function strip_tags(input, allowed) {
    allowed = (((allowed || '') + '').toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join('');
    var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
    commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
    return input.replace(commentsAndPhpTags, '').replace(tags,
    function($0, $1) {
        return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0: '';
    });
}
function getSelectionHtml() {
    var range = wwei_editor.selection.getRange();
    range.select();
    var selectionObj = wwei_editor.selection.getNative();
    var rangeObj = selectionObj.getRangeAt(0);
    var docFragment = rangeObj.cloneContents();
    var testDiv = document.createElement("div");
    testDiv.appendChild(docFragment);
    var selectHtml = testDiv.innerHTML;
    return selectHtml;
}

function insertHtml(html) {
	var select_html = getSelectionHtml();
	if (select_html != "") {
		select_html = strip_tags(select_html, '<br><p><h1><h2><h3><h4><h5><h6><img>');
		var select_obj = $('<div>' + select_html + '</div>');

		/*select_obj.find('*').each(function() {
			$(this).removeAttr('style');
			$(this).removeAttr('class');
			$(this).removeAttr('placeholder');
		});*/
		var obj = $('<div>' + html + '</div>');
		/*select_obj.find('h1,h2,h3,h4,h5,h6').each(function(i) {
			var title = obj.find('.title').eq(i);
			if (title && title.size() > 0) {
				title.html($.trim($(this).text()));
				$(this).remove();
			} else {
				$(this).replaceWith('<p>' + $(this).text() + '</p>');
			}
		});*/
		/*var bgimg_size = obj.find('.135bg').size();
		select_obj.find('img').each(function(i) {
			var bgimg = obj.find('.135bg').eq(i);
			if (bgimg && bgimg.size() > 0) {
				bgimg.css('background-image', 'url(' + $(this).attr('src') + ')');
				$(this).remove();
			}
		});*/
		select_obj.find('img').each(function(i) {
			var img = obj.find('img').eq(i);
			if (img && img.size() > 0) {
				img.attr('src', $(this).attr('src'));
				$(this).remove();
			}
		});
		var brushs = obj.find('.wweibrush');
		var total = brushs.size();
		if (total > 0) {
			if (total == 1) {
				var brush_item = obj.find('.wweibrush:first');
				if (brush_item.data('brushtype') == 'text') {
					brush_item.html($.trim(select_obj.text()));
				} else {
					select_obj.contents().each(function(i) {
						var $this = this;
						if (this.tagName == "IMG") {
							return;
						};
						if ($.trim($($this).text()) == "" || this.tagName == 'BR' || $(this).html() == "" || $(this).html() == "&nbsp;" || $(this).html() == "<br>" || $(this).html() == "<br/>") {
							$(this).remove();
						}
					});
					var style = brush_item.data('style');
					if (style) {
						select_obj.find('*').each(function() {
							$(this).attr('style', style);
						});
					}
					brush_item.html(select_obj.html());
				}
			} else {
				select_obj.contents().each(function(i) {
					var $this = this;
					if (this.tagName == "IMG") {
						return;
					};
					if ($.trim($($this).text()) == "" || this.tagName == 'BR' || $(this).html() == "" || $(this).html() == "&nbsp;" || $(this).html() == "<br>" || $(this).html() == "<br/>") {
						$(this).remove();
					}
				});
				select_obj.contents().each(function(i) {
					var $this = this;
					if ($this.nodeType == 3) {
						$this = $('<p>' + $(this).text() + '</p>').get(0);
					}
					if (i < total) {
						var brush_item = brushs.eq(i);
						if (brush_item.data('brushtype') == 'text') {
							brush_item.html($.trim($($this).text()));
						} else {
							var style = brush_item.data('style');
							if (style) {
								$($this).attr('style', style);
							}
							brush_item.empty().append($($this));
						}
					} else {
						var brush_item = brushs.eq(total - 1);
						if (brush_item.data('brushtype') == 'text') {
							brush_item.append($($this).text());
						} else {
							var style = brush_item.data('style');
							if (style) {
								$($this).attr('style', style);
							}
							brush_item.append($($this));
						}
					}
				});
			}
			obj.find('p').each(function(i) {
				if ($(this).html() == "" || $(this).html() == "&nbsp;" || $(this).html() == "<br>" || $(this).html() == "<br/>") {
					if (typeof $(this).attr('style') == 'undefined') {
						$(this).remove();
					}
				}
			});
		}
		html = obj.html();
		wwei_editor.execCommand('insertHtml', html);
		wwei_editor.undoManger.save();
		return true;
	} else {}

    wwei_editor.execCommand('insertHtml', html);
    wwei_editor.undoManger.save();
    return true;
}

//换色
function isGreyColor(color) {
    var c = rgb2hex(color);
    var r = "" + c.substring(1, 3);
    var g = "" + c.substring(3, 5);
    var b = "" + c.substring(5, 7);
    if (r == g && g == b) {
        return true;
    } else {
        return false;
    }
}
function rgb2hex(color) {
    rgb = color.match(/^rgba?[\s+]?\([\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?/i);
    return (rgb && rgb.length === 4) ? "#" + ("0" + parseInt(rgb[1], 10).toString(16)).slice( - 2) + ("0" + parseInt(rgb[2], 10).toString(16)).slice( - 2) + ("0" + parseInt(rgb[3], 10).toString(16)).slice( - 2) : color;
}
function setColor(obj, colorType, color) {
    var c = $(obj).css(colorType);
    if (c === 'transparent') {
        return;
    } else {
        if (!isGreyColor(c)) {
            $(obj).css(colorType, color);
        }
    }
}
function isLightenColor(color) {
    var c = rgb2hex(color);
    var r = ("" + c.substring(1, 3));
    var g = ("" + c.substring(3, 5));
    var b = ("" + c.substring(5, 7));
    if (r > 'C0' && g > 'C0' && b > 'C0') {
        return true;
    } else {
        return false;
    }
}
function getColor(color, type, num) {
    var str = '';
    /*
    less_parser.parse('*{color:' + type + '(' + color + ',' + num + ')}',
    function(err, tree) {
        str = tree.toCSS();
        str = str.replace(/\n/g, '').replace(/ /g, '').replace('*{color:', '').replace(';}', '');
    });
    */
    return str;
}
function parseObject(obj, bgcolor, color) {
    if (isGreyColor(bgcolor)) {
        return false;
    }
    obj.find("*").each(function() {
        if (this.nodeName == "HR" || this.nodeName == "hr") {
            $(this).css('border-color', bgcolor);
            return;
        }
        if (this.nodeName == "") {
            return;
        }
        if ($(this).data('bcless')) {
            var persent = $(this).data('bclessp') ? $(this).data('bclessp') : '10%';
            var bc_color;
            if (isLightenColor(bgcolor) || $(this).data('bcless') == 'darken') {
                bc_color = getColor(rgb2hex(bgcolor), 'darken', persent);
            } else {
                bc_color = getColor(rgb2hex(bgcolor), 'lighten', persent);
            }
            $(this).css('borderBottomColor', bc_color);
            $(this).css('borderTopColor', bc_color);
            $(this).css('borderLeftColor', bc_color);
            $(this).css('borderRightColor', bc_color);
        } else {
            setColor(this, 'borderBottomColor', bgcolor);
            setColor(this, 'borderTopColor', bgcolor);
            setColor(this, 'borderLeftColor', bgcolor);
            setColor(this, 'borderRightColor', bgcolor);
        }
        if ($(this).data('ct') == 'fix') {
            return;
        }
        var bgimg = $(this).css('backgroundImage');
        if (bgimg.substring(0, 24) == '-webkit-linear-gradient(') {
            var colors;
            var type;
            if (bgimg.substring(0, 30) == '-webkit-linear-gradient(left, ') {
                type = 'left';
                colors = bgimg.substring(30, (bgimg.length - 1));
            } else if (bgimg.substring(0, 29) == '-webkit-linear-gradient(top, ') {
                type = 'top';
                colors = bgimg.substring(29, (bgimg.length - 1));
            } else if (bgimg.substring(0, 31) == '-webkit-linear-gradient(right, ') {
                type = 'right';
                colors = bgimg.substring(31, (bgimg.length - 1));
            } else if (bgimg.substring(0, 32) == '-webkit-linear-gradient(bottom, ') {
                type = 'bottom';
                colors = bgimg.substring(32, (bgimg.length - 1));
            }
            var color_arr = colors.split('),');
            var txt_color, gradient_color, main_color;
            if (isLightenColor(bgcolor)) {
                txt_color = getColor(rgb2hex(bgcolor), 'darken', '50%');
                txt_color = getColor(rgb2hex(txt_color), 'saturate', '30%');
                gradient_color = getColor(rgb2hex(bgcolor), 'darken', '10%');
                main_color = getColor(rgb2hex(bgcolor), 'saturate', '20%');
            } else {
                txt_color = '#FFF';
                getColor(rgb2hex(bgcolor), 'lighten', '50%');
                gradient_color = getColor(rgb2hex(bgcolor), 'lighten', '10%');
                main_color = getColor(rgb2hex(bgcolor), 'lighten', '5%');
                main_color = getColor(rgb2hex(main_color), 'desaturate', '10%');
                main_color = getColor(rgb2hex(main_color), 'fadein', '20%');
            }
            if (color_arr.length == 3) {
                $(this).css('backgroundImage', '-webkit-linear-gradient(' + type + ', ' + main_color + ', ' + gradient_color + ', ' + main_color + ')');
                $(this).css('color', txt_color);
            } else if (color_arr.length == 2) {
                $(this).css('backgroundImage', '-webkit-linear-gradient(' + type + ', ' + main_color + ', ' + gradient_color + ')');
                $(this).css('color', txt_color);
            }
            return;
        }
        var persent = $(this).data('clessp') ? $(this).data('clessp') : '50%';
        var bgC = $(this).get(0).style.backgroundColor;
        
		if ($(this).data('bgless')) {
			var bgpersent = $(this).data('bglessp') ? $(this).data('bglessp') : '30%';
			var bg_color;
			if ($(this).data('bgless') == "true" || $(this).data('bgless') == true) {
				if (isLightenColor(bgcolor)) {
					bg_color = getColor(rgb2hex(bgcolor), 'darken', bgpersent);
					bg_color = getColor(rgb2hex(bg_color), 'saturate', '20%');
				} else {
					bg_color = getColor(rgb2hex(bgcolor), 'lighten', bgpersent);
				}
			} else {
				bg_color = getColor(rgb2hex(bgcolor), $(this).data('bgless'), bgpersent);
			}
			if (isLightenColor(bg_color)) {
				txt_color = getColor(rgb2hex(bg_color), 'darken', persent)
			} else {
				txt_color = color;
			}
			$(this).css('backgroundColor', bg_color);
		    $(this).css('color', txt_color);
		} else if (!isGreyColor(bgC)) {
			$(this).css('backgroundColor', bgcolor);
			var txt_color;
			if (isLightenColor(bgcolor)) {
				txt_color = getColor(rgb2hex(bgcolor), 'darken', persent)
			} else {
				txt_color = color;
			}
		    $(this).css('color', txt_color);
		} else {
			var fc = $(this).get(0).style.color;
			if (fc && fc != "" && fc != 'inherit' && !isGreyColor(fc)) {
			    $(this).css('color', bgcolor);
			}
		}
        
    });
    return obj;
}

function setBackgroundColor(bgcolor, color, history) {
    if (isGreyColor(bgcolor)) {
        return false;
    }
    if (history) {
        wwei_editor.undoManger.save();
    }
    if (!$('#replace-color-all')[0].checked && current_active_ueitem) {
        parseObject(current_active_ueitem, bgcolor, color);
        wwei_editor.undoManger.save();
    } else {
        if (!$('#replace-color-all')[0].checked) {
            showErrorMessage("没有选择要调色的样式，如要全文换色请勾选配色方案位置的“全文换色”的选择框");
            return;
        }
        parseObject($(wwei_editor.selection.document), bgcolor, color);
    }
    if (history) {
        wwei_editor.undoManger.save();
    }
    return;
}
//ue plugins
UE.plugins["wwei_plugin"] = function() {
    var me = this,
    editor = this;
    var utils = baidu.editor.utils,
    Popup = baidu.editor.ui.Popup,
    Stateful = baidu.editor.ui.Stateful,
    uiUtils = baidu.editor.ui.uiUtils,
    UIBase = baidu.editor.ui.UIBase;
    var domUtils = baidu.editor.dom.domUtils;

    var clickPop = new baidu.editor.ui.Popup({
        content: "",
        editor: me,
        _remove: function() {
            $(clickPop.anchorEl).remove();
            clickPop.hide();
        },
        _copy: function() {
            $(clickPop.anchorEl).prop('outerHTML');
            clickPop.hide();
        },
        _blank: function() {
            $('<p><br/></p>').insertAfter(clickPop.anchorEl);
            clickPop.hide();
        },
        className: 'edui-bubble'
    });

    me.addListener("click",
    function(t, evt) {
        evt = evt || window.event;
        var el = evt.target || evt.srcElement;
        if (el.tagName == "IMG") {
            return;
        }
        if ($(el).parents('.wwei-editor').size() > 0) {
            el = $(el).parents('.wwei-editor:first').get(0);
            /*if (current_active_ueitem) {
                current_active_ueitem.removeAttr('style');
            }*/
            current_active_ueitem = $(el);
            /*current_active_ueitem.css({
                'border': '1px dotted rgb(218, 98, 71)',
                'padding': '2px'
            });*/
            clickPop.render();
            var html = clickPop.formatHtml('<nobr class="otf-poptools">' + '<span class="copy" stateful>' + '复制</span>' + '<span class="cut" stateful>' + '剪切</span>' + '<span onclick="$$._remove()" stateful>' + '删除</span>' + '<span onclick="$$._blank()" stateful>' + '其后插入空行</span>' + '</nobr>');
            var content = clickPop.getDom('content');
            content.innerHTML = html;
            
            clickPop.anchorEl = el;
            clickPop.showAnchor(clickPop.anchorEl);
            var client = new ZeroClipboard($(clickPop.getDom('content')).find('.copy'));
            client.on('ready',
            function(event) {
                client.on('copy',
                function(event) {
                    //$(clickPop.anchorEl).removeAttr('style');
                    event.clipboardData.setData('text/html', $(clickPop.anchorEl).prop('outerHTML'));
                    clickPop.hide();
                    showSuccessMessage("已成功复制到剪切板");
                });
            });
            var cut_client = new ZeroClipboard($(clickPop.getDom('content')).find('.cut'));
            cut_client.on('ready',
            function(event) {
                cut_client.on('copy',
                function(event) {
                    //$(clickPop.anchorEl).removeAttr('style');
                    event.clipboardData.setData('text/html', $(clickPop.anchorEl).prop('outerHTML'));
                    clickPop.hide();
                    $(clickPop.anchorEl).remove();
                    showSuccessMessage("已成功剪切到剪切板");
                });
            });
        } else {
            if (current_active_ueitem) {
                //current_active_ueitem.removeAttr('style');
                current_active_ueitem = null;
            }
        }
    });
};