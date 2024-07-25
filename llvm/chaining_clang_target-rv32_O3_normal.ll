; ModuleID = 'minimap_code/chaining.c'
source_filename = "minimap_code/chaining.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown"

%struct._reent = type { i32, %struct.__sFILE*, %struct.__sFILE*, %struct.__sFILE*, i32, [25 x i8], %struct.__locale_t*, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, %union.anon, void (i32)** }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i32, i32)*, i32 (%struct._reent*, i8*)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i32, %struct._reent*, i32, %struct._mbstate_t, i32 }
%struct.__sbuf = type { i8*, i32 }
%struct._mbstate_t = type { i32, %union.anon.0 }
%union.anon.0 = type { i32 }
%struct.__locale_t = type opaque
%struct._Bigint = type { %struct._Bigint*, i32, i32, i32, i32, [1 x i32] }
%union.anon = type { %struct.anon }
%struct.anon = type { i8*, [26 x i8], %struct.__tm, i32, i64, %struct._rand48, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, [8 x i8], [24 x i8], i32, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, i32 }
%struct.__tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct._rand48 = type { [3 x i16], [3 x i16], i16 }
%struct.mm128_t = type { i64, i64 }

@.str = private unnamed_addr constant [24 x i8] c"minimap_code/chaining.c\00", align 1
@__func__.mg_chain_backtrack = private unnamed_addr constant [19 x i8] c"mg_chain_backtrack\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"n_v < INT32_MAX\00", align 1
@_impure_ptr = external dso_local local_unnamed_addr global %struct._reent*, align 4
@.str.2 = private unnamed_addr constant [116 x i8] c"Usage: %s max_dist_x max_dist_y bw max_skip max_iter min_cnt min_sc chn_pen_gap chn_pen_skip is_cdna n_seg n a n_u\0A\00", align 1
@.str.3 = private unnamed_addr constant [26 x i8] c"Result: x = %lu, y = %lu\0A\00", align 1
@str = private unnamed_addr constant [27 x i8] c"The function returned NULL\00", align 1

; Function Attrs: nounwind
define dso_local noalias i64* @mg_chain_backtrack(i8* nocapture readnone %0, i64 noundef %1, i32* nocapture noundef readonly %2, i64* nocapture noundef readonly %3, i32* nocapture noundef writeonly %4, i32* nocapture noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, i32* nocapture noundef writeonly %9, i32* nocapture noundef writeonly %10) local_unnamed_addr #0 {
  store i32 0, i32* %10, align 4, !tbaa !4
  store i32 0, i32* %9, align 4, !tbaa !4
  %12 = icmp sgt i64 %1, 0
  br i1 %12, label %13, label %276

13:                                               ; preds = %11, %13
  %14 = phi i64 [ %22, %13 ], [ 0, %11 ]
  %15 = phi i64 [ %21, %13 ], [ 0, %11 ]
  %16 = trunc i64 %14 to i32
  %17 = getelementptr inbounds i32, i32* %2, i32 %16
  %18 = load i32, i32* %17, align 4, !tbaa !4
  %19 = icmp sge i32 %18, %7
  %20 = zext i1 %19 to i64
  %21 = add nuw nsw i64 %15, %20
  %22 = add nuw nsw i64 %14, 1
  %23 = icmp slt i64 %22, %1
  br i1 %23, label %13, label %24, !llvm.loop !8

24:                                               ; preds = %13
  %25 = icmp eq i64 %21, 0
  br i1 %25, label %276, label %26

26:                                               ; preds = %24
  %27 = trunc i64 %21 to i32
  %28 = shl i32 %27, 4
  %29 = tail call noalias i8* @malloc(i32 noundef %28) #13
  %30 = bitcast i8* %29 to %struct.mm128_t*
  br i1 %12, label %31, label %48

31:                                               ; preds = %26, %44
  %32 = phi i64 [ %46, %44 ], [ 0, %26 ]
  %33 = phi i64 [ %45, %44 ], [ 0, %26 ]
  %34 = trunc i64 %32 to i32
  %35 = getelementptr inbounds i32, i32* %2, i32 %34
  %36 = load i32, i32* %35, align 4, !tbaa !4
  %37 = icmp slt i32 %36, %7
  br i1 %37, label %44, label %38

38:                                               ; preds = %31
  %39 = sext i32 %36 to i64
  %40 = trunc i64 %33 to i32
  %41 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %30, i32 %40, i32 0
  store i64 %39, i64* %41, align 8, !tbaa !10
  %42 = add nsw i64 %33, 1
  %43 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %30, i32 %40, i32 1
  store i64 %32, i64* %43, align 8, !tbaa !13
  br label %44

44:                                               ; preds = %31, %38
  %45 = phi i64 [ %42, %38 ], [ %33, %31 ]
  %46 = add nuw nsw i64 %32, 1
  %47 = icmp slt i64 %46, %1
  br i1 %47, label %31, label %48, !llvm.loop !14

48:                                               ; preds = %44, %26
  %49 = bitcast i32* %5 to i8*
  %50 = trunc i64 %1 to i32
  %51 = shl i32 %50, 2
  tail call void @llvm.memset.p0i8.i32(i8* align 4 %49, i8 0, i32 %51, i1 false)
  %52 = add nsw i64 %21, -1
  %53 = sext i32 %6 to i64
  br label %54

54:                                               ; preds = %48, %153
  %55 = phi i64 [ %52, %48 ], [ %156, %153 ]
  %56 = phi i64 [ 0, %48 ], [ %155, %153 ]
  %57 = phi i32 [ 0, %48 ], [ %154, %153 ]
  %58 = trunc i64 %55 to i32
  %59 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %30, i32 %58
  %60 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %30, i32 %58, i32 1
  %61 = load i64, i64* %60, align 8, !tbaa !13
  %62 = trunc i64 %61 to i32
  %63 = getelementptr inbounds i32, i32* %5, i32 %62
  %64 = load i32, i32* %63, align 4, !tbaa !4
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %153

66:                                               ; preds = %54
  %67 = icmp slt i64 %61, 0
  br i1 %67, label %127, label %68

68:                                               ; preds = %66
  %69 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %30, i32 %58, i32 0
  %70 = load i64, i64* %69, align 8, !tbaa !10
  %71 = trunc i64 %70 to i32
  br label %72

72:                                               ; preds = %95, %68
  %73 = phi i32 [ %96, %95 ], [ %62, %68 ]
  %74 = phi i64 [ %92, %95 ], [ %61, %68 ]
  %75 = phi i32 [ %93, %95 ], [ 0, %68 ]
  %76 = getelementptr inbounds i32, i32* %5, i32 %73
  store i32 2, i32* %76, align 4, !tbaa !4
  %77 = getelementptr inbounds i64, i64* %3, i32 %73
  %78 = load i64, i64* %77, align 8, !tbaa !15
  %79 = icmp slt i64 %78, 0
  br i1 %79, label %85, label %80

80:                                               ; preds = %72
  %81 = trunc i64 %78 to i32
  %82 = getelementptr inbounds i32, i32* %2, i32 %81
  %83 = load i32, i32* %82, align 4, !tbaa !4
  %84 = sub nsw i32 %71, %83
  br label %85

85:                                               ; preds = %80, %72
  %86 = phi i32 [ %84, %80 ], [ %71, %72 ]
  %87 = icmp slt i32 %75, %86
  br i1 %87, label %91, label %88

88:                                               ; preds = %85
  %89 = sub nsw i32 %75, %86
  %90 = icmp sgt i32 %89, %8
  br i1 %90, label %100, label %91

