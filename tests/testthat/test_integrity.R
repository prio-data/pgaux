
test_that("test integrity functions",{
   x <- tempdir()

   dir.create(file.path(x,"adir"))
   dir.create(file.path(x,"adir","data"))
   writeLines("eek",file.path(x,"adir","data","eek"))

   dir.create(file.path(x,"bdir"))
   dir.create(file.path(x,"bdir","data"))
   writeLines("eek",file.path(x,"bdir","data","eek"))

   spec <- make_raw_data_spec(x)
   expect_equal(make_raw_data_spec(x),spec)

   dir.create(file.path(x,"cdir"))
   dir.create(file.path(x,"cdir","data"))
   writeLines("eek",file.path(x,"cdir","data","eek"))
   expect_false(make_raw_data_spec(x)==spec)
})
