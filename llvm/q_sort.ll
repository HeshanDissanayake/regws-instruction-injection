; ModuleID = 'c_codes/q_sort.c'
source_filename = "c_codes/q_sort.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
target triple = "riscv64-unknown-unknown"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@__const.main.arr = private unnamed_addr constant [64 x i32] [i32 64, i32 34, i32 25, i32 12, i32 22, i32 11, i32 90, i32 54, i32 87, i32 23, i32 78, i32 56, i32 99, i32 1, i32 18, i32 30, i32 45, i32 63, i32 72, i32 82, i32 91, i32 4, i32 37, i32 15, i32 49, i32 6, i32 27, i32 43, i32 53, i32 68, i32 10, i32 36, i32 28, i32 65, i32 77, i32 39, i32 94, i32 60, i32 41, i32 74, i32 35, i32 50, i32 31, i32 70, i32 93, i32 16, i32 19, i32 88, i32 71, i32 20, i32 14, i32 13, i32 48, i32 5, i32 17, i32 42, i32 84, i32 75, i32 67, i32 55, i32 38, i32 92, i32 8, i32 69], align 4
@str = private unnamed_addr constant [16 x i8] c"Unsorted array:\00", align 1
@str.4 = private unnamed_addr constant [15 x i8] c"\0ASorted array:\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define dso_local void @swap(i32* nocapture noundef %0, i32* nocapture noundef %1) local_unnamed_addr #0 {
  %3 = load i32, i32* %0, align 4, !tbaa !4
  %4 = load i32, i32* %1, align 4, !tbaa !4
  store i32 %4, i32* %0, align 4, !tbaa !4
  store i32 %3, i32* %1, align 4, !tbaa !4
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind
define dso_local signext i32 @partition(i32* nocapture noundef %0, i32 noundef signext %1, i32 noundef signext %2) local_unnamed_addr #2 {
  %4 = sext i32 %2 to i64
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !4
  %7 = add nsw i32 %1, -1
  %8 = icmp slt i32 %1, %2
  br i1 %8, label %9, label %13

9:                                                ; preds = %3
  %10 = sext i32 %1 to i64
  br label %20

11:                                               ; preds = %31
  %12 = load i32, i32* %5, align 4, !tbaa !4
  br label %13

13:                                               ; preds = %11, %3
  %14 = phi i32 [ %6, %3 ], [ %12, %11 ]
  %15 = phi i32 [ %7, %3 ], [ %32, %11 ]
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32* %0, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !4
  store i32 %14, i32* %18, align 4, !tbaa !4
  store i32 %19, i32* %5, align 4, !tbaa !4
  ret i32 %16

20:                                               ; preds = %9, %31
  %21 = phi i64 [ %10, %9 ], [ %33, %31 ]
  %22 = phi i32 [ %7, %9 ], [ %32, %31 ]
  %23 = getelementptr inbounds i32, i32* %0, i64 %21
  %24 = load i32, i32* %23, align 4, !tbaa !4
  %25 = icmp slt i32 %24, %6
  br i1 %25, label %26, label %31

26:                                               ; preds = %20
  %27 = add nsw i32 %22, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32* %0, i64 %28
  %30 = load i32, i32* %29, align 4, !tbaa !4
  store i32 %24, i32* %29, align 4, !tbaa !4
  store i32 %30, i32* %23, align 4, !tbaa !4
  br label %31

31:                                               ; preds = %20, %26
  %32 = phi i32 [ %27, %26 ], [ %22, %20 ]
  %33 = add nsw i64 %21, 1
  %34 = icmp eq i64 %33, %4
  br i1 %34, label %11, label %20, !llvm.loop !8
}

; Function Attrs: nofree nosync nounwind
define dso_local void @quickSort(i32* noundef %0, i32 noundef signext %1, i32 noundef signext %2) local_unnamed_addr #3 {
  %4 = icmp slt i32 %1, %2
  br i1 %4, label %5, label %36

5:                                                ; preds = %3
  %6 = sext i32 %2 to i64
  %7 = getelementptr inbounds i32, i32* %0, i64 %6
  br label %8

8:                                                ; preds = %5, %28
  %9 = phi i32 [ %1, %5 ], [ %34, %28 ]
  %10 = load i32, i32* %7, align 4, !tbaa !4
  %11 = add nsw i32 %9, -1
  %12 = sext i32 %9 to i64
  br label %13