91:                                               ; preds = %88, %85
  %92 = phi i64 [ %74, %88 ], [ %78, %85 ]
  %93 = phi i32 [ %75, %88 ], [ %86, %85 ]
  %94 = icmp sgt i64 %78, -1
  br i1 %94, label %95, label %100

95:                                               ; preds = %91
  %96 = trunc i64 %78 to i32
  %97 = getelementptr inbounds i32, i32* %5, i32 %96
  %98 = load i32, i32* %97, align 4, !tbaa !4
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %72, label %100, !llvm.loop !16

100:                                              ; preds = %95, %91, %88
  %101 = phi i64 [ %92, %91 ], [ %92, %95 ], [ %74, %88 ]
  %102 = icmp eq i64 %61, %78
  br i1 %102, label %112, label %103

103:                                              ; preds = %100, %103
  %104 = phi i32 [ %111, %103 ], [ %62, %100 ]
  %105 = getelementptr inbounds i32, i32* %5, i32 %104
  store i32 0, i32* %105, align 4, !tbaa !4
  %106 = getelementptr inbounds i64, i64* %3, i32 %104
  %107 = load i64, i64* %106, align 8, !tbaa !15
  %108 = icmp slt i64 %107, 0
  %109 = icmp eq i64 %107, %78
  %110 = select i1 %108, i1 true, i1 %109
  %111 = trunc i64 %107 to i32
  br i1 %110, label %112, label %103, !llvm.loop !17

112:                                              ; preds = %103, %100
  %113 = icmp eq i64 %61, %101
  br i1 %113, label %123, label %114

114:                                              ; preds = %112, %114
  %115 = phi i32 [ %122, %114 ], [ %62, %112 ]
  %116 = phi i64 [ %117, %114 ], [ %56, %112 ]
  %117 = add nsw i64 %116, 1
  %118 = getelementptr inbounds i32, i32* %5, i32 %115
  store i32 1, i32* %118, align 4, !tbaa !4
  %119 = getelementptr inbounds i64, i64* %3, i32 %115
  %120 = load i64, i64* %119, align 8, !tbaa !15
  %121 = icmp eq i64 %120, %101
  %122 = trunc i64 %120 to i32
  br i1 %121, label %123, label %114, !llvm.loop !18

123:                                              ; preds = %114, %112
  %124 = phi i64 [ %56, %112 ], [ %117, %114 ]
  %125 = phi i64 [ %61, %112 ], [ %101, %114 ]
  %126 = icmp slt i64 %125, 0
  br i1 %126, label %127, label %132

127:                                              ; preds = %66, %123
  %128 = phi i64 [ %124, %123 ], [ %56, %66 ]
  %129 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %59, i32 0, i32 0
  %130 = load i64, i64* %129, align 8, !tbaa !10
  %131 = trunc i64 %130 to i32
  br label %140

132:                                              ; preds = %123
  %133 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %59, i32 0, i32 0
  %134 = load i64, i64* %133, align 8, !tbaa !10
  %135 = trunc i64 %134 to i32
  %136 = trunc i64 %125 to i32
  %137 = getelementptr inbounds i32, i32* %2, i32 %136
  %138 = load i32, i32* %137, align 4, !tbaa !4
  %139 = sub nsw i32 %135, %138
  br label %140

140:                                              ; preds = %132, %127
  %141 = phi i64 [ %128, %127 ], [ %124, %132 ]
  %142 = phi i32 [ %131, %127 ], [ %139, %132 ]
  %143 = icmp sge i32 %142, %7
  %144 = icmp sgt i64 %141, %56
  %145 = select i1 %143, i1 %144, i1 false
  br i1 %145, label %146, label %153

146:                                              ; preds = %140
  %147 = sub nsw i64 %141, %56
  %148 = icmp slt i64 %147, %53
  %149 = xor i1 %148, true
  %150 = zext i1 %149 to i32
  %151 = add nsw i32 %57, %150
  %152 = select i1 %148, i64 %56, i64 %141
  br label %153

153:                                              ; preds = %146, %140, %54
  %154 = phi i32 [ %57, %54 ], [ %57, %140 ], [ %151, %146 ]
  %155 = phi i64 [ %56, %54 ], [ %56, %140 ], [ %152, %146 ]
  %156 = add nsw i64 %55, -1
  %157 = icmp sgt i64 %55, 0
  br i1 %157, label %54, label %158, !llvm.loop !19

158:                                              ; preds = %153
  %159 = shl i32 %154, 3
  %160 = tail call noalias i8* @malloc(i32 noundef %159) #13
  %161 = bitcast i8* %160 to i64*
  tail call void @llvm.memset.p0i8.i32(i8* align 4 %49, i8 0, i32 %51, i1 false)
  %162 = sext i32 %6 to i64
  br label %163

163:                                              ; preds = %158, %266
  %164 = phi i64 [ %52, %158 ], [ %269, %266 ]
  %165 = phi i64 [ 0, %158 ], [ %268, %266 ]
  %166 = phi i32 [ 0, %158 ], [ %267, %266 ]
  %167 = trunc i64 %164 to i32
  %168 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %30, i32 %167
  %169 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %30, i32 %167, i32 1
  %170 = load i64, i64* %169, align 8, !tbaa !13
  %171 = trunc i64 %170 to i32
  %172 = getelementptr inbounds i32, i32* %5, i32 %171
  %173 = load i32, i32* %172, align 4, !tbaa !4
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %175, label %266

175:                                              ; preds = %163
  %176 = icmp slt i64 %170, 0
  br i1 %176, label %238, label %177

177:                                              ; preds = %175
  %178 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %30, i32 %167, i32 0
  %179 = load i64, i64* %178, align 8, !tbaa !10
  %180 = trunc i64 %179 to i32
  br label %181

181:                                              ; preds = %204, %177
  %182 = phi i32 [ %205, %204 ], [ %171, %177 ]
  %183 = phi i64 [ %201, %204 ], [ %170, %177 ]
  %184 = phi i32 [ %202, %204 ], [ 0, %177 ]
  %185 = getelementptr inbounds i32, i32* %5, i32 %182
  store i32 2, i32* %185, align 4, !tbaa !4
  %186 = getelementptr inbounds i64, i64* %3, i32 %182
  %187 = load i64, i64* %186, align 8, !tbaa !15
  %188 = icmp slt i64 %187, 0
  br i1 %188, label %194, label %189

189:                                              ; preds = %181
  %190 = trunc i64 %187 to i32
  %191 = getelementptr inbounds i32, i32* %2, i32 %190
  %192 = load i32, i32* %191, align 4, !tbaa !4
  %193 = sub nsw i32 %180, %192
  br label %194

194:                                              ; preds = %189, %181
  %195 = phi i32 [ %193, %189 ], [ %180, %181 ]
  %196 = icmp slt i32 %184, %195
  br i1 %196, label %200, label %197

197:                                              ; preds = %194
  %198 = sub nsw i32 %184, %195
  %199 = icmp sgt i32 %198, %8
  br i1 %199, label %209, label %200

200:                                              ; preds = %197, %194
  %201 = phi i64 [ %183, %197 ], [ %187, %194 ]
  %202 = phi i32 [ %184, %197 ], [ %195, %194 ]
  %203 = icmp sgt i64 %187, -1
  br i1 %203, label %204, label %209

204:                                              ; preds = %200
  %205 = trunc i64 %187 to i32
  %206 = getelementptr inbounds i32, i32* %5, i32 %205
  %207 = load i32, i32* %206, align 4, !tbaa !4
  %208 = icmp eq i32 %207, 0
  br i1 %208, label %181, label %209, !llvm.loop !16