13:                                               ; preds = %24, %8
  %14 = phi i64 [ %12, %8 ], [ %26, %24 ]
  %15 = phi i32 [ %11, %8 ], [ %25, %24 ]
  %16 = getelementptr inbounds i32, i32* %0, i64 %14
  %17 = load i32, i32* %16, align 4, !tbaa !4
  %18 = icmp slt i32 %17, %10
  br i1 %18, label %19, label %24

19:                                               ; preds = %13
  %20 = add nsw i32 %15, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32* %0, i64 %21
  %23 = load i32, i32* %22, align 4, !tbaa !4
  store i32 %17, i32* %22, align 4, !tbaa !4
  store i32 %23, i32* %16, align 4, !tbaa !4
  br label %24

24:                                               ; preds = %19, %13
  %25 = phi i32 [ %20, %19 ], [ %15, %13 ]
  %26 = add nsw i64 %14, 1
  %27 = icmp eq i64 %26, %6
  br i1 %27, label %28, label %13, !llvm.loop !8

28:                                               ; preds = %24
  %29 = load i32, i32* %7, align 4, !tbaa !4
  %30 = add nsw i32 %25, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32* %0, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !4
  store i32 %29, i32* %32, align 4, !tbaa !4
  store i32 %33, i32* %7, align 4, !tbaa !4
  tail call void @quickSort(i32* noundef nonnull %0, i32 noundef signext %9, i32 noundef signext %25)
  %34 = add nsw i32 %25, 2
  %35 = icmp slt i32 %34, %2
  br i1 %35, label %8, label %36

36:                                               ; preds = %28, %3
  ret void
}

; Function Attrs: nofree nounwind
define dso_local void @printArray(i32* nocapture noundef readonly %0, i32 noundef signext %1) local_unnamed_addr #4 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = zext i32 %1 to i64
  br label %8

6:                                                ; preds = %8, %2
  %7 = tail call i32 @putchar(i32 10)
  ret void

8:                                                ; preds = %4, %8
  %9 = phi i64 [ 0, %4 ], [ %13, %8 ]
  %10 = getelementptr inbounds i32, i32* %0, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !4
  %12 = tail call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef signext %11)
  %13 = add nuw nsw i64 %9, 1
  %14 = icmp eq i64 %13, %5
  br i1 %14, label %6, label %8, !llvm.loop !10
}

; Function Attrs: nofree nounwind
declare dso_local noundef signext i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
define dso_local signext i32 @main() local_unnamed_addr #4 {
  %1 = alloca [64 x i32], align 4
  %2 = bitcast [64 x i32]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %2) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(256) %2, i8* noundef nonnull align 4 dereferenceable(256) bitcast ([64 x i32]* @__const.main.arr to i8*), i64 256, i1 false)
  %3 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @str, i64 0, i64 0))
  %4 = tail call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef signext 64) #8
  br label %5

5:                                                ; preds = %0, %5
  %6 = phi i64 [ 1, %0 ], [ %10, %5 ]
  %7 = getelementptr inbounds [64 x i32], [64 x i32]* %1, i64 0, i64 %6
  %8 = load i32, i32* %7, align 4, !tbaa !4
  %9 = tail call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef signext %8) #8
  %10 = add nuw nsw i64 %6, 1
  %11 = icmp eq i64 %10, 64
  br i1 %11, label %12, label %5, !llvm.loop !10

12:                                               ; preds = %5
  %13 = getelementptr inbounds [64 x i32], [64 x i32]* %1, i64 0, i64 0
  %14 = tail call i32 @putchar(i32 10) #8
  call void @quickSort(i32* noundef nonnull %13, i32 noundef signext 0, i32 noundef signext 63)
  %15 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.4, i64 0, i64 0))
  br label %16

16:                                               ; preds = %16, %12
  %17 = phi i64 [ 0, %12 ], [ %21, %16 ]
  %18 = getelementptr inbounds [64 x i32], [64 x i32]* %1, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !4
  %20 = call signext i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef signext %19) #8
  %21 = add nuw nsw i64 %17, 1
  %22 = icmp eq i64 %21, 64
  br i1 %22, label %23, label %16, !llvm.loop !10

23:                                               ; preds = %16
  %24 = call i32 @putchar(i32 10) #8
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %2) #8
  ret i32 0
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #7

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nofree norecurse nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m" }
attributes #3 = { nofree nosync nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m" }
attributes #4 = { nofree nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m" }
attributes #5 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+64bit,+a,+c,+d,+f,+m" }
attributes #6 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #7 = { nofree nounwind }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