209:                                              ; preds = %204, %200, %197
  %210 = phi i64 [ %201, %200 ], [ %201, %204 ], [ %183, %197 ]
  %211 = icmp eq i64 %170, %187
  br i1 %211, label %221, label %212

212:                                              ; preds = %209, %212
  %213 = phi i32 [ %220, %212 ], [ %171, %209 ]
  %214 = getelementptr inbounds i32, i32* %5, i32 %213
  store i32 0, i32* %214, align 4, !tbaa !4
  %215 = getelementptr inbounds i64, i64* %3, i32 %213
  %216 = load i64, i64* %215, align 8, !tbaa !15
  %217 = icmp slt i64 %216, 0
  %218 = icmp eq i64 %216, %187
  %219 = select i1 %217, i1 true, i1 %218
  %220 = trunc i64 %216 to i32
  br i1 %219, label %221, label %212, !llvm.loop !17

221:                                              ; preds = %212, %209
  %222 = icmp eq i64 %170, %210
  br i1 %222, label %234, label %223

223:                                              ; preds = %221, %223
  %224 = phi i32 [ %233, %223 ], [ %171, %221 ]
  %225 = phi i64 [ %226, %223 ], [ %165, %221 ]
  %226 = add nsw i64 %225, 1
  %227 = trunc i64 %225 to i32
  %228 = getelementptr inbounds i32, i32* %4, i32 %227
  store i32 %224, i32* %228, align 4, !tbaa !4
  %229 = getelementptr inbounds i32, i32* %5, i32 %224
  store i32 1, i32* %229, align 4, !tbaa !4
  %230 = getelementptr inbounds i64, i64* %3, i32 %224
  %231 = load i64, i64* %230, align 8, !tbaa !15
  %232 = icmp eq i64 %231, %210
  %233 = trunc i64 %231 to i32
  br i1 %232, label %234, label %223, !llvm.loop !20

234:                                              ; preds = %223, %221
  %235 = phi i64 [ %165, %221 ], [ %226, %223 ]
  %236 = phi i64 [ %170, %221 ], [ %210, %223 ]
  %237 = icmp slt i64 %236, 0
  br i1 %237, label %238, label %243

238:                                              ; preds = %175, %234
  %239 = phi i64 [ %235, %234 ], [ %165, %175 ]
  %240 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %168, i32 0, i32 0
  %241 = load i64, i64* %240, align 8, !tbaa !10
  %242 = trunc i64 %241 to i32
  br label %251

243:                                              ; preds = %234
  %244 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %168, i32 0, i32 0
  %245 = load i64, i64* %244, align 8, !tbaa !10
  %246 = trunc i64 %245 to i32
  %247 = trunc i64 %236 to i32
  %248 = getelementptr inbounds i32, i32* %2, i32 %247
  %249 = load i32, i32* %248, align 4, !tbaa !4
  %250 = sub nsw i32 %246, %249
  br label %251

251:                                              ; preds = %243, %238
  %252 = phi i64 [ %239, %238 ], [ %235, %243 ]
  %253 = phi i32 [ %242, %238 ], [ %250, %243 ]
  %254 = icmp sge i32 %253, %7
  %255 = icmp sgt i64 %252, %165
  %256 = select i1 %254, i1 %255, i1 false
  br i1 %256, label %257, label %266

257:                                              ; preds = %251
  %258 = sub nsw i64 %252, %165
  %259 = icmp slt i64 %258, %162
  br i1 %259, label %266, label %260

260:                                              ; preds = %257
  %261 = zext i32 %253 to i64
  %262 = shl nuw i64 %261, 32
  %263 = or i64 %262, %258
  %264 = add nsw i32 %166, 1
  %265 = getelementptr inbounds i64, i64* %161, i32 %166
  store i64 %263, i64* %265, align 8, !tbaa !15
  br label %266

266:                                              ; preds = %260, %257, %251, %163
  %267 = phi i32 [ %166, %163 ], [ %264, %260 ], [ %166, %257 ], [ %166, %251 ]
  %268 = phi i64 [ %165, %163 ], [ %252, %260 ], [ %165, %257 ], [ %165, %251 ]
  %269 = add nsw i64 %164, -1
  %270 = icmp sgt i64 %164, 0
  br i1 %270, label %163, label %271, !llvm.loop !21

271:                                              ; preds = %266
  tail call void @free(i8* noundef nonnull %29)
  %272 = icmp slt i64 %268, 2147483647
  br i1 %272, label %274, label %273

273:                                              ; preds = %271
  tail call void @__assert_func(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i32 noundef 122, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @__func__.mg_chain_backtrack, i32 0, i32 0), i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0)) #14
  unreachable

274:                                              ; preds = %271
  %275 = trunc i64 %268 to i32
  store i32 %267, i32* %9, align 4, !tbaa !4
  store i32 %275, i32* %10, align 4, !tbaa !4
  br label %276

276:                                              ; preds = %11, %24, %274
  %277 = phi i64* [ %161, %274 ], [ null, %24 ], [ null, %11 ]
  ret i64* %277
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn allocsize(0)
declare dso_local noalias noundef i8* @malloc(i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #4

; Function Attrs: noreturn
declare dso_local void @__assert_func(i8* noundef, i32 noundef, i8* noundef, i8* noundef) local_unnamed_addr #5

; Function Attrs: nounwind
define dso_local noalias %struct.mm128_t* @mg_lchain_dp(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, float noundef %7, float noundef %8, i32 noundef %9, i32 noundef %10, i64 noundef %11, %struct.mm128_t* noundef %12, i32* nocapture noundef writeonly %13, i64** noundef writeonly %14, i8* nocapture readnone %15) local_unnamed_addr #0 {
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = bitcast i32* %17 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19) #15
  %20 = bitcast i32* %18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %20) #15
  %21 = icmp eq i64** %14, null
  br i1 %21, label %23, label %22

22:                                               ; preds = %16
  store i64* null, i64** %14, align 4, !tbaa !22
  store i32 0, i32* %13, align 4, !tbaa !4
  br label %23

23:                                               ; preds = %22, %16
  %24 = icmp eq i64 %11, 0
  %25 = icmp eq %struct.mm128_t* %12, null
  %26 = or i1 %24, %25
  br i1 %26, label %27, label %29

27:                                               ; preds = %23
  %28 = bitcast %struct.mm128_t* %12 to i8*
  tail call void @free(i8* noundef %28)
  br label %515

29:                                               ; preds = %23
  %30 = icmp slt i32 %0, %2
  %31 = select i1 %30, i32 %2, i32 %0
  %32 = icmp sge i32 %1, %2
  %33 = icmp ne i32 %9, 0
  %34 = or i1 %32, %33
  %35 = select i1 %34, i32 %1, i32 %2
  %36 = select i1 %33, i32 2147483647, i32 %2
  %37 = trunc i64 %11 to i32
  %38 = shl i32 %37, 2
  %39 = tail call noalias i8* @malloc(i32 noundef %38) #13
  %40 = bitcast i8* %39 to i64*
  %41 = tail call noalias i8* @malloc(i32 noundef %38) #13
  %42 = bitcast i8* %41 to i32*
  %43 = tail call noalias i8* @malloc(i32 noundef %38) #13
  %44 = bitcast i8* %43 to i32*
  %45 = tail call noalias i8* @calloc(i32 noundef %37, i32 noundef 4) #16
  %46 = bitcast i8* %45 to i32*
  %47 = icmp sgt i64 %11, 0
  br i1 %47, label %48, label %410

48:                                               ; preds = %29
  %49 = sext i32 %31 to i64
  %50 = sext i32 %4 to i64
  %51 = icmp slt i32 %10, 2
  %52 = or i1 %33, %51
  %53 = xor i1 %52, true
  %54 = xor i1 %33, true
  br label %55

55:                                               ; preds = %48, %406
  %56 = phi i64 [ 0, %48 ], [ %88, %406 ]
  %57 = phi i64 [ -1, %48 ], [ %407, %406 ]
  %58 = phi i64 [ 0, %48 ], [ %408, %406 ]
  %59 = trunc i64 %58 to i32
  %60 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %59
  %61 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %59, i32 1
  %62 = load i64, i64* %61, align 8, !tbaa !13
  %63 = lshr i64 %62, 32
  %64 = trunc i64 %63 to i32
  %65 = and i32 %64, 255
  %66 = icmp sgt i64 %58, %56
  br i1 %66, label %67, label %83

67:                                               ; preds = %55
  %68 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %60, i32 0, i32 0
  %69 = load i64, i64* %68, align 8, !tbaa !10
  br label %70

70:                                               ; preds = %67, %80
  %71 = phi i64 [ %56, %67 ], [ %81, %80 ]
  %72 = trunc i64 %71 to i32
  %73 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %72, i32 0
  %74 = load i64, i64* %73, align 8, !tbaa !10
  %75 = xor i64 %74, %69
  %76 = icmp ugt i64 %75, 4294967295
  %77 = add i64 %74, %49
  %78 = icmp ugt i64 %69, %77
  %79 = or i1 %76, %78
  br i1 %79, label %80, label %83

80:                                               ; preds = %70
  %81 = add nsw i64 %71, 1
  %82 = icmp sgt i64 %58, %81
  br i1 %82, label %70, label %83, !llvm.loop !24

83:                                               ; preds = %70, %80, %55
  %84 = phi i64 [ %56, %55 ], [ %58, %80 ], [ %71, %70 ]
  %85 = sub nsw i64 %58, %84
  %86 = icmp sgt i64 %85, %50
  %87 = sub nsw i64 %58, %50
  %88 = select i1 %86, i64 %87, i64 %84
  %89 = add nsw i64 %58, -1
  %90 = icmp sgt i64 %58, %88
  br i1 %90, label %91, label %230

91:                                               ; preds = %83
  %92 = trunc i64 %62 to i32
  %93 = lshr i64 %62, 48
  %94 = trunc i64 %93 to i32
  %95 = and i32 %94, 255
  %96 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %60, i32 0, i32 0
  br label %97

97:                                               ; preds = %91, %224
  %98 = phi i32 [ 0, %91 ], [ %227, %224 ]
  %99 = phi i32 [ %65, %91 ], [ %226, %224 ]
  %100 = phi i64 [ -1, %91 ], [ %225, %224 ]
  %101 = phi i64 [ %89, %91 ], [ %228, %224 ]
  %102 = trunc i64 %101 to i32
  %103 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %102, i32 1
  %104 = load i64, i64* %103, align 8, !tbaa !13
  %105 = trunc i64 %104 to i32
  %106 = sub nsw i32 %92, %105
  %107 = lshr i64 %104, 48
  %108 = trunc i64 %107 to i32
  %109 = and i32 %108, 255
  %110 = icmp slt i32 %106, 1
  %111 = icmp sgt i32 %106, %31
  %112 = or i1 %110, %111
  br i1 %112, label %224, label %113

113:                                              ; preds = %97
  %114 = load i64, i64* %96, align 8, !tbaa !10
  %115 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %102, i32 0
  %116 = load i64, i64* %115, align 8, !tbaa !10
  %117 = sub i64 %114, %116
  %118 = trunc i64 %117 to i32
  %119 = icmp eq i32 %95, %109
  br i1 %119, label %125, label %120

120:                                              ; preds = %113
  %121 = icmp slt i32 %106, %118
  %122 = sub nsw i32 %118, %106
  %123 = sub nsw i32 %106, %118
  %124 = select i1 %121, i32 %122, i32 %123
  br label %138

125:                                              ; preds = %113
  %126 = icmp eq i32 %118, 0
  %127 = icmp sgt i32 %106, %35
  %128 = select i1 %126, i1 true, i1 %127
  br i1 %128, label %224, label %129

129:                                              ; preds = %125
  %130 = icmp slt i32 %106, %118
  %131 = sub nsw i32 %118, %106
  %132 = sub nsw i32 %106, %118
  %133 = select i1 %130, i32 %131, i32 %132
  %134 = icmp sgt i32 %133, %2
  br i1 %134, label %224, label %135

135:                                              ; preds = %129
  %136 = icmp slt i32 %35, %118
  %137 = select i1 %53, i1 %136, i1 false
  br i1 %137, label %224, label %138

138:                                              ; preds = %120, %135
  %139 = phi i1 [ %121, %120 ], [ %130, %135 ]
  %140 = phi i32 [ %124, %120 ], [ %133, %135 ]
  %141 = icmp sgt i32 %106, %118
  %142 = select i1 %141, i32 %118, i32 %106
  %143 = lshr i64 %104, 32
  %144 = trunc i64 %143 to i32
  %145 = and i32 %144, 255
  %146 = icmp slt i32 %145, %142
  %147 = select i1 %146, i32 %145, i32 %142
  %148 = icmp ne i32 %140, 0
  %149 = select i1 %148, i1 true, i1 %146
  br i1 %149, label %150, label %194

150:                                              ; preds = %138
  %151 = sitofp i32 %140 to float
  %152 = sitofp i32 %142 to float
  %153 = fmul float %152, %8
  %154 = tail call float @llvm.fmuladd.f32(float %7, float %151, float %153) #15
  %155 = icmp sgt i32 %140, 0
  br i1 %155, label %156, label %170

156:                                              ; preds = %150
  %157 = add nuw nsw i32 %140, 1
  %158 = sitofp i32 %157 to float
  %159 = bitcast float %158 to i32
  %160 = lshr i32 %159, 23
  %161 = and i32 %160, 255
  %162 = add nsw i32 %161, -128
  %163 = uitofp i32 %162 to float
  %164 = and i32 %159, -2139095041
  %165 = or i32 %164, 1065353216
  %166 = bitcast i32 %165 to float
  %167 = tail call float @llvm.fmuladd.f32(float %166, float 0xBFD611FF20000000, float 0x4000328400000000) #15
  %168 = tail call float @llvm.fmuladd.f32(float %167, float %166, float 0xBFE59898E0000000) #15
  %169 = fadd float %168, %163
  br label %170

170:                                              ; preds = %156, %150
  %171 = phi float [ %169, %156 ], [ 0.000000e+00, %150 ]
  %172 = select i1 %54, i1 %119, i1 false
  br i1 %172, label %190, label %173

173:                                              ; preds = %170
  %174 = icmp ne i32 %95, %109
  %175 = icmp eq i32 %118, 0
  %176 = select i1 %174, i1 %175, i1 false
  br i1 %176, label %177, label %179

177:                                              ; preds = %173
  %178 = add nsw i32 %147, 1
  br label %197

179:                                              ; preds = %173
  %180 = select i1 %139, i1 true, i1 %174
  br i1 %180, label %181, label %186

181:                                              ; preds = %179
  %182 = fcmp olt float %154, %171
  %183 = select i1 %182, float %154, float %171
  %184 = fptosi float %183 to i32
  %185 = sub nsw i32 %147, %184
  br label %194

186:                                              ; preds = %179
  %187 = tail call float @llvm.fmuladd.f32(float %171, float 5.000000e-01, float %154) #15
  %188 = fptosi float %187 to i32
  %189 = sub nsw i32 %147, %188
  br label %194

190:                                              ; preds = %170
  %191 = tail call float @llvm.fmuladd.f32(float %171, float 5.000000e-01, float %154) #15
  %192 = fptosi float %191 to i32
  %193 = sub nsw i32 %147, %192
  br label %194

194:                                              ; preds = %138, %181, %186, %190
  %195 = phi i32 [ %147, %138 ], [ %185, %181 ], [ %189, %186 ], [ %193, %190 ]
  %196 = icmp eq i32 %195, -2147483648
  br i1 %196, label %224, label %197

197:                                              ; preds = %177, %194
  %198 = phi i32 [ %178, %177 ], [ %195, %194 ]
  %199 = getelementptr inbounds i32, i32* %42, i32 %102
  %200 = load i32, i32* %199, align 4, !tbaa !4
  %201 = add nsw i32 %200, %198
  %202 = icmp sgt i32 %201, %99
  br i1 %202, label %203, label %207

203:                                              ; preds = %197
  %204 = icmp sgt i32 %98, 0
  %205 = sext i1 %204 to i32
  %206 = add nsw i32 %98, %205
  br label %214

207:                                              ; preds = %197
  %208 = getelementptr inbounds i32, i32* %46, i32 %102
  %209 = load i32, i32* %208, align 4, !tbaa !4
  %210 = icmp eq i32 %209, %59
  br i1 %210, label %211, label %214

211:                                              ; preds = %207
  %212 = add nsw i32 %98, 1
  %213 = icmp slt i32 %98, %3
  br i1 %213, label %214, label %230

214:                                              ; preds = %203, %207, %211
  %215 = phi i64 [ %100, %211 ], [ %100, %207 ], [ %101, %203 ]
  %216 = phi i32 [ %99, %211 ], [ %99, %207 ], [ %201, %203 ]
  %217 = phi i32 [ %212, %211 ], [ %98, %207 ], [ %206, %203 ]
  %218 = getelementptr inbounds i64, i64* %40, i32 %102
  %219 = load i64, i64* %218, align 8, !tbaa !15
  %220 = icmp sgt i64 %219, -1
  br i1 %220, label %221, label %224

221:                                              ; preds = %214
  %222 = trunc i64 %219 to i32
  %223 = getelementptr inbounds i32, i32* %46, i32 %222
  store i32 %59, i32* %223, align 4, !tbaa !4
  br label %224

224:                                              ; preds = %135, %129, %125, %97, %194, %221, %214
  %225 = phi i64 [ %215, %214 ], [ %215, %221 ], [ %100, %194 ], [ %100, %97 ], [ %100, %125 ], [ %100, %129 ], [ %100, %135 ]
  %226 = phi i32 [ %216, %214 ], [ %216, %221 ], [ %99, %194 ], [ %99, %97 ], [ %99, %125 ], [ %99, %129 ], [ %99, %135 ]
  %227 = phi i32 [ %217, %214 ], [ %217, %221 ], [ %98, %194 ], [ %98, %97 ], [ %98, %125 ], [ %98, %129 ], [ %98, %135 ]
  %228 = add nsw i64 %101, -1
  %229 = icmp sgt i64 %101, %88
  br i1 %229, label %97, label %230, !llvm.loop !25

230:                                              ; preds = %224, %211, %83
  %231 = phi i64 [ %89, %83 ], [ %101, %211 ], [ %228, %224 ]
  %232 = phi i64 [ -1, %83 ], [ %100, %211 ], [ %225, %224 ]
  %233 = phi i32 [ %65, %83 ], [ %99, %211 ], [ %226, %224 ]
  %234 = icmp slt i64 %57, 0
  br i1 %234, label %243, label %235

235:                                              ; preds = %230
  %236 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %60, i32 0, i32 0
  %237 = load i64, i64* %236, align 8, !tbaa !10
  %238 = trunc i64 %57 to i32
  %239 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %238, i32 0
  %240 = load i64, i64* %239, align 8, !tbaa !10
  %241 = sub i64 %237, %240
  %242 = icmp ugt i64 %241, %49
  br i1 %242, label %243, label %256

243:                                              ; preds = %235, %230
  br i1 %90, label %244, label %371

244:                                              ; preds = %243, %244
  %245 = phi i32 [ %253, %244 ], [ -2147483648, %243 ]
  %246 = phi i64 [ %252, %244 ], [ -1, %243 ]
  %247 = phi i64 [ %254, %244 ], [ %89, %243 ]
  %248 = trunc i64 %247 to i32
  %249 = getelementptr inbounds i32, i32* %42, i32 %248
  %250 = load i32, i32* %249, align 4, !tbaa !4
  %251 = icmp slt i32 %245, %250
  %252 = select i1 %251, i64 %247, i64 %246
  %253 = select i1 %251, i32 %250, i32 %245
  %254 = add nsw i64 %247, -1
  %255 = icmp sgt i64 %247, %88
  br i1 %255, label %244, label %256, !llvm.loop !26

256:                                              ; preds = %244, %235
  %257 = phi i64 [ %57, %235 ], [ %252, %244 ]
  %258 = icmp sgt i64 %257, -1
  %259 = icmp slt i64 %257, %231
  %260 = select i1 %258, i1 %259, i1 false
  br i1 %260, label %261, label %371

261:                                              ; preds = %256
  %262 = trunc i64 %257 to i32
  %263 = trunc i64 %62 to i32
  %264 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %262, i32 1
  %265 = load i64, i64* %264, align 8, !tbaa !13
  %266 = trunc i64 %265 to i32
  %267 = sub nsw i32 %263, %266
  %268 = lshr i64 %62, 48
  %269 = trunc i64 %268 to i32
  %270 = and i32 %269, 255
  %271 = lshr i64 %265, 48
  %272 = trunc i64 %271 to i32
  %273 = and i32 %272, 255
  %274 = icmp slt i32 %267, 1
  %275 = icmp sgt i32 %267, %31
  %276 = or i1 %274, %275
  br i1 %276, label %371, label %277

277:                                              ; preds = %261
  %278 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %60, i32 0, i32 0
  %279 = load i64, i64* %278, align 8, !tbaa !10
  %280 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %262, i32 0
  %281 = load i64, i64* %280, align 8, !tbaa !10
  %282 = sub i64 %279, %281
  %283 = trunc i64 %282 to i32
  %284 = icmp eq i32 %270, %273
  br i1 %284, label %290, label %285

285:                                              ; preds = %277
  %286 = icmp slt i32 %267, %283
  %287 = sub nsw i32 %283, %267
  %288 = sub nsw i32 %267, %283
  %289 = select i1 %286, i32 %287, i32 %288
  br label %303

290:                                              ; preds = %277
  %291 = icmp eq i32 %283, 0
  %292 = icmp sgt i32 %267, %35
  %293 = select i1 %291, i1 true, i1 %292
  br i1 %293, label %371, label %294

294:                                              ; preds = %290
  %295 = icmp slt i32 %267, %283
  %296 = sub nsw i32 %283, %267
  %297 = sub nsw i32 %267, %283
  %298 = select i1 %295, i32 %296, i32 %297
  %299 = icmp sgt i32 %298, %2
  br i1 %299, label %371, label %300

300:                                              ; preds = %294
  %301 = icmp slt i32 %35, %283
  %302 = select i1 %53, i1 %301, i1 false
  br i1 %302, label %371, label %303

303:                                              ; preds = %285, %300
  %304 = phi i1 [ %286, %285 ], [ %295, %300 ]
  %305 = phi i32 [ %289, %285 ], [ %298, %300 ]
  %306 = icmp sgt i32 %267, %283
  %307 = select i1 %306, i32 %283, i32 %267
  %308 = lshr i64 %265, 32
  %309 = trunc i64 %308 to i32
  %310 = and i32 %309, 255
  %311 = icmp slt i32 %310, %307
  %312 = select i1 %311, i32 %310, i32 %307
  %313 = icmp ne i32 %305, 0
  %314 = select i1 %313, i1 true, i1 %311
  br i1 %314, label %315, label %359

315:                                              ; preds = %303
  %316 = sitofp i32 %305 to float
  %317 = sitofp i32 %307 to float
  %318 = fmul float %317, %8
  %319 = tail call float @llvm.fmuladd.f32(float %7, float %316, float %318) #15
  %320 = icmp sgt i32 %305, 0
  br i1 %320, label %321, label %335

321:                                              ; preds = %315
  %322 = add nuw nsw i32 %305, 1
  %323 = sitofp i32 %322 to float
  %324 = bitcast float %323 to i32
  %325 = lshr i32 %324, 23
  %326 = and i32 %325, 255
  %327 = add nsw i32 %326, -128
  %328 = uitofp i32 %327 to float
  %329 = and i32 %324, -2139095041
  %330 = or i32 %329, 1065353216
  %331 = bitcast i32 %330 to float
  %332 = tail call float @llvm.fmuladd.f32(float %331, float 0xBFD611FF20000000, float 0x4000328400000000) #15
  %333 = tail call float @llvm.fmuladd.f32(float %332, float %331, float 0xBFE59898E0000000) #15
  %334 = fadd float %333, %328
  br label %335

335:                                              ; preds = %321, %315
  %336 = phi float [ %334, %321 ], [ 0.000000e+00, %315 ]
  %337 = select i1 %54, i1 %284, i1 false
  br i1 %337, label %355, label %338

338:                                              ; preds = %335
  %339 = icmp ne i32 %270, %273
  %340 = icmp eq i32 %283, 0
  %341 = select i1 %339, i1 %340, i1 false
  br i1 %341, label %342, label %344

342:                                              ; preds = %338
  %343 = add nsw i32 %312, 1
  br label %362

344:                                              ; preds = %338
  %345 = select i1 %304, i1 true, i1 %339
  br i1 %345, label %346, label %351

346:                                              ; preds = %344
  %347 = fcmp olt float %319, %336
  %348 = select i1 %347, float %319, float %336
  %349 = fptosi float %348 to i32
  %350 = sub nsw i32 %312, %349
  br label %359

351:                                              ; preds = %344
  %352 = tail call float @llvm.fmuladd.f32(float %336, float 5.000000e-01, float %319) #15
  %353 = fptosi float %352 to i32
  %354 = sub nsw i32 %312, %353
  br label %359

355:                                              ; preds = %335
  %356 = tail call float @llvm.fmuladd.f32(float %336, float 5.000000e-01, float %319) #15
  %357 = fptosi float %356 to i32
  %358 = sub nsw i32 %312, %357
  br label %359

359:                                              ; preds = %303, %346, %351, %355
  %360 = phi i32 [ %312, %303 ], [ %350, %346 ], [ %354, %351 ], [ %358, %355 ]
  %361 = icmp eq i32 %360, -2147483648
  br i1 %361, label %371, label %362

362:                                              ; preds = %342, %359
  %363 = phi i32 [ %343, %342 ], [ %360, %359 ]
  %364 = getelementptr inbounds i32, i32* %42, i32 %262
  %365 = load i32, i32* %364, align 4, !tbaa !4
  %366 = add nsw i32 %365, %363
  %367 = icmp slt i32 %233, %366
  br i1 %367, label %368, label %371

368:                                              ; preds = %362
  %369 = getelementptr inbounds i32, i32* %42, i32 %59
  store i32 %366, i32* %369, align 4, !tbaa !4
  %370 = getelementptr inbounds i64, i64* %40, i32 %59
  store i64 %257, i64* %370, align 8, !tbaa !15
  br label %377

371:                                              ; preds = %243, %300, %294, %290, %261, %362, %359, %256
  %372 = phi i64 [ %257, %300 ], [ %257, %294 ], [ %257, %290 ], [ %257, %261 ], [ %257, %362 ], [ %257, %359 ], [ %257, %256 ], [ -1, %243 ]
  %373 = getelementptr inbounds i32, i32* %42, i32 %59
  store i32 %233, i32* %373, align 4, !tbaa !4
  %374 = getelementptr inbounds i64, i64* %40, i32 %59
  store i64 %232, i64* %374, align 8, !tbaa !15
  %375 = icmp sgt i64 %232, -1
  %376 = trunc i64 %232 to i32
  br i1 %375, label %377, label %384

377:                                              ; preds = %368, %371
  %378 = phi i64 [ %257, %368 ], [ %372, %371 ]
  %379 = phi i32 [ %366, %368 ], [ %233, %371 ]
  %380 = phi i32 [ %262, %368 ], [ %376, %371 ]
  %381 = getelementptr inbounds i32, i32* %44, i32 %380
  %382 = load i32, i32* %381, align 4, !tbaa !4
  %383 = icmp sgt i32 %382, %379
  br i1 %383, label %387, label %384

384:                                              ; preds = %377, %371
  %385 = phi i64 [ %378, %377 ], [ %372, %371 ]
  %386 = phi i32 [ %379, %377 ], [ %233, %371 ]
  br label %387

387:                                              ; preds = %377, %384
  %388 = phi i64 [ %385, %384 ], [ %378, %377 ]
  %389 = phi i32 [ %386, %384 ], [ %379, %377 ]
  %390 = phi i32 [ %386, %384 ], [ %382, %377 ]
  %391 = getelementptr inbounds i32, i32* %44, i32 %59
  store i32 %390, i32* %391, align 4, !tbaa !4
  %392 = icmp slt i64 %388, 0
  br i1 %392, label %405, label %393

393:                                              ; preds = %387
  %394 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %60, i32 0, i32 0
  %395 = load i64, i64* %394, align 8, !tbaa !10
  %396 = trunc i64 %388 to i32
  %397 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %396, i32 0
  %398 = load i64, i64* %397, align 8, !tbaa !10
  %399 = sub i64 %395, %398
  %400 = icmp ugt i64 %399, %49
  br i1 %400, label %406, label %401

401:                                              ; preds = %393
  %402 = getelementptr inbounds i32, i32* %42, i32 %396
  %403 = load i32, i32* %402, align 4, !tbaa !4
  %404 = icmp slt i32 %403, %389
  br i1 %404, label %405, label %406

405:                                              ; preds = %401, %387
  br label %406

406:                                              ; preds = %405, %401, %393
  %407 = phi i64 [ %58, %405 ], [ %388, %401 ], [ %388, %393 ]
  %408 = add nuw nsw i64 %58, 1
  %409 = icmp slt i64 %408, %11
  br i1 %409, label %55, label %410, !llvm.loop !27

410:                                              ; preds = %406, %29
  %411 = call i64* @mg_chain_backtrack(i8* undef, i64 noundef %11, i32* noundef %42, i64* noundef %40, i32* noundef %44, i32* noundef %46, i32 noundef %5, i32 noundef %6, i32 noundef %36, i32* noundef nonnull %17, i32* noundef nonnull %18)
  %412 = load i32, i32* %17, align 4, !tbaa !4
  store i32 %412, i32* %13, align 4, !tbaa !4
  store i64* %411, i64** %14, align 4, !tbaa !22
  tail call void @free(i8* noundef %39)
  tail call void @free(i8* noundef %41)
  tail call void @free(i8* noundef %45)
  %413 = icmp eq i32 %412, 0
  br i1 %413, label %414, label %416

414:                                              ; preds = %410
  %415 = bitcast %struct.mm128_t* %12 to i8*
  tail call void @free(i8* noundef %415)
  tail call void @free(i8* noundef %43)
  br label %515

416:                                              ; preds = %410
  %417 = load i32, i32* %18, align 4, !tbaa !4
  %418 = shl i32 %417, 4
  %419 = tail call noalias i8* @malloc(i32 noundef %418) #17
  %420 = bitcast i8* %419 to %struct.mm128_t*
  %421 = sext i32 %412 to i64
  %422 = icmp sgt i32 %412, 0
  br i1 %422, label %423, label %454

423:                                              ; preds = %416, %450
  %424 = phi i64 [ %452, %450 ], [ 0, %416 ]
  %425 = phi i64 [ %451, %450 ], [ 0, %416 ]
  %426 = trunc i64 %424 to i32
  %427 = getelementptr inbounds i64, i64* %411, i32 %426
  %428 = load i64, i64* %427, align 8, !tbaa !15
  %429 = shl i64 %428, 32
  %430 = ashr exact i64 %429, 32
  %431 = icmp sgt i64 %429, 0
  br i1 %431, label %432, label %450

432:                                              ; preds = %423
  %433 = add i64 %428, %425
  br label %434

434:                                              ; preds = %434, %432
  %435 = phi i64 [ 0, %432 ], [ %448, %434 ]
  %436 = phi i64 [ %425, %432 ], [ %437, %434 ]
  %437 = add nsw i64 %436, 1
  %438 = trunc i64 %436 to i32
  %439 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %420, i32 %438
  %440 = xor i64 %435, -1
  %441 = add i64 %433, %440
  %442 = trunc i64 %441 to i32
  %443 = getelementptr inbounds i32, i32* %44, i32 %442
  %444 = load i32, i32* %443, align 4, !tbaa !4
  %445 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %444
  %446 = bitcast %struct.mm128_t* %439 to i8*
  %447 = bitcast %struct.mm128_t* %445 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* noundef nonnull align 8 dereferenceable(16) %446, i8* noundef nonnull align 8 dereferenceable(16) %447, i32 16, i1 false) #15, !tbaa.struct !28
  %448 = add nuw nsw i64 %435, 1
  %449 = icmp sgt i64 %430, %448
  br i1 %449, label %434, label %450, !llvm.loop !29

450:                                              ; preds = %434, %423
  %451 = phi i64 [ %425, %423 ], [ %437, %434 ]
  %452 = add nuw nsw i64 %424, 1
  %453 = icmp slt i64 %452, %421
  br i1 %453, label %423, label %454, !llvm.loop !30

454:                                              ; preds = %450, %416
  tail call void @free(i8* noundef %43) #15
  %455 = shl i32 %412, 4
  %456 = tail call noalias i8* @malloc(i32 noundef %455) #17
  %457 = bitcast i8* %456 to %struct.mm128_t*
  br i1 %422, label %461, label %458

458:                                              ; preds = %454
  %459 = shl i32 %412, 3
  %460 = tail call noalias i8* @malloc(i32 noundef %459) #17
  br label %509

461:                                              ; preds = %454, %461
  %462 = phi i64 [ %477, %461 ], [ 0, %454 ]
  %463 = phi i64 [ %476, %461 ], [ 0, %454 ]
  %464 = trunc i64 %463 to i32
  %465 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %420, i32 %464, i32 0
  %466 = load i64, i64* %465, align 8, !tbaa !10
  %467 = trunc i64 %462 to i32
  %468 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %457, i32 %467, i32 0
  store i64 %466, i64* %468, align 8, !tbaa !10
  %469 = shl i64 %463, 32
  %470 = or i64 %469, %462
  %471 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %457, i32 %467, i32 1
  store i64 %470, i64* %471, align 8, !tbaa !13
  %472 = getelementptr inbounds i64, i64* %411, i32 %467
  %473 = load i64, i64* %472, align 8, !tbaa !15
  %474 = shl i64 %473, 32
  %475 = ashr exact i64 %474, 32
  %476 = add nsw i64 %475, %463
  %477 = add nuw nsw i64 %462, 1
  %478 = icmp slt i64 %477, %421
  br i1 %478, label %461, label %479, !llvm.loop !31

479:                                              ; preds = %461
  %480 = shl i32 %412, 3
  %481 = tail call noalias i8* @malloc(i32 noundef %480) #17
  %482 = bitcast i8* %481 to i64*
  br label %483

483:                                              ; preds = %479, %483
  %484 = phi i64 [ %504, %483 ], [ 0, %479 ]
  %485 = phi i64 [ %503, %483 ], [ 0, %479 ]
  %486 = trunc i64 %484 to i32
  %487 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %457, i32 %486, i32 1
  %488 = load i64, i64* %487, align 8, !tbaa !13
  %489 = trunc i64 %488 to i32
  %490 = getelementptr inbounds i64, i64* %411, i32 %489
  %491 = load i64, i64* %490, align 8, !tbaa !15
  %492 = trunc i64 %491 to i32
  %493 = getelementptr inbounds i64, i64* %482, i32 %486
  store i64 %491, i64* %493, align 8, !tbaa !15
  %494 = trunc i64 %485 to i32
  %495 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %12, i32 %494
  %496 = bitcast %struct.mm128_t* %495 to i8*
  %497 = lshr i64 %488, 32
  %498 = trunc i64 %497 to i32
  %499 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %420, i32 %498
  %500 = bitcast %struct.mm128_t* %499 to i8*
  %501 = shl i32 %492, 4
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 8 %496, i8* align 8 %500, i32 %501, i1 false) #15
  %502 = and i64 %491, 4294967295
  %503 = add i64 %502, %485
  %504 = add nuw nsw i64 %484, 1
  %505 = icmp slt i64 %504, %421
  br i1 %505, label %483, label %506, !llvm.loop !32

506:                                              ; preds = %483
  %507 = trunc i64 %503 to i32
  %508 = shl i32 %507, 4
  br label %509

509:                                              ; preds = %458, %506
  %510 = phi i8* [ %481, %506 ], [ %460, %458 ]
  %511 = phi i32 [ %480, %506 ], [ %459, %458 ]
  %512 = phi i32 [ %508, %506 ], [ 0, %458 ]
  %513 = bitcast i64* %411 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 8 %513, i8* align 8 %510, i32 %511, i1 false) #15
  %514 = bitcast %struct.mm128_t* %12 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 8 %419, i8* align 8 %514, i32 %512, i1 false) #15
  tail call void @free(i8* noundef %514) #15
  tail call void @free(i8* noundef %456) #15
  tail call void @free(i8* noundef %510) #15
  br label %515

515:                                              ; preds = %509, %414, %27
  %516 = phi %struct.mm128_t* [ null, %27 ], [ null, %414 ], [ %420, %509 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %20) #15
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %19) #15
  ret %struct.mm128_t* %516
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn allocsize(0,1)
declare dso_local noalias noundef i8* @calloc(i32 noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
define dso_local i32 @main(i32 noundef %0, i8** nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = alloca %struct.mm128_t, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64*, align 4
  %6 = icmp eq i32 %0, 14
  br i1 %6, label %13, label %7

7:                                                ; preds = %2
  %8 = load %struct._reent*, %struct._reent** @_impure_ptr, align 4, !tbaa !22
  %9 = getelementptr inbounds %struct._reent, %struct._reent* %8, i32 0, i32 3
  %10 = load %struct.__sFILE*, %struct.__sFILE** %9, align 4, !tbaa !33
  %11 = load i8*, i8** %1, align 4, !tbaa !22
  %12 = tail call i32 (%struct.__sFILE*, i8*, ...) @fprintf(%struct.__sFILE* noundef %10, i8* noundef getelementptr inbounds ([116 x i8], [116 x i8]* @.str.2, i32 0, i32 0), i8* noundef %11)
  br label %74

13:                                               ; preds = %2
  %14 = getelementptr inbounds i8*, i8** %1, i32 1
  %15 = load i8*, i8** %14, align 4, !tbaa !22
  %16 = tail call i32 @atoi(i8* noundef %15)
  %17 = getelementptr inbounds i8*, i8** %1, i32 2
  %18 = load i8*, i8** %17, align 4, !tbaa !22
  %19 = tail call i32 @atoi(i8* noundef %18)
  %20 = getelementptr inbounds i8*, i8** %1, i32 3
  %21 = load i8*, i8** %20, align 4, !tbaa !22
  %22 = tail call i32 @atoi(i8* noundef %21)
  %23 = getelementptr inbounds i8*, i8** %1, i32 4
  %24 = load i8*, i8** %23, align 4, !tbaa !22
  %25 = tail call i32 @atoi(i8* noundef %24)
  %26 = getelementptr inbounds i8*, i8** %1, i32 5
  %27 = load i8*, i8** %26, align 4, !tbaa !22
  %28 = tail call i32 @atoi(i8* noundef %27)
  %29 = getelementptr inbounds i8*, i8** %1, i32 6
  %30 = load i8*, i8** %29, align 4, !tbaa !22
  %31 = tail call i32 @atoi(i8* noundef %30)
  %32 = getelementptr inbounds i8*, i8** %1, i32 7
  %33 = load i8*, i8** %32, align 4, !tbaa !22
  %34 = tail call i32 @atoi(i8* noundef %33)
  %35 = getelementptr inbounds i8*, i8** %1, i32 8
  %36 = load i8*, i8** %35, align 4, !tbaa !22
  %37 = tail call double @atof(i8* noundef %36)
  %38 = fptrunc double %37 to float
  %39 = getelementptr inbounds i8*, i8** %1, i32 9
  %40 = load i8*, i8** %39, align 4, !tbaa !22
  %41 = tail call double @atof(i8* noundef %40)
  %42 = fptrunc double %41 to float
  %43 = getelementptr inbounds i8*, i8** %1, i32 10
  %44 = load i8*, i8** %43, align 4, !tbaa !22
  %45 = tail call i32 @atoi(i8* noundef %44)
  %46 = getelementptr inbounds i8*, i8** %1, i32 11
  %47 = load i8*, i8** %46, align 4, !tbaa !22
  %48 = tail call i32 @atoi(i8* noundef %47)
  %49 = getelementptr inbounds i8*, i8** %1, i32 12
  %50 = load i8*, i8** %49, align 4, !tbaa !22
  %51 = tail call i64 @atoll(i8* noundef %50)
  %52 = bitcast %struct.mm128_t* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %52) #15
  %53 = getelementptr inbounds i8*, i8** %1, i32 13
  %54 = load i8*, i8** %53, align 4, !tbaa !22
  %55 = tail call i64 @strtoull(i8* nocapture noundef %54, i8** noundef null, i32 noundef 10)
  %56 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %3, i32 0, i32 0
  store i64 %55, i64* %56, align 8, !tbaa !10
  %57 = getelementptr inbounds i8*, i8** %1, i32 14
  %58 = load i8*, i8** %57, align 4, !tbaa !22
  %59 = tail call i64 @strtoull(i8* nocapture noundef %58, i8** noundef null, i32 noundef 10)
  %60 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %3, i32 0, i32 1
  store i64 %59, i64* %60, align 8, !tbaa !13
  %61 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %61) #15
  %62 = bitcast i64** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %62) #15
  %63 = call %struct.mm128_t* @mg_lchain_dp(i32 noundef %16, i32 noundef %19, i32 noundef %22, i32 noundef %25, i32 noundef %28, i32 noundef %31, i32 noundef %34, float noundef %38, float noundef %42, i32 noundef %45, i32 noundef %48, i64 noundef %51, %struct.mm128_t* noundef nonnull %3, i32* noundef nonnull %4, i64** noundef nonnull %5, i8* undef)
  %64 = icmp eq %struct.mm128_t* %63, null
  br i1 %64, label %71, label %65

65:                                               ; preds = %13
  %66 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %63, i32 0, i32 0
  %67 = load i64, i64* %66, align 8, !tbaa !10
  %68 = getelementptr inbounds %struct.mm128_t, %struct.mm128_t* %63, i32 0, i32 1
  %69 = load i64, i64* %68, align 8, !tbaa !13
  %70 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i32 0, i32 0), i64 noundef %67, i64 noundef %69)
  br label %73

71:                                               ; preds = %13
  %72 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([27 x i8], [27 x i8]* @str, i32 0, i32 0))
  br label %73

73:                                               ; preds = %71, %65
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %62) #15
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %61) #15
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %52) #15
  br label %74

74:                                               ; preds = %73, %7
  %75 = phi i32 [ 1, %7 ], [ 0, %73 ]
  ret i32 %75
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct.__sFILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i32 @atoi(i8* nocapture noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local double @atof(i8* nocapture noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind readonly willreturn
declare dso_local i64 @atoll(i8* nocapture noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn
declare dso_local i64 @strtoull(i8* noundef readonly, i8** nocapture noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #10

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #11

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #12

attributes #0 = { nounwind "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+d,+f,+m" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nounwind willreturn allocsize(0) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+d,+f,+m" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #4 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+d,+f,+m" }
attributes #5 = { noreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+d,+f,+m" }
attributes #6 = { inaccessiblememonly mustprogress nofree nounwind willreturn allocsize(0,1) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+d,+f,+m" }
attributes #7 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+d,+f,+m" }
attributes #8 = { mustprogress nofree nounwind readonly willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+d,+f,+m" }
attributes #9 = { mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+a,+c,+d,+f,+m" }
attributes #10 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #11 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #12 = { nofree nounwind }
attributes #13 = { allocsize(0) }
attributes #14 = { noreturn nounwind }
attributes #15 = { nounwind }
attributes #16 = { allocsize(0,1) }
attributes #17 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32d"}
!2 = !{i32 1, !"SmallDataLimit", i32 8}
!3 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!11, !12, i64 0}
!11 = !{!"", !12, i64 0, !12, i64 8}
!12 = !{!"long long", !6, i64 0}
!13 = !{!11, !12, i64 8}
!14 = distinct !{!14, !9}
!15 = !{!12, !12, i64 0}
!16 = distinct !{!16, !9}
!17 = distinct !{!17, !9}
!18 = distinct !{!18, !9}
!19 = distinct !{!19, !9}
!20 = distinct !{!20, !9}
!21 = distinct !{!21, !9}
!22 = !{!23, !23, i64 0}
!23 = !{!"any pointer", !6, i64 0}
!24 = distinct !{!24, !9}
!25 = distinct !{!25, !9}
!26 = distinct !{!26, !9}
!27 = distinct !{!27, !9}
!28 = !{i64 0, i64 8, !15, i64 8, i64 8, !15}
!29 = distinct !{!29, !9}
!30 = distinct !{!30, !9}
!31 = distinct !{!31, !9}
!32 = distinct !{!32, !9}
!33 = !{!34, !23, i64 12}
!34 = !{!"_reent", !5, i64 0, !23, i64 4, !23, i64 8, !23, i64 12, !5, i64 16, !6, i64 20, !23, i64 48, !23, i64 52, !23, i64 56, !5, i64 60, !23, i64 64, !23, i64 68, !5, i64 72, !23, i64 76, !6, i64 80, !23, i64 280}
