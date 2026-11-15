/-
Canonical file: CollatzWilsonCombined.lean
Version: v23
SHA256 (body, after this header block; one source line per line, LF line endings and a final LF; the same value for this .lean and for its .docx with one paragraph per line, empty paragraphs as empty lines): 7fb005e75886e2fe774b34edf1ceb194b8fa709de04a5e1925b782699657b440
Rule: .docx is generated from this file. Do not edit the .docx.
Status: Single standalone file (Mathlib imports only) combining three sources, in dependency order: (1) namespace CollatzTransferV117 (the attached Collatz Transfer file); (2) namespace PadicWilsonBridge (PadicWilsonBridge.lean v11, body SHA256 743091df1b00bc1d69e316106a25206a53db264d1ee031da14384e85f1878e4f, apart from one comment line, plus Sections 9 and 9b added here in v4 and v5, Section 10 added in v6, Section 11 added in v7 and extended in v8, Section 12 added in v9, Section 13 added in v10, Section 14 added in v11, Section 15 added in v12, Section 16 added in v13, Section 17 added in v14; compile fixes in v15–v22), whose section GlueV117 uses Part 1; (3) namespace CollatzTransfer (CollatzTransferTower.lean v123, body SHA256 d2607acdabb8c840507efdef4f086132a8f9b347308c4581d94c66ebbecb691c), whose Section 7 uses Part 2. Zero sorrys and zero axioms in the body. Compiler-verified: v22 (body SHA256 a1a945124c21e75d0fce102e343c66eaa4fcc6cda2337675062483a1de62b785) compiled with Lean 4.35.0 and Mathlib v4.35.0 with no errors (276 warnings: unused simp arguments, deprecated names, unused variables), on the user’s toolchain; v23 differs from v22 only in comments and in this header. Compiler-verified means that each theorem follows from its stated hypotheses; several results are conditional on explicit hypotheses (e.g. TwoPointTransferForm, AsymptoticTwoPointTransferForm, CharOrthogonalOnLinks, the moment-stabilization and normalization hypotheses of the adelic and p = 7 results), and the operators are model operators on residues modulo 3^j and 7^l, not the Collatz map on the integers; nothing here concerns reachability.
Combination changes: the import lines of the three sources were removed and replaced by one import block (the union of their Mathlib imports); `import CollatzTransferV117` and `import PadicWilsonBridge` were dropped because those files are now included; one comment line marks the start of each part; leading blank lines left by the removed imports were dropped. No other line changed: every declaration, comment and blank line of the three bodies is carried over verbatim (blank lines from CollatzTransferTower keep their single space). Comments that describe the old multi-file layout are now historical: the GlueV117 header comment in Part 2 (it says `import CollatzTransferV117` was added at the top of the file) and the Section 7 summary in Part 3 (it locates results in PadicWilsonBridge.lean). The per-file change histories (PadicWilsonBridge v5–v10, CollatzTransferTower v121–v123) are in the source files’ headers. This header opens with a plain comment `/-` rather than `/-!`: Lean 4 accepts only ordinary comments before `import` lines, and a `/-!` module doc there is an error (all three canonical source headers open with `/-!` before their imports and would need the same change).
v2 changes: regenerated from PadicWilsonBridge.lean v10 (Update_2: Section 7b, exact characteristic polynomial of P_collatz j, `exact_charpoly_proved`); its six new Mathlib imports are added to the import block. Part 2 depends on one Mathlib name that could not be confirmed (`LinearMap.charpoly_of_isInvariant`, in `charpoly_split_locallyConstant`). Parts 1 and 3 unchanged.
v3 changes (made directly in this combined file, on request; PadicWilsonBridge.lean v10 still has the old version): in Part 2, `charpoly_split_locallyConstant` no longer calls the unconfirmed `LinearMap.charpoly_of_isInvariant`. It now applies the new general lemma `charpoly_restrict_mul_mapQ` (field K, finite-dimensional V, invariant W), proved from a complement of W (`Submodule.exists_isCompl`, `Submodule.prodEquivOfIsCompl`), `LinearMap.charpoly_toMatrix` on the product basis, and `Matrix.charpoly_fromBlocks_zero₂₁`. The supplied proof is used as given except in `hT₂₂_conj`: `ext u` was replaced by `apply LinearMap.ext; intro q` (on a quotient, `ext` reduces to an element of V, so the next `qEquiv.surjective` step would not typecheck), and `LinearEquiv.conj_apply_apply` was added to its simp set. The Section 7b header note on this dependency was updated. No Mathlib name in the body is now known to be missing. No sorry and no axiom. NOT compiler-verified.
v4 changes (made directly in this combined file from the request “Update_3”; not in PadicWilsonBridge.lean): Part 2 gains Section 9 (finite-adelic Wilson product), inserted after collatz_padic_wilson_rg_unification and before `end PadicWilsonBridge`: structure AdelicWilsonFamily with instPrime, localTotalLevel, adelicSmear, AdelicUVStabilizedAt, adelic_uv_smear_eventually_constant, adelic_uv_smear_tendsto, adelic_converges_of_stabilized, adelic_collatz_place_unification. The request’s zero-sorry version of the last theorem (with `hg : g ≠ 0`) is used, with fixes: (1) adelicSmear and the eventually-constant statement passed the subtype `p` instead of `p.1` as the prime; (2) the spectator product over `S.attach.erase ⟨3, h3⟩` used `p.property` as a proof of `p.1 ≠ 3`, but a bound variable of the product does not carry erase-membership; the factor is now `if hp3 : p.1 = 3 then 1 else …` (the `then` branch never occurs on that set), in the statement and in the proof; (3) `hp3 ▸ t3 N` in t_adelic would need a motive over both `p` and `hp : p ∈ S`; replaced by `by subst hp3; exact t3 N`, and the 3-factor of the split is closed by `rfl`; (4) `convert … using 2` replaced by `exact` and `funext heig` by an explicit smul rewrite. The Status line now names PadicWilsonBridge v11 (it still named v10 after the v3 change). No sorry and no axiom. NOT compiler-verified.
v5 changes (made directly in this combined file from the request “Update_4”; not in PadicWilsonBridge.lean): Part 2 gains Section 9b (restricted adelic product as an inductive limit over increasing finite place sets), placed after `end AdelicWilsonFamily` and before `end AdelicExtension` (the request said before `end AdelicWilsonFamily`, but its code opens its own namespace GlobalAdelicWilsonFamily and refers to AdelicWilsonFamily as a type, so it belongs beside it): GlobalAdelicWilsonFamily with totalAt, restrictTo, restrictedSmear, IsUnramifiedAt, RestrictedAdelicStabilizedAt, restricted_adelic_inductive_limit, restricted_adelic_collatz_unification, plus new helpers primeValue, primeValue_eq, prod_attach_eq_prod_primeValue. Fixes to the request’s code: (1) the truncated tail of the last theorem (from `heig` on, flattened in the request) re-indented, `refine ⟨?, …, ?⟩` corrected to `?_`; (2) restrictTo used `▸` with a type instead of an equation; now `letI … ; Ω.localAt p`; (3) restrictedSmear took `t` with its own `N k` binders, and the calls `fun p N' _ => t p N'` did not typecheck (they fix N but not k); `t` now takes the observables at the given `N k`, as adelicSmear does, and the calls are `fun p => t p N`; (4) the proof of `row m = target` applied Finset.prod_subset to two products with different functions and treated it as giving two goals; replaced by a proof through `primeValue` (each Euler product rewritten as a product of one function over a plain Finset, then prod_subset with the vacuum condition); (5) the last step `rwa [h2] at h1` could not see through the `let`-bound target; replaced by an explicit Eq.subst. The docstring of restricted_adelic_collatz_unification claimed the target is scaled by λ; the statement does not say that, so the docstring now says what is stated and points to Section 5 for the λ computation. No sorry and no axiom. NOT compiler-verified.
v6 changes (made directly in this combined file, on request; not in PadicWilsonBridge.lean): Part 2 gains Section 10 (p-general embeddings, affine transfer families, and a 2-point bridge), placed after `end AdelicExtension` and before `end PadicWilsonBridge`. New: timeCoord, embed1 (= embed1Pt at p = 3, embed1_three), embed2, embed2_inflate, liftPow_self, projPow_inv_natCast, AffineBranch (apply, projPow_apply, even, odd), affineTransfer, IntertwinesLift, affineTransfer_liftPow (any level, no 1 ≤ k condition), pow_liftPow_of_intertwines, affineTransfer_collatz_eq (P_collatz is the p = 3, weights ½, ½ case), collatz3_intertwines, instFactPrimeSeven, sigmaOne7 (the σ = 1 operator on ℤ/7^l, weights ¼, ¾), sigmaOne7_intertwines, haarExpectation_liftPow, greenFn and greenFnConn (time-ordered 2-point functions), greenFn_liftPow and greenFnConn_liftPow (exact UV invariance), and in PadicWilsonFamily: totalLevel_mono, onePointTest, onePoint_transfer_uv_stabilized (p-general 1-point bridge), TwoPointTransferForm (the transfer-matrix hypothesis, stated explicitly as an assumption on the smeared 2-point Wilson observable), twoPoint_transfer_limit; and the instances twoPoint_sigmaOne7_limit and twoPoint_collatz3_limit. The hypothesis is stated on the smeared observable because the s-step transition kernel at a fine level is not pulled back from the coarse level (only its fiber sums are), so the pointwise condition UVStabilizedAt cannot hold for a genuine Green’s function. No sorry and no axiom. NOT compiler-verified.
v7 changes (made directly in this combined file from the request “Notes A”; not in PadicWilsonBridge.lean): Part 2 gains Section 11 (fiber shells at p = 7), placed after `end TwoPointBridge` and before `end PadicWilsonBridge`: sevenInner, IsFiberVanishing7, shellSubspace7, sevenInner_lift_fiberVanishing_eq_zero, sevenInner_liftPow, sevenInner_conj_symm, shellSubspace7_orthogonal, shellSubspace7_orthogonal_const_one, AffineBranch.apply_injective, isUnit_natCast_seven, even_apply_injective7, odd_apply_injective7, fiber_sum_comp_bijective, sigmaOne7_preserves_fiberVanishing, shellSubspace7_sigmaOne7_invariant (new; not in Notes A), prime7_uvStabilized_of_pullback, prime7_unramified_vacuum_eq_one, prime7_isUnramifiedAt (new). Fixes to the request’s code: (1) its `instFactPrimeSeven` duplicated the Section 10 instance and is dropped; (2) it cited a theorem `adelic_langlands_place3_unification` that does not exist; `hstab_other` and `hvac_other` are hypotheses of `restricted_adelic_collatz_unification` (Section 9b) and quantify over every prime p ≠ 3, so the p = 7 results supply one component, packaged as `IsUnramifiedAt`; (3) the proof of sevenInner_liftPow had `calc` holes that tactic steps cannot fill and a `rw [pow_succ]` that could rewrite inside `ZMod (7 ^ (k + 1))`; it is now proved from `haarExpectation_liftPow`; (4) the two `hfactor` steps rewrote to `(A ∘ B) ∘ C`, which `liftPow_comp` cannot match; they now unfold to `projPow` and use `projPow_trans`; (5) the conjugate-symmetry step had a redundant `mul_comm` after `star_mul, star_star`; it is now the separate lemma sevenInner_conj_symm; (6) the vacuum proof rewrote `uvLevel` after `simp` had removed it and mixed `((7 : ℕ) : ℂ)` with `(7 : ℂ)`; (7) `unfold liftPow; dsimp only` replaced by `simp only [liftPow, LinearMap.coe_mk, AddHom.coe_mk]`, as elsewhere in the file. The request’s narrative said the p = 7 spectator results follow from the orthogonality; they do not use it, and the docstrings now say so. No sorry and no axiom. NOT compiler-verified.
v8 changes (made directly in this combined file from the request “Notes B”; not in PadicWilsonBridge.lean): Section 11 gains a final part (spanning and dimensions), placed before `end PrimeSevenShells`: constSubmodule7, fullShellSpan7, downAvgLinear7, downAvgLinear7_apply, isFiberVanishing7_of_downAvg_eq_zero, downAvg_eq_zero_of_isFiberVanishing7, sub_liftStep_downAvg_mem_top_shell, zmod_seven_pow_zero_eq, liftPow_liftStep_seven, shell_mem_fullShellSpan7, liftPow_mem_fullShellSpan7, fullShellSpan7_eq_top, finrank_shellSubspace7, finrank_constSubmodule7, sum_dim_const_and_shells7, finrank_const_add_shells7 (new; not in Notes B). The Section 11 header no longer lists spanning as unproved. Fixes to the request’s code: (1) isFiberVanishing7_iff_downAvg_eq_zero (casts `hk ▸ ψ`, and `simp only [downAvg] at h` would make no progress on an IsFiberVanishing7 hypothesis) is replaced by two one-directional lemmas; (2) IsFiberVanishing7 (k + 1) is stated over ZMod (7 ^ (k + 1 - 1)) while downAvg 7 k uses ZMod (7 ^ k); these agree definitionally but not syntactically, so the request’s `simp only [hg r, …]` and `Nat.add_sub_cancel` steps across them fail; conversions now go through `exact`/`have … := h r` with explicit types; (3) liftStep_mem_fullShellSpan7 relied on `Submodule.sup_induction` and three nested `Submodule.iSup_induction`s; the induction is now on the source level j with the target level m ≥ j universally quantified (liftPow_mem_fullShellSpan7), so only the membership of individual terms is needed; (4) in finrank_shellSubspace7 the `LinearEquiv.finrank_eq` step had the wrong orientation (now `.symm`); (5) the `havg` step now goes through `map_sub` on downAvgLinear7 instead of a `rw [← …]` that could rewrite the inner `downAvg`. The request’s summary said the arithmetic identity certifies an orthogonal direct sum; the file now proves spanning, the shell dimensions and that the dimensions of the constants and the shells add up to 7 ^ j (finrank_const_add_shells7); with the orthogonality of v7 this makes the sum direct mathematically, but independence is not stated as a separate Lean theorem. No sorry and no axiom. NOT compiler-verified.
v9 changes (made directly in this combined file, on request; not in PadicWilsonBridge.lean): Part 2 gains Section 12, placed after `end PrimeSevenShells` and before `end PadicWilsonBridge`, and the import block gains `Mathlib.Analysis.SpecialFunctions.Pow.Real` (real powers λ ^ α). Section AsymptoticTwoPoint: AsymptoticTwoPointTransferForm (an explicit hypothesis replacing the exact equality of TwoPointTransferForm by λ ^ s · G up to K · λ ^ s · λ ^ α, with K uniform in the UV index and in λ; the uniformity is assumed, not derived), affineTransfer_const_one, sigmaOne7_const_one, pow_apply_const_one, haarExpectation_const_one, greenFn_const_one, liftPow_const_one, normalized_twoPoint_bound (vacuum-normalized ratio bound), normalized_twoPoint_strong_coupling_limit (λ → 0⁺, uniformly in the UV index), normalized_twoPoint_sigmaOne7_limit. Section AffineShiftGaugeModel (manuscript §11.7): GSite, branchData, branchSite, yzShift, tShift, branchSite_tShift, yzShift_comm, GaugeConfig with gauge, plaqSpatial, plaqLongSpatial, plaqMixed, plaqMixedLong and their gauge-covariance theorems (any group), plaquettes_gauge_invariant (abelian groups; Proposition 11.7.1), prod_zpow_eq_zpow_sum′, mixedMonomial, netCharge, VpartOf, mixedMonomial_factor (charge conservation: the exponent of each transverse link is the net plaquette charge into its node of the affine-shift graph), CharOrthogonalOnLinks (the Haar orthogonality used, as a hypothesis), integrate_transverse_links (Proposition 11.7.2 in the mixed-plaquette sector), netCharge_eq_zero_iff, branch_coincidence_seven (the 7-adic branches agree exactly at v = −2⁻¹, at every level). Changes to the request: the error exponent α is a parameter (α = 3/2 for the full model is the cheapest correction found, not a proved bound); the strong-coupling theorem asserts that the normalized ratio stays within O(λ ^ α) of the coarse Green’s function uniformly in N and tends to it as λ → 0⁺, not that it converges as N → ∞ at fixed λ; the decay bound 1.3028 · 0.804231 ^ s is numerical (manuscript §4.1) and is not derived. Not formalized: the heat-kernel weights and character expansion, Proposition 11.7.2 with spatial and longitudinal plaquettes, Proposition 11.7.3, and any gauge measure satisfying the hypothesis. The existing TwoPointTransferForm and its theorems are kept unchanged. No sorry and no axiom. NOT compiler-verified.
v10 changes (made directly in this combined file, on request; not in PadicWilsonBridge.lean): Part 2 gains Section 13 (section LambdaSquareSeven), placed after `end AffineShiftGaugeModel` and before `end PadicWilsonBridge`, formalizing the operator side of manuscript Proposition 11.7.5 at p = 7. New: sB0, sB1, sI0, sI1 (branches and their inverses at every level), sev_two_mul_inv, sev_three_mul_inv, sB0_sI0, sI0_sB0, sB1_sI1, sI1_sB1, sE0, sE1, sigmaOne7_apply′, sVstar, sHstar, sB1_sVstar, sI0_eq_sVstar_iff, sI1_eq_sVstar_iff, projPow_sev_two_inv, projPow_sev_three_inv, projPow_sB0, projPow_sB1, projPow_sI0, projPow_sI1, sevComp, sevOff, sevAt (with _apply lemmas and sevOff_eq_sub_sevAt), sevR0, sevS0, sevT0, sevR, sevS, sevT, sevE, lamSqCoeff (the order-λ² operator, as a definition), lamSqCoeffInf, sevPair with sevPair_add/sub/smul/sum/off/at/const_one, sevAdj, sum_comp_sB0, sum_comp_sB1, sevPair_sigmaOne7 (adjoint), sevPair_pow, sevAdj_const_one, sevAdj_pow_const_one, lamSqCoeff_const (Proposition 11.7.5(b): 3/4 + 3D/16 − (3/4 + 9D/16)/7ˡ), sevR0_liftPow, sevS0_liftPow, sevT0_liftPow, lamSqCoeffInf_liftPow, lamSqCoeffInf_lift (level independence), norm_ofReal_nonneg′, sev_norm_const, sevAdj_pow_bound, sigmaOne7_pow_bound, sevR0_bound, sevS0_bound, sevT0_bound, sevPair_at_le, lamSqCoeff_diff, lamSqCoeff_sub_bound (the (3/16)(3D + 4)·a·b/7ˡ bound), lamSqCoeff_level_uniform (Proposition 11.7.5(c)). Not formalized: Lemma 11.7.4 and Proposition 11.7.5(a), i.e. that lamSqCoeff is the λ² coefficient of the Villain column correlator; this needs the flow expansion, which is not in the file. The theorems are therefore statements about the operator lamSqCoeff. No new imports. No sorry and no axiom. NOT compiler-verified.
v11 changes (made directly in this combined file, on request; not in PadicWilsonBridge.lean): Part 2 gains Section 14 (section LambdaThreeHalfSeven), placed after `end LambdaSquareSeven` and before `end PadicWilsonBridge`, formalizing the operator side of manuscript Proposition 11.7.7 (full model, order λ^{3/2}, p = 7). New: sevKappaR (κ = (3/8)(1 + √3)), sevKappa, sevKappaR_nonneg, sevPiStar (multiplication by the indicator of v* = −2⁻¹, = sevAt (sVstar l)), sevPiStar_apply, lamThreeHalfCoeff (the order-λ^{3/2} operator κ Σ_{k<D} Lᵏ Π* L^{D−k}, as a definition), lamThreeHalf_pair (exact smeared formula), lamThreeHalf_bound (κ D a b / 7ˡ), lamThreeHalf_lifted_bound (lifted insertions), lamThreeHalf_const (κ D / 7ˡ for constant insertions). Not formalized: Lemma 11.7.6 and Proposition 11.7.7(a), i.e. that lamThreeHalfCoeff is the λ^{3/2} coefficient of the full-model correlator (this needs the cycle-valued flow expansion), and the value of κ in terms of the weights. No new imports. No sorry and no axiom. NOT compiler-verified.
v12 changes (made directly in this combined file, on request; not in PadicWilsonBridge.lean): Part 2 gains Section 15 (section ConductorGradedSeven), placed after `end LambdaThreeHalfSeven` and before `end PadicWilsonBridge`, formalizing the parts of Merged Framework Proposition 4.4 that do not need character theory. New: unitAct7 (dilation by a unit), unitAct7_apply, unitAct7_shell_invariant (unit dilations preserve every shell Kᵢ), IsShellGraded7 (acts by a scalar on the constants and on each shell), shellGraded7_comm_sigmaOne7 (every shell-graded operator commutes with sigmaOne7; Proposition 4.4(d)), phiSeven, conductor_partition_hasSum (∑ φ(7^c) x^c = (1 − x)/(1 − 7x); Proposition 4.4(c)), character_partition_hasSum (∑_{c ≥ a} x^c = x^a (1 − x)⁻¹; the limit in Proposition 4.4(b)). Not formalized: Proposition 4.4(a) (the regular-representation statement and the conductor criterion), the conductor Hamiltonian as an explicit operator, and the trace identity. No new imports. No sorry and no axiom. NOT compiler-verified.
v13 changes (made directly in this combined file, on request; not in PadicWilsonBridge.lean): the import block gains `import Mathlib` (Section 16 uses additive characters of ZMod, LinearMap.trace and cyclic-group counting). Part 2 gains Section 16 (section ConductorTraceSeven), placed after `end ConductorGradedSeven` and before `end PadicWilsonBridge`. Part A (shells of Section 11): card_fiber_projPow7, sum_fiber_push7, fibAvg7 (the fiber average E_m) with fibAvg7_apply, fibAvg7_lift_self, fibAvg7_liftPow, fibAvg7_const, fiberVanishing7_sum_coarse, fibAvg7_shell_eq_zero, fibAvg7_on_shell; shellProj7 (E_c − E_{c−1}) with shellProj7_shell and shellProj7_const; gradedOp7, gradedOp7_isShellGraded, shellGraded7_unique, sum_shellProj7; condHam7 (the conductor Hamiltonian H_l = log 7 · Σ c · Proj(K_c)), condDensity7, condHam7_comm_sigmaOne7, condDensity7_comm_sigmaOne7. Part B (characters): ψ7, sum_ψ7_mul, fourierProj7, fourierShell7, trace_fun7, trace_unit_fourier, mul_sub_one_eq_zero_iff7, dvd_val_sub_one_iff, CondLE7 (conductor exponent at most c) with CondLE7.mono and condLE7_top, kerUnits7 with kerUnits7_mul and kerUnits7_inv, char_sum_kerUnits7, isUnit_of_projPow7_eq_one, card_kerUnits7_mul_card_shell, charProj7, charProj7_apply, trace_charProj_fourierShell (Merged Framework Proposition 4.4(a): Tr(P_χ ∘ Proj(Sh_c)) = 1 if the conductor exponent of χ is at most c, else 0), fourierDensity7, trace_charProj_fourierDensity and trace_charProj_fourierDensity_Icc (Proposition 4.4(b): Tr(P_χ ∘ Σ_c x^c Proj(Sh_c)) = Σ_{c = a(χ)}^{l} x^c), condExp7. Not formalized: the identity between the character shells of Part B and the fiber-vanishing shells of Part A (fourierProj7 on {k : 7^m • k = 0} equals fibAvg7 at level m). No sorry and no axiom. NOT compiler-verified.
v14 changes (made directly in this combined file, on request; not in PadicWilsonBridge.lean): Part 2 gains Section 17 (section ShellUnificationSeven), placed after `end ConductorTraceSeven` and before `end PadicWilsonBridge`, closing the link left open in v13. New: annSet7 (frequencies divisible by 7^(l−m)), mem_annSet7, projPow7_eq_zero_iff, pow_dvd_pow_mul_iff7, mem_annSet7_iff (7^m • k = 0), mem_annSet7_iff_addOrderOf, card_annSet7 (7^m elements), annSet7_mono, mul_eq_zero_of_ann, ann_mul_ne_zero, exists_ψ7_ne_one, sum_ann_ψ7 (the character sum over annSet7: 7^m or 0), fourierProj7_annSet (the Fourier projector onto annSet7 l m equals the fiber average fibAvg7 at level m), fourierShell7_zero, fourierShell7_eq_sdiff, fourierProj7_sdiff, fourierShellProj_eq_shellProj (the character-shell projections equal shellProj7), fourierDensity7_eq_condDensity7, trace_charProj_condDensity7 (Proposition 4.4(b) for the conductor density built from fiber averages). The Section 16 docstring now points to Section 17 instead of listing the link as not formalized. No new imports. No sorry and no axiom. NOT compiler-verified.
v15 changes (first compiler feedback; the first build log stopped at 100 errors around line 4165 of the file without this header): file-level `set_option maxErrors 10000` and `noncomputable section` (closed by `end` before the trailing comment), and the helper `zmodNatCast_eq_zero_iff` (via CharP.cast_eq_zero_iff) replacing every use of the unknown `ZMod.natCast_zmod_eq_zero_iff_dvd`. Renamed constants: LinearMap.mul_apply / one_apply → Module.End.mul_apply / one_apply, Finset.card_piFinset → Fintype.card_piFinset, ambiguous smul_pow → _root_.smul_pow, ZMod.natCast_val → ZMod.natCast_zmod_val, isUnit_of_mul_eq_one → an explicit unit. Inverses of 2 in ZMod: `decide`/`rfl` proofs of 2⁻¹ = 2 replaced by ZMod.inv_eq_of_mul_eq_one, inv_eq_of_mul_eq_one_left (needs a division monoid) replaced by ZMod.inv_eq_of_mul_eq_one, inv_ne_zero / mul_ne_zero in ZMod (3 ^ j) replaced by unit arguments, and every `rw [ZMod.isUnit_iff_coprime]` on the literal 2 preceded by a rewrite to a natural-number cast. The ±1/2 witness eigenfunction proofs no longer use fin_cases (whose Fin literals blocked match reduction). rw steps whose motive failed because a rewritten term also occurs in a type ZMod (p ^ ...) were restated (card_fiber_projPow_succ, zmod_seven_pow_zero_eq, pow_succ′ with explicit arguments). Other fixes: projPow_eq_val (rw instead of a looping simp), map_natCast in the fiber shift, two orientation errors (surjInv_eq, congr_fun), Function.onFun before Finset.disjoint_filter, an omega step given k ≤ j, the mesh-scale identity in the UV theorem (field_simp; ring), `?` placeholders restored to `?_`, the indentation of two `let … if … then` terms, the Pi.zero_apply step in spectrum_classification_level_one, the modular-congruence step (rewrite of the modulus before casting), the projection identities in charpoly_restrict_mul_mapQ (conj_apply + apply_symm_apply instead of unfolding e.symm), LinearEquiv.ofInjective with an explicit map, `Token : Type` in PadicWilsonFamily (the universe of the adelic families could not be inferred), explicit `N : ℕ` binders, and `[NeZero p]` in AffineShiftGaugeModel (GSite needs a Fintype instance). No statement was weakened. No sorry and no axiom. NOT compiler-verified beyond the first log.
v16 changes (second compiler feedback; the second build log again stopped at 100 errors, around line 6330 of the file): (1) unit proofs: `(2 : ZMod (3 ^ j)).val = 2` now rewrites 2 to a natural-number cast before ZMod.val_natCast (nine places); (2) haarExpectation_liftStep: the fiber sum is proved as a separate equation and the normalization by explicit rewrites; (3) the mesh-scale identity of the UV theorem by explicit rewrites (pow_add, mul_inv, mul_pow, pow_mul, inv_mul_cancel₀) instead of field_simp; (4) padicWilson_collatz_uv_stabilized: the two `rfl` steps (false up to the level equation C.totalLevel N₀ 0 = N₀) replaced by unfolding to projPow and projPow_trans; (5) spectrum_classification_level_one: fin_cases replaced by a case split on the three values; (6) AdelicWilsonFamily gains the abbreviation LocalToken, used for the token binders (`(A.localFamily p hp).Token` had to synthesize `Fact (Nat.Prime p)` for a variable p; the timeouts after it are expected to be consequences); (7) prime7_isUnramifiedAt: the test function is given explicitly (the higher-order unification timed out); (8) mixedMonomial_factor: the simp calls with mul_comm / mul_assoc / mul_left_comm (AC-ordering timeout) replaced by mul_zpow + ac_rfl and Finset.prod_mul_distrib; (9) two `ring` steps after a closing simp removed (sevPair_add, sevPair_sub, and one in Part 3); (10) conductor_partition_hasSum: the closed form is proved by linear_combination with mul_inv_cancel₀; (11) the type of 0 in shellProj7_const; (12) the unknown LinearMap.coeFn_sum replaced by LinearMap.sum_apply (four places); (13) sum_ψ7_mul: split_ifs for the cast of the `if`; (14) Part 3 (CollatzTransfer), levels 1 to 3: new helpers sum_zmod3 and sum_zmod9 (a sum over ZMod 3 or ZMod 9 written out; Fin.sum_univ_three does not apply to ZMod 3 and Fin.sum_univ_nine does not exist) and inv2_table3, inv2_table9, inv2_table27 (the values of 2⁻¹ v and 2⁻¹ (3v + 1), proved by rewriting 2⁻¹ to its value and `decide`, since `decide` cannot evaluate 2⁻¹ in ZMod); the witnesses witness9_zero / plus / minus and witness27_plus / minus are now defined by complete case tables (the definitions with a wildcard did not compile), with the same values; their eigenfunction proofs, the stationary-measure lemmas, P_mod9C_eq and P_mod27C_eq use these helpers instead of fin_cases and `decide` on 2⁻¹; P_mod9C_annihilating_poly unfolds the iterates definitionally and evaluates pointwise; P_mod27C_annihilating_poly is now proved pointwise from 27 one-step lemmas P27_step_u and 27 lemmas P27_annih_at_v, each an explicit linear_combination whose coefficients were computed by eliminating the iterates level by level (the previous proof had a syntax error in its `at` list and would have expanded a tree with 2^19 leaves); the coefficient computation was checked in exact rational arithmetic, and so were the eigenvalue relations of the witnesses and the invariance of the stationary measures; (15) f_lifted_orthogonal_to_any_invariant: Finset.mul_sum in the forward direction. The v5 history line had been changed by the v15 placeholder repair and is restored. Statements are unchanged except the two witness definitions above (same values) and the added lemmas. No sorry and no axiom. NOT compiler-verified beyond the second log; the part of the file after that log’s last error has not been checked by a compiler.
v17 changes (third compiler feedback; the third build log reported no errors before line 2535 of the file and none between the ZMod 27 witnesses and Part 3 Section 6, so Parts 1 and 2, the P27 lemmas and the level-3 annihilation compiled; it stopped at 100 errors around line 13740, inside Part 3 Section 6): (1) adelic_collatz_place_unification: `congr 1` already closes the p = 3 factor, so the `rfl` bullet is removed; (2) witness27_plus / witness27_minus: the complete 27-case table did not pass the exhaustiveness check; they are now defined by a match on `v.val` with a final wildcard (same values), with value lemmas witness27_plus_vals / witness27_minus_vals proved by evaluation; (3) Part 3 gains isUnit_two_three_pow, two_mul_inv_two_pow and inv_two_mul_two_pow (2 is a unit in ZMod (3 ^ j)); they replace mul_inv_cancel₀ / inv_mul_cancel₀ with `decide`-proved hypotheses 2 ≠ 0 (ZMod (3 ^ j) is not a field, and `decide` cannot prove 2 ≠ 0 for a variable j) and IsUnit.mul_inv_cancel; (4) Part 3 Section 6: threeMul is now y ↦ 3 · y.val (there is no ring hom ZMod (3 ^ (j - 1)) → ZMod (3 ^ j), so the old ZMod.castHom definition did not typecheck), with new lemmas three_pow_pred_mul, three_mul_mod_cast and threeMul_add, new proofs of threeMul_injective and threeMul_range, and transientEquiv now targets the additive subgroup threeMulSubgroup j (the range of multiplication by 3) instead of a subtype with no additive structure; (5) eleven doc comments that were immediately followed by another doc comment (a parse error) are now plain comments; (6) smaller repairs: mem_eigenspaceC (the reverse direction), linearIndependent_ofReal (the function equation and Complex.ext), oneZero_is_plus_half_eigenfunction (the mod-3 projection and the v = 0 case), eigenfunction_is_lift_from_level_two_is_false (decide for the two point values; zero_ne_one), the level-1 and level-2 spanning proofs (case splits with explicit point values instead of fin_cases + simp; finite-span bounds with finrank_span_le_card under `classical`), four_pow_three_pow_mod (Nat.modEq_iff_dvd′), unitRoots as an abbreviation and its cardinality from Complex.card_rootsOfUnity, the two unit-branch lemmas and P_levelC_on_transient (explicit value of 2⁻¹ in ZMod 3), fiberDiff_sum / fiberDiff_eq_zero_of_invariance / fiberDiff_dynamics_second_relation (pow_succ orientation, a missing parenthesis, the invariance step), projModPow_eq_val and two projMod3 evaluations (rw instead of a looping simp), zmodNatCast_eq_zero_iff given its explicit arguments, `rw [Ne, …]` → `ne_eq`, dite reduction (↓reduceDIte) in plus_half_dim_ge_j, and positivity of 3 ^ k for two omega steps. No statement was weakened; the changed statements are the witness27 definitions (same values), threeMul (now well typed) and the target type of transientEquiv. No sorry and no axiom. NOT compiler-verified beyond the third log; the part of the file after that log’s last error has not been checked by a compiler.
v18 changes (fourth compiler feedback; the fourth build log covered the whole file, 38 errors, all in Part 3 Section 6): (1) three `exact this.symm` steps whose hypothesis already had the needed orientation; (2) an instance NeZero (2 * 3 ^ (j - 1)) for the Fintype instance of unitRoots j; (3) three `3 * 3 ^ j = 3 ^ (j + 1)` steps by ring; (4) shellAlternating_is_minus_half_eigenfunction: the negation lemma is applied only at v (it had also rewritten the second branch, so h_second no longer matched); (5) minus_half_dim_ge_j: dite reduction and unfolding of b before the support lemma; (6) the current signatures of pow_padicValNat_dvd and pow_succ_padicValNat_not_dvd, and of Nat.lt_of_mul_lt_mul_left; (7) fiberDiff_pow_totient: the exponent split by ring, the totient by Nat.totient_prime_pow and Nat.add_sub_cancel, the unit 2⁻¹ from inv_two_mul_two_pow, and Euler’s theorem via ZMod.pow_totient on the associated unit; (8) dim_eigenspace_half_le_j: the four point evaluations in each of the two h_eq computations are written out with explicit values (simp had rewritten the shift cast to (3 : ZMod _) ^ j, so the hypotheses about s no longer applied), a cast identity for 2 * s, the finite-span bound under `classical`, and two rewrites with `ne_eq` on goals that were already negations; (9) plus_half_multiplicity_split: `0 + j` by zero_add; (10) unit_spectrum_growth_base: case split on the three residues instead of fin_cases; unit_spectrum_growth: the redundant `generalizing f` removed. No statement changed. No sorry and no axiom. NOT compiler-verified beyond the fourth log.
v19 changes (fifth compiler feedback; the fifth build log covered the whole file, 10 errors, all in Part 3 Section 6): (1) the NeZero instance for unitRoots had been placed between a doc comment and its declaration (a parse error, after which the instance was missing); the doc comment now precedes unitRoots; (2) minus_half_dim_ge_j: ite_self on a negated hypothesis (ite_eq_right_iff did not apply under ≠); (3) the exponent split in fiberDiff_eq_zero_of_proj_ne_zero by ring (the rewrite reached into the type ZMod (3 ^ (j + 1))); (4) the scaled congruence: Nat.ModEq.mul_left u (same modulus) inside Nat.ModEq.mul_left′ (3 ^ k) (modulus scaled), the two had been swapped; (5) h_shift_term: proved directly by pow_add and Nat.sub_add_cancel (push_cast had changed the target of the calc); (6) one more 3 * 3 ^ j = 3 ^ (j + 1) by ring, and pow_succ with explicit arguments in the induction on 3 ^ m (it had rewritten inside the type); (7) fiberDiff_pow_totient: the unit 2⁻¹ given as an explicit Units value (isUnit_of_mul_eq_one is not in this Mathlib), and Euler’s theorem read off by rewriting with Units.val_pow_eq_pow_val, IsUnit.unit_spec and Units.val_one (simpa had simplified the hypothesis to True). No statement changed. No sorry and no axiom. NOT compiler-verified beyond the fifth log.
v20 changes (sixth compiler feedback; the sixth build log covered the whole file and reported one error, the missing Fintype instance on unitRoots j in the statement of card_unitRoots): card_unitRoots is now declared under `open Classical in` (the Fintype instance on rootsOfUnity needs decidable equality on ℂ) and proved by `convert` from Complex.card_rootsOfUnity. No statement changed. No sorry and no axiom. NOT compiler-verified beyond the sixth log.
v21 changes (seventh compiler feedback: v20 still failed to synthesize Fintype (unitRoots j) in card_unitRoots, the only remaining error): the statement of card_unitRoots is written with rootsOfUnity (2 * 3 ^ (j - 1)) ℂ, which the abbreviation unitRoots j unfolds to, so it says the same thing; it keeps `open Classical in` and the proof by `convert` from Complex.card_rootsOfUnity. No sorry and no axiom. NOT compiler-verified.
v22 changes (eighth compiler feedback: no Fintype instance on rootsOfUnity (2 * 3 ^ (j - 1)) ℂ in this Mathlib, the only remaining error): card_unitRoots is now stated with Nat.card (Nat.card (unitRoots j) = 2 * 3 ^ (j - 1)), which needs no Fintype instance; this is a change of statement (Fintype.card → Nat.card), with the same meaning for a finite group. The proof tries, in order, Complex.card_rootsOfUnity directly, the same with Nat.card_eq_fintype_card, and IsPrimitiveRoot.card_rootsOfUnity for Complex.isPrimitiveRoot_exp. Nothing else in the file uses card_unitRoots. No sorry and no axiom. NOT compiler-verified.
v23 changes (documentation only; v22 compiled with no errors): the Status line records the compilation; stale remarks in comments are corrected: six section docstrings that said NOT compiler-verified now say that the section compiled as part of v22, the Section 15 docstring notes that the items it lists as not formalized are in Sections 16 and 17, the "Multiplicity split (statement; proof open)" note now points to the proved plus_half_multiplicity_split / minus_half_multiplicity_split (0 + j and 1 + (j − 1)), the note on the shell alternating functions points to the proved exists_shellAlternating, and the docstring of dim_eigenspace_half_eq_j no longer calls the upper bound open (dim_eigenspace_half_le_j is proved, so the equality is unconditional). The earlier version lines are kept as written (each was accurate when written). The body differs from v22 only inside comments: after removing all comments and normalizing whitespace, the v22 and v23 bodies are identical (checked). A rebuild of v23 is expected to give the same result as v22 but has not been run.
Verification: strip through the closing "-/" line of this header block, SHA256 the rest, compare to the hash above. Count holes in the body only.
-/

import Mathlib.Data.ZMod.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.MeasureTheory.Measure.MeasureSpace
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.Tactic
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Charpoly.ToMatrix
import Mathlib.LinearAlgebra.Eigenspace.Minpoly
import Mathlib.RingTheory.RootsOfUnity.Complex
import Mathlib.NumberTheory.Multiplicity
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib

set_option maxErrors 10000

noncomputable section

/-- `(a : ZMod b) = 0 ↔ b ∣ a`, via `CharP.cast_eq_zero_iff` (a stable name for this file). -/
theorem zmodNatCast_eq_zero_iff (a b : ℕ) : ((a : ZMod b)) = 0 ↔ b ∣ a :=
  CharP.cast_eq_zero_iff (ZMod b) b a

/-! # Part 1 of 3: `CollatzTransferV117` (from the attached Collatz Transfer file, unchanged apart from its imports) -/

namespace CollatzTransferV117

/-- Mod-3 coin-flip transfer operator P acting on `f : ZMod 3 → ℝ`. -/
def P_mod3 (f : ZMod 3 → ℝ) (v : ZMod 3) : ℝ :=
  (1 / 2 : ℝ) * f ((2 : ZMod 3)⁻¹ * v) + (1 / 2 : ℝ) * f ((2 : ZMod 3)⁻¹ * (3 * v + 1))

/-- Exact v117 §2.3 witness function extended to all of Z/3Z (`g(0) = 1/2` forced at v = 0). -/
def g_witness : ZMod 3 → ℝ
  | 0 => 1 / 2
  | 1 => 2
  | 2 => -1

/-- Base case (j = 1): `P_mod3 g_witness = (-1/2) * g_witness` on `ZMod 3`. -/
theorem g_witness_is_eigenfunction (v : ZMod 3) :
    P_mod3 g_witness v = (-1 / 2 : ℝ) * g_witness v := by
  have h2inv : (2 : ZMod 3)⁻¹ = 2 := ZMod.inv_eq_of_mul_eq_one _ 2 2 (by decide)
  have key : ∀ w : ZMod 3, w = 0 ∨ w = 1 ∨ w = 2 := by decide
  rcases key v with rfl | rfl | rfl
  · unfold P_mod3
    rw [h2inv]
    show (1 / 2 : ℝ) * g_witness 0 + (1 / 2 : ℝ) * g_witness 2 = (-1 / 2 : ℝ) * g_witness 0
    norm_num [g_witness]
  · unfold P_mod3
    rw [h2inv]
    show (1 / 2 : ℝ) * g_witness 2 + (1 / 2 : ℝ) * g_witness 2 = (-1 / 2 : ℝ) * g_witness 1
    norm_num [g_witness]
  · unfold P_mod3
    rw [h2inv]
    show (1 / 2 : ℝ) * g_witness 1 + (1 / 2 : ℝ) * g_witness 2 = (-1 / 2 : ℝ) * g_witness 2
    norm_num [g_witness]

/-- Canonical projection `ZMod (3 ^ j) →+* ZMod 3` for `j ≥ 1`. -/
def projMod3 (j : ℕ) (hj : 1 ≤ j) : ZMod (3 ^ j) →+* ZMod 3 :=
  ZMod.castHom (dvd_pow_self 3 (Nat.pos_iff_ne_zero.mp hj)) (ZMod 3)

/-- Level-j coin-flip transfer operator `P_j` acting on `f : ZMod (3 ^ j) → ℝ`. -/
def P_level (j : ℕ) (f : ZMod (3 ^ j) → ℝ) (v : ZMod (3 ^ j)) : ℝ :=
  (1 / 2 : ℝ) * f ((2 : ZMod (3 ^ j))⁻¹ * v) +
  (1 / 2 : ℝ) * f ((2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1))

/-- Lifted observable `f_j(v) = g_witness (v mod 3)` on `ZMod (3 ^ j)`. -/
def f_lifted (j : ℕ) (hj : 1 ≤ j) (v : ZMod (3 ^ j)) : ℝ :=
  g_witness (projMod3 j hj v)

/-- Ring homomorphisms commute with `2⁻¹` in `ZMod (3 ^ j)` for all `j ≥ 1`. -/
lemma projMod3_inv_two (j : ℕ) (hj : 1 ≤ j) :
    projMod3 j hj ((2 : ZMod (3 ^ j))⁻¹) = (2 : ZMod 3)⁻¹ := by
  have h2j : 2 < 3 ^ j := by
    have h3 : (3 : ℕ) ≤ 3 ^ j :=
      Nat.le_self_pow (Nat.pos_iff_ne_zero.mp hj) 3
    omega
  have h2_j_unit : IsUnit (2 : ZMod (3 ^ j)) := by
    rw [← ZMod.natCast_zmod_val (2 : ZMod (3 ^ j)), ZMod.isUnit_iff_coprime]
    have hval : ((2 : ZMod (3 ^ j)).val) = 2 := by
      rw [show (2 : ZMod (3 ^ j)) = ((2 : ℕ) : ZMod (3 ^ j)) by norm_num, ZMod.val_natCast,
        Nat.mod_eq_of_lt h2j]
    rw [hval]
    exact Nat.Coprime.pow_right j (by decide : Nat.Coprime 2 3)
  have key : projMod3 j hj ((2 : ZMod (3 ^ j))⁻¹) * (2 : ZMod 3) = 1 := by
    rw [← map_ofNat (projMod3 j hj) 2, ← map_mul,
      ZMod.inv_mul_of_unit _ h2_j_unit, map_one]
  exact Eq.symm (ZMod.inv_eq_of_mul_eq_one _ _ _ (by rw [mul_comm]; exact key))

/-- `P_level j` intertwines with `P_mod3` on lifted functions (`P_j (g ∘ π_j) = (P_mod3 g) ∘ π_j`). -/
lemma P_level_intertwines_projMod3 (j : ℕ) (hj : 1 ≤ j) (g : ZMod 3 → ℝ) (v : ZMod (3 ^ j)) :
    P_level j (fun x => g (projMod3 j hj x)) v = P_mod3 g (projMod3 j hj v) := by
  unfold P_level P_mod3
  dsimp only
  simp only [map_mul, map_add, map_ofNat, map_one, projMod3_inv_two j hj]

/--
**Main Theorem (v117 §2.3 Lower Half at All Finite Levels):**
For every `j ≥ 1` and every residue `v ∈ ZMod (3 ^ j)`, the lifted witness
`f_lifted j hj` satisfies `P_j f_lifted = (-1/2) * f_lifted` identically,
establishing `|λ_2(P_j)| ≥ 1/2` across the entire tower `j ≥ 1`.
-/
theorem f_lifted_is_eigenfunction (j : ℕ) (hj : 1 ≤ j) (v : ZMod (3 ^ j)) :
    P_level j (f_lifted j hj) v = (-1 / 2 : ℝ) * f_lifted j hj v := by
  unfold f_lifted
  rw [P_level_intertwines_projMod3 j hj g_witness v]
  exact g_witness_is_eigenfunction (projMod3 j hj v)

end CollatzTransferV117

/-! # Part 2 of 3: `PadicWilsonBridge` (from PadicWilsonBridge.lean v10, unchanged apart from its imports) -/

namespace PadicWilsonBridge

open Finset BigOperators

/-! ### Section 1: General `p`-Adic Tower Projections & Locally Constant Observables -/

/-- For any prime `p` (`Fact (Nat.Prime p)`) and `j : ℕ`, `p ^ j` is nonzero. -/
instance instNeZeroPrimePow (p : ℕ) [hp : Fact (Nat.Prime p)] (j : ℕ) : NeZero (p ^ j) :=
  ⟨pow_ne_zero j hp.1.ne_zero⟩

/-- Canonical projection `π_{j,k} : ZMod (p ^ j) →+* ZMod (p ^ k)` for `k ≤ j`. -/
def projPow (p : ℕ) [Fact (Nat.Prime p)] (j k : ℕ) (hk : k ≤ j) :
    ZMod (p ^ j) →+* ZMod (p ^ k) :=
  ZMod.castHom (pow_dvd_pow p hk) (ZMod (p ^ k))

/-- Functoriality of the projective tower: `π_{k,m} ∘ π_{j,k} = π_{j,m}` for `m ≤ k ≤ j`. -/
lemma projPow_comp (p : ℕ) [Fact (Nat.Prime p)] {j k m : ℕ} (hmk : m ≤ k) (hkj : k ≤ j) :
    (projPow p k m hmk).comp (projPow p j k hkj) = projPow p j m (le_trans hmk hkj) := by
  simp only [projPow, ZMod.castHom_comp]

lemma projPow_trans (p : ℕ) [Fact (Nat.Prime p)] {j k m : ℕ} (hmk : m ≤ k) (hkj : k ≤ j)
    (v : ZMod (p ^ j)) :
    projPow p k m hmk (projPow p j k hkj v) = projPow p j m (le_trans hmk hkj) v := by
  rw [← RingHom.comp_apply, projPow_comp]

lemma projPow_self (p : ℕ) [Fact (Nat.Prime p)] (j : ℕ) (v : ZMod (p ^ j)) :
    projPow p j j (le_refl j) v = v := by
  simp [projPow]

/-- `projPow` evaluated via `ZMod.val`. -/
lemma projPow_eq_val (p : ℕ) [Fact (Nat.Prime p)] (j k : ℕ) (hk : k ≤ j) (v : ZMod (p ^ j)) :
    projPow p j k hk v = ((v.val : ℕ) : ZMod (p ^ k)) := by
  rw [projPow, ZMod.castHom_apply, ZMod.cast_eq_val]

/-- Top-digit fiber difference at level `j + 1` over `ZMod (p ^ (j + 1))`. -/
def fiberDiffP (p j : ℕ) [Fact (Nat.Prime p)] (f : ZMod (p ^ (j + 1)) → ℂ)
    (v : ZMod (p ^ (j + 1))) : ℂ :=
  f (v + ((p ^ j : ℕ) : ZMod (p ^ (j + 1)))) - f v

/--
An observable `f : ZMod (p ^ (j + 1)) → ℂ` is **locally constant at scale `p ^ j`**
(a Bruhat–Schwartz test observable of precision `p ^ j`) iff its top-digit fiber
difference vanishes identically (`fiberDiffP p j f = 0`).
-/
def IsLocallyConstantAtLevel (p j : ℕ) [Fact (Nat.Prime p)]
    (f : ZMod (p ^ (j + 1)) → ℂ) : Prop :=
  ∀ v : ZMod (p ^ (j + 1)), fiberDiffP p j f v = 0

/-- Pullback (inflation) map `liftStep p j : (ZMod (p ^ j) → ℂ) →ₗ[ℂ] (ZMod (p ^ (j + 1)) → ℂ)`
along the canonical projection `projPow p (j + 1) j`. -/
def liftStep (p j : ℕ) [Fact (Nat.Prime p)] :
    (ZMod (p ^ j) → ℂ) →ₗ[ℂ] (ZMod (p ^ (j + 1)) → ℂ) where
  toFun g v := g (projPow p (j + 1) j (Nat.le_succ j) v)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- General inflation `liftPow p j k : (ZMod (p ^ k) → ℂ) →ₗ[ℂ] (ZMod (p ^ j) → ℂ)` for `k ≤ j`. -/
def liftPow (p : ℕ) [Fact (Nat.Prime p)] (j k : ℕ) (hk : k ≤ j) :
    (ZMod (p ^ k) → ℂ) →ₗ[ℂ] (ZMod (p ^ j) → ℂ) where
  toFun g v := g (projPow p j k hk v)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- `liftStep` is injective (surjectivity of `projPow p (j + 1) j`). -/
theorem liftStep_injective (p j : ℕ) [Fact (Nat.Prime p)] :
    Function.Injective (liftStep p j) := by
  intro g₁ g₂ h
  funext r
  obtain ⟨v, rfl⟩ := ZMod.castHom_surjective (pow_dvd_pow p (Nat.le_succ j)) r
  exact congrFun h v

/-- Every inflated observable `liftStep p j g` is locally constant at level `j`. -/
theorem liftStep_isLocallyConstant (p j : ℕ) [Fact (Nat.Prime p)] (g : ZMod (p ^ j) → ℂ) :
    IsLocallyConstantAtLevel p j (liftStep p j g) := by
  intro v
  have hshift : projPow p (j + 1) j (Nat.le_succ j)
      (v + ((p ^ j : ℕ) : ZMod (p ^ (j + 1)))) =
      projPow p (j + 1) j (Nat.le_succ j) v := by
    rw [map_add, map_natCast, ZMod.natCast_self, add_zero]
  simp only [fiberDiffP, liftStep, LinearMap.coe_mk, AddHom.coe_mk, hshift, sub_self]

/-- **Fiber-Constancy Equivalence:**
If `f` is locally constant at level `j`, then `f` takes identical values on every fiber of
`projPow p (j + 1) j` (generalizing `eq_of_projModPow_eq_of_fiberDiff_zero` to any prime `p`). -/
theorem eq_of_projPow_eq_of_isLocallyConstant (p j : ℕ) [Fact (Nat.Prime p)]
    (f : ZMod (p ^ (j + 1)) → ℂ) (hlc : IsLocallyConstantAtLevel p j f)
    {u w : ZMod (p ^ (j + 1))}
    (hp : projPow p (j + 1) j (Nat.le_succ j) u = projPow p (j + 1) j (Nat.le_succ j) w) :
    f u = f w := by
  have hshift : ∀ (k : ℕ) (x : ZMod (p ^ (j + 1))),
      f (x + (k : ZMod (p ^ (j + 1))) * ((p ^ j : ℕ) : ZMod (p ^ (j + 1)))) = f x := by
    intro k
    induction k with
    | zero => intro x; simp
    | succ k ih =>
      intro x
      have hk := hlc (x + (k : ZMod (p ^ (j + 1))) * ((p ^ j : ℕ) : ZMod (p ^ (j + 1))))
      simp only [fiberDiffP, sub_eq_zero] at hk
      have heq : x + ((k + 1 : ℕ) : ZMod (p ^ (j + 1))) * ((p ^ j : ℕ) : ZMod (p ^ (j + 1))) =
          x + (k : ZMod (p ^ (j + 1))) * ((p ^ j : ℕ) : ZMod (p ^ (j + 1))) +
            ((p ^ j : ℕ) : ZMod (p ^ (j + 1))) := by
        push_cast; ring
      rw [heq, hk, ih x]
  have hker : (p ^ j : ℕ) ∣ (u - w).val := by
    have h0 : projPow p (j + 1) j (Nat.le_succ j) (u - w) = 0 := by
      rw [map_sub, hp, sub_self]
    rw [projPow_eq_val] at h0
    exact (zmodNatCast_eq_zero_iff _ _).mp h0
  obtain ⟨k, hk⟩ := hker
  have h1 : u - w = ((p ^ j * k : ℕ) : ZMod (p ^ (j + 1))) := by
    have hval : ((u - w).val : ZMod (p ^ (j + 1))) = u - w := ZMod.natCast_zmod_val (u - w)
    rw [← hval, hk]
  have hu : u = w + (k : ZMod (p ^ (j + 1))) * ((p ^ j : ℕ) : ZMod (p ^ (j + 1))) := by
    have hcast : ((p ^ j * k : ℕ) : ZMod (p ^ (j + 1))) =
        (k : ZMod (p ^ (j + 1))) * ((p ^ j : ℕ) : ZMod (p ^ (j + 1))) := by
      push_cast; ring
    rw [← hcast]
    linear_combination h1
  rw [hu]
  exact hshift k w

/-- **Exact Sequence / Characterization of Locally Constant Observables:**
`f : ZMod (p ^ (j + 1)) → ℂ` satisfies `IsLocallyConstantAtLevel p j f` if and only if
`f` lies in the range of `liftStep p j` (`f = liftStep p j g` for a unique `g : ZMod (p ^ j) → ℂ`). -/
theorem isLocallyConstant_iff_mem_range_liftStep (p j : ℕ) [Fact (Nat.Prime p)]
    (f : ZMod (p ^ (j + 1)) → ℂ) :
    IsLocallyConstantAtLevel p j f ↔ f ∈ LinearMap.range (liftStep p j) := by
  constructor
  · intro hlc
    have hsurj : Function.Surjective (projPow p (j + 1) j (Nat.le_succ j)) :=
      ZMod.castHom_surjective (pow_dvd_pow p (Nat.le_succ j))
    refine ⟨fun r => f (Function.surjInv hsurj r), ?_⟩
    funext v
    exact eq_of_projPow_eq_of_isLocallyConstant p j f hlc
      (Function.surjInv_eq hsurj (projPow p (j + 1) j (Nat.le_succ j) v))
  · rintro ⟨g, rfl⟩
    exact liftStep_isLocallyConstant p j g

/-- **Direct-System Compatibility (Projective Limit Gluing):**
For `m ≤ k ≤ j`, inflating from level `m` to level `k` and then to level `j` equals
inflating directly from level `m` to level `j` (`liftPow p j k ∘ liftPow p k m = liftPow p j m`). -/
theorem liftPow_comp (p : ℕ) [Fact (Nat.Prime p)] {j k m : ℕ} (hmk : m ≤ k) (hkj : k ≤ j) :
    (liftPow p j k hkj).comp (liftPow p k m hmk) = liftPow p j m (le_trans hmk hkj) := by
  ext g v
  simp only [LinearMap.comp_apply, liftPow, LinearMap.coe_mk, AddHom.coe_mk,
    projPow_trans p hmk hkj v]

/-- Any observable inflated from level `m < j` is automatically locally constant at level `j - 1`. -/
theorem liftPow_isLocallyConstant (p : ℕ) [Fact (Nat.Prime p)] {j m : ℕ} (hmj : m ≤ j)
    (g : ZMod (p ^ m) → ℂ) :
    IsLocallyConstantAtLevel p j (liftPow p (j + 1) m (le_trans hmj (Nat.le_succ j)) g) := by
  have hcomp : liftPow p (j + 1) m (le_trans hmj (Nat.le_succ j)) g =
      liftStep p j (liftPow p j m hmj g) := by
    have h := liftPow_comp p hmj (Nat.le_succ j)
    exact (LinearMap.congr_fun h g).symm
  rw [hcomp]
  exact liftStep_isLocallyConstant p j _

/-! ### Section 2: Haar / Counting Expectation Compatibility Across the Tower -/

/-- Normalized uniform (Haar) expectation on `ZMod (p ^ j)` over `ℂ`. -/
noncomputable def haarExpectation (p : ℕ) [Fact (Nat.Prime p)] (j : ℕ)
    (f : ZMod (p ^ j) → ℂ) : ℂ :=
  (1 / (p ^ j : ℂ)) * ∑ v : ZMod (p ^ j), f v

/-- Every fiber of `projPow p (j + 1) j` has cardinality `p`. -/
lemma card_fiber_projPow_succ (p : ℕ) [hp : Fact (Nat.Prime p)] (j : ℕ)
    (r : ZMod (p ^ j)) :
    (Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
      projPow p (j + 1) j (Nat.le_succ j) v = r)).card = p := by
  have h_surj : Function.Surjective (projPow p (j + 1) j (Nat.le_succ j)) :=
    ZMod.castHom_surjective (pow_dvd_pow p (Nat.le_succ j))
  have h_card : ∀ a b : ZMod (p ^ j),
      (Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
        projPow p (j + 1) j (Nat.le_succ j) v = a)).card =
      (Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
        projPow p (j + 1) j (Nat.le_succ j) v = b)).card := by
    intro a b
    obtain ⟨v₀, hv₀⟩ := h_surj (b - a)
    refine Finset.card_bij (fun v _ => v + v₀) ?_ ?_ ?_
    · intro v hv
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv ⊢
      rw [map_add, hv, hv₀]
      exact add_sub_cancel a b
    · intro v₁ _ v₂ _ h
      exact add_right_cancel h
    · intro w hw
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hw
      refine ⟨w - v₀, ?_, sub_add_cancel w v₀⟩
      simp only [Finset.mem_filter, Finset.mem_univ, true_and, map_sub, hw, hv₀]
      exact sub_sub_self b a
  have h_sum : ∑ a : ZMod (p ^ j),
      (Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
        projPow p (j + 1) j (Nat.le_succ j) v = a)).card = p ^ (j + 1) := by
    rw [← Finset.card_eq_sum_card_fiberwise (f := projPow p (j + 1) j (Nat.le_succ j))
      (t := Finset.univ) (fun _ _ => Finset.mem_univ _),
      Finset.card_univ, ZMod.card]
  have h_all : ∑ _a : ZMod (p ^ j),
      (Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
        projPow p (j + 1) j (Nat.le_succ j) v = r)).card = p ^ (j + 1) := by
    calc ∑ _a : ZMod (p ^ j), (Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
          projPow p (j + 1) j (Nat.le_succ j) v = r)).card
        = ∑ a : ZMod (p ^ j), (Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
          projPow p (j + 1) j (Nat.le_succ j) v = a)).card :=
          Finset.sum_congr rfl (fun a _ => h_card r a)
      _ = p ^ (j + 1) := h_sum
  have h_all' : p ^ j * (Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
      projPow p (j + 1) j (Nat.le_succ j) v = r)).card = p ^ j * p := by
    rw [Finset.sum_const, Finset.card_univ, ZMod.card, smul_eq_mul] at h_all
    rw [h_all, pow_succ]
  exact Nat.eq_of_mul_eq_mul_left (pow_pos hp.1.pos j) h_all'
/-- Projective Measure Compatibility:
Normalized Haar integration on ZMod (p ^ j) is invariant under inflation liftStep p j:
𝔼_{j+1}[liftStep p j g] = 𝔼_j[g]. -/
theorem haarExpectation_liftStep (p : ℕ) [hp : Fact (Nat.Prime p)] (j : ℕ)
    (g : ZMod (p ^ j) → ℂ) :
    haarExpectation p (j + 1) (liftStep p j g) = haarExpectation p j g := by
  have h_fiber : ∀ r : ZMod (p ^ j),
    (∑ v ∈ Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
    projPow p (j + 1) j (Nat.le_succ j) v = r),
    g (projPow p (j + 1) j (Nat.le_succ j) v)) = (p : ℂ) * g r := by
    intro r
    have h_const : ∀ v ∈ Finset.univ.filter (fun v : ZMod (p ^ (j + 1)) =>
      projPow p (j + 1) j (Nat.le_succ j) v = r),
      g (projPow p (j + 1) j (Nat.le_succ j) v) = g r := by
      intro v hv
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv
      rw [hv]
    rw [Finset.sum_congr rfl h_const, Finset.sum_const, card_fiber_projPow_succ p j r,
      nsmul_eq_mul]
  have hsum : ∑ v : ZMod (p ^ (j + 1)), liftStep p j g v = (p : ℂ) * ∑ r : ZMod (p ^ j), g r := by
    rw [← Finset.sum_fiberwise_of_maps_to (g := projPow p (j + 1) j (Nat.le_succ j))
      (t := Finset.univ) (fun _ _ => Finset.mem_univ _), Finset.mul_sum]
    exact Finset.sum_congr rfl (fun r _ => h_fiber r)
  have hp_ne : (p : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr hp.1.ne_zero
  unfold haarExpectation
  rw [hsum, pow_succ, one_div, one_div, mul_inv, mul_assoc, ← mul_assoc ((p : ℂ))⁻¹,
    inv_mul_cancel₀ hp_ne, one_mul]
/-! ### Section 3: Exact Specialization to p = 3 (CollatzTransferTower.lean Compatibility) -/
instance instFactPrimeThree : Fact (Nat.Prime 3) := ⟨by decide⟩
/-- Level-j Collatz transfer operator over ℂ (matching CollatzTransfer.P_levelC). -/
def P_collatz (j : ℕ) (f : ZMod (3 ^ j) → ℂ) (v : ZMod (3 ^ j)) : ℂ :=
  (1 / 2 : ℂ) * f ((2 : ZMod (3 ^ j))⁻¹ * v) +
  (1 / 2 : ℂ) * f ((2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1))
lemma projPow3_inv_two (j k : ℕ) (hk : k ≤ j) (hk1 : 1 ≤ k) :
    projPow 3 j k hk ((2 : ZMod (3 ^ j))⁻¹) = (2 : ZMod (3 ^ k))⁻¹ := by
  have h2j : 2 < 3 ^ j := by
    have h3j : 3 ≤ 3 ^ j := by
      calc 3 = 3 ^ 1 := by norm_num
        _ ≤ 3 ^ j := Nat.pow_le_pow_right (by decide) (by omega)
    omega
  have h2_unit : IsUnit (2 : ZMod (3 ^ j)) := by
    rw [← ZMod.natCast_zmod_val (2 : ZMod (3 ^ j)), ZMod.isUnit_iff_coprime]
    have hval : ((2 : ZMod (3 ^ j)).val) = 2 := by
      rw [show (2 : ZMod (3 ^ j)) = ((2 : ℕ) : ZMod (3 ^ j)) by norm_num, ZMod.val_natCast,
        Nat.mod_eq_of_lt h2j]
    rw [hval]
    exact Nat.Coprime.pow_right j (by decide : Nat.Coprime 2 3)
  have key : projPow 3 j k hk ((2 : ZMod (3 ^ j))⁻¹) * (2 : ZMod (3 ^ k)) = 1 := by
    rw [← map_ofNat (projPow 3 j k hk) 2, ← map_mul,
      ZMod.inv_mul_of_unit _ h2_unit, map_one]
  exact Eq.symm (ZMod.inv_eq_of_mul_eq_one _ _ _ (by rw [mul_comm]; exact key))
/--
Intertwining with the Collatz Transfer Operator (j ≥ 1):
P_collatz (j + 1) preserves the subspace of locally constant observables
IsLocallyConstantAtLevel 3 j and intertwines with P_collatz j via liftStep 3 j:
P_collatz (j + 1) (liftStep 3 j g) = liftStep 3 j (P_collatz j g).
-/
theorem P_collatz_intertwines_liftStep (j : ℕ) (hj : 1 ≤ j) (g : ZMod (3 ^ j) → ℂ) :
    P_collatz (j + 1) (liftStep 3 j g) = liftStep 3 j (P_collatz j g) := by
  funext v
  simp only [P_collatz, liftStep, LinearMap.coe_mk, AddHom.coe_mk,
    map_mul, map_add, map_ofNat, map_one, projPow3_inv_two (j + 1) j (Nat.le_succ j) hj]
theorem P_collatz_preserves_locallyConstant (j : ℕ) (hj : 1 ≤ j)
    (f : ZMod (3 ^ (j + 1)) → ℂ) (hlc : IsLocallyConstantAtLevel 3 j f) :
    IsLocallyConstantAtLevel 3 j (P_collatz (j + 1) f) := by
  rw [isLocallyConstant_iff_mem_range_liftStep] at hlc ⊢
  obtain ⟨g, rfl⟩ := hlc
  exact ⟨P_collatz j g, (P_collatz_intertwines_liftStep j hj g).symm⟩
/--
Every Finite-Level Collatz Witness Stabilizes in the Projective Tower:
Any observable lifted from level m (such as g_witness at m = 1, witness9_* at m = 2,
or shellIndicator j m / shellAlternating j m at m = k + 1) satisfies
IsLocallyConstantAtLevel 3 j for all j ≥ m.
-/
theorem tower_witness_isLocallyConstant {j m : ℕ} (hmj : m ≤ j) (g : ZMod (3 ^ m) → ℂ) :
    IsLocallyConstantAtLevel 3 j (liftPow 3 (j + 1) m (le_trans hmj (Nat.le_succ j)) g) :=
  liftPow_isLocallyConstant 3 hmj g
/-! ### Section 4: PadicWilsonFamily & Ultraviolet/Infrared Mesh Stabilization (Tendsto) -/
/-- 4D discrete p-adic lattice at precision l : ℕ, mirroring Site l := Axis → ZMod l.val. -/
abbrev PadicSite (p l : ℕ) := Fin 4 → ZMod (p ^ l)
/-- n-fold configuration space on PadicSite p l. -/
abbrev PadicPoints (n p l : ℕ) := Fin n → PadicSite p l
/-- Collision-free locus Conf_n(PadicSite p l) of injective n-tuples of sites,
mirroring WilsonFamily.separated n. -/
def padicSeparated (n p l : ℕ) : Set (PadicPoints n p l) :=
  {x | Function.Injective x}
/-- Componentwise site projection PadicSite p j → PadicSite p k for k ≤ j. -/
def projSite (p : ℕ) [Fact (Nat.Prime p)] {j k : ℕ} (hk : k ≤ j)
    (s : PadicSite p j) : PadicSite p k :=
  fun a => projPow p j k hk (s a)
/-- Componentwise n-point configuration projection PadicPoints n p j → PadicPoints n p k. -/
def projPoints (n p : ℕ) [Fact (Nat.Prime p)] {j k : ℕ} (hk : k ≤ j)
    (x : PadicPoints n p j) : PadicPoints n p k :=
  fun i => projSite p hk (x i)
/-- Every fiber of projPoints n p (l + 1) l has cardinality (p ^ 4) ^ n = p ^ (4 * n). -/
lemma card_fiber_projPoints_succ (n p : ℕ) [hp : Fact (Nat.Prime p)] (l : ℕ)
    (r : PadicPoints n p l) :
    (Finset.univ.filter (fun x : PadicPoints n p (l + 1) =>
    projPoints n p (Nat.le_succ l) x = r)).card = p ^ (4 * n) := by
  have h_bij :
    (Finset.univ.filter (fun x : PadicPoints n p (l + 1) =>
    projPoints n p (Nat.le_succ l) x = r)).card =
    (Fintype.piFinset (fun p_idx : Fin n × Fin 4 =>
    Finset.univ.filter (fun v : ZMod (p ^ (l + 1)) =>
    projPow p (l + 1) l (Nat.le_succ l) v = r p_idx.1 p_idx.2))).card := by
    refine Finset.card_bij (fun x _ i => x i.1 i.2) ?_ ?_ ?_
    · intro x hx
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hx
      rw [Fintype.mem_piFinset]
      intro ⟨i, a⟩
      simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      exact congrFun (congrFun hx i) a
    · intro x₁ _ x₂ _ h
      funext i a
      exact congrFun h (i, a)
    · intro y hy
      rw [Fintype.mem_piFinset] at hy
      refine ⟨fun i a => y (i, a), ?_, by funext ⟨i, a⟩; rfl⟩
      simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      funext i a
      have hia := hy (i, a)
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hia
      exact hia
  rw [h_bij, Fintype.card_piFinset]
  have h_each : ∀ idx : Fin n × Fin 4,
    (Finset.univ.filter (fun v : ZMod (p ^ (l + 1)) =>
    projPow p (l + 1) l (Nat.le_succ l) v = r idx.1 idx.2)).card = p :=
    fun idx => card_fiber_projPow_succ p l (r idx.1 idx.2)
  simp only [h_each, Finset.prod_const, Finset.card_univ, Fintype.card_prod,
    Fintype.card_fin, ← pow_mul]
  ring
/-- Every fiber of projPoints n p j k (k ≤ j) has cardinality p ^ (4 * n * (j - k)). -/
lemma card_fiber_projPoints (n p : ℕ) [hp : Fact (Nat.Prime p)] {j k : ℕ} (hk : k ≤ j)
    (r : PadicPoints n p k) :
    (Finset.univ.filter (fun x : PadicPoints n p j => projPoints n p hk x = r)).card =
    p ^ (4 * n * (j - k)) := by
  induction hk with
  | refl =>
    have h_eq : Finset.univ.filter (fun x : PadicPoints n p k =>
      projPoints n p (le_refl k) x = r) = {r} := by
      ext x
      simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_singleton]
      constructor
      · intro h; funext i a
        have hia := congrFun (congrFun h i) a
        simpa [projPoints, projSite, projPow_self] using hia
      · intro h; subst h; funext i a; simp [projPoints, projSite, projPow]
    rw [h_eq, Finset.card_singleton, Nat.sub_self, mul_zero, pow_zero]
  | @step j hj ih =>
    have h_comp : ∀ x : PadicPoints n p (j + 1),
      projPoints n p (Nat.le_succ_of_le hj) x =
      projPoints n p hj (projPoints n p (Nat.le_succ j) x) := by
      intro x; funext i a
      exact (projPow_trans p hj (Nat.le_succ j) (x i a)).symm
    have h_fiber_split :
      (Finset.univ.filter (fun x : PadicPoints n p (j + 1) =>
      projPoints n p (Nat.le_succ_of_le hj) x = r)).card =
      ∑ y ∈ Finset.univ.filter (fun y : PadicPoints n p j => projPoints n p hj y = r),
      (Finset.univ.filter (fun x : PadicPoints n p (j + 1) =>
      projPoints n p (Nat.le_succ j) x = y)).card := by
      rw [← Finset.card_biUnion]
      · congr 1
        ext x
        simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_biUnion,
          exists_prop, exists_eq_right', h_comp]
      · intro y₁ _ y₂ _ hne
        rw [Function.onFun, Finset.disjoint_filter]
        intro x _ h1 h2
        exact hne (h1.symm.trans h2)
    rw [h_fiber_split]
    simp only [card_fiber_projPoints_succ n p j, Finset.sum_const, ih, smul_eq_mul]
    have hexp : 4 * n * (j + 1 - k) = 4 * n * (j - k) + 4 * n := by
      have hkj : k ≤ j := hj
      have : j + 1 - k = (j - k) + 1 := by omega
      rw [this, mul_add, mul_one]
    rw [hexp, pow_add]
/--
Non-Archimedean (p-adic) Wilson Family (PadicWilsonFamily):
Mirrors YangMills.WilsonFamily on ZMod (p ^ (irLevel k + uvLevel N)), replacing
Archimedean periodic boxes (period, denominator) with p-adic volume balls
(irLevel k) and ultraviolet coset resolutions (uvLevel N).
-/
structure PadicWilsonFamily (p : ℕ) [Fact (Nat.Prime p)] (G : Type*) [Group G]
    [TopologicalSpace G] [MeasurableSpace G] where
  irLevel : ℕ → ℕ
  uvLevel : ℕ → ℕ
  irStrict : StrictMono irLevel
  uvStrict : StrictMono uvLevel
  beta : ℕ → ℕ → ℝ
  haar : MeasureTheory.Measure G
  probability : MeasureTheory.IsProbabilityMeasure haar
  invariantHaar : haar.IsHaarMeasure
  Token : Type
  insertion (N k : ℕ) : Token → PadicSite p (irLevel k + uvLevel N) →
    ((PadicSite p (irLevel k + uvLevel N) × Fin 4) → G) → ℂ
  wilsonMeasure (N k : ℕ) :
    MeasureTheory.Measure ((PadicSite p (irLevel k + uvLevel N) × Fin 4) → G)
namespace PadicWilsonFamily
variable {p : ℕ} [hp : Fact (Nat.Prime p)] {G : Type*} [Group G]
  [TopologicalSpace G] [MeasurableSpace G] (C : PadicWilsonFamily p G)
/-- Total p-adic precision at UV index N and IR index k. -/
abbrev totalLevel (N k : ℕ) : ℕ := C.irLevel k + C.uvLevel N
/-- p-adic lattice mesh volume element p ^ (-uvLevel N) at UV refinement N. -/
noncomputable def padicMesh (N : ℕ) : ℂ :=
  ((p : ℂ) ^ C.uvLevel N)⁻¹
/-- Finite-precision Wilson expectation of n token insertions on PadicSite p (totalLevel N k),
mirroring WilsonFamily.finiteMoment. -/
noncomputable def finiteMoment (N k : ℕ) {n : ℕ} (labels : Fin n → C.Token)
    (x : PadicPoints n p (C.totalLevel N k)) : ℂ :=
  ∫ U, ∏ i, C.insertion N k (labels i) (x i) U ∂C.wilsonMeasure N k
/-- Smeared n-point observable at UV refinement N and IR volume k,
mirroring WilsonFamily.smear. -/
noncomputable def smear (N k : ℕ) {n : ℕ} (v : Fin n → C.Token)
    (t : PadicPoints n p (C.totalLevel N k) → ℂ) : ℂ :=
  (C.padicMesh N) ^ (4 * n) *
  ∑ x : PadicPoints n p (C.totalLevel N k), t x * C.finiteMoment N k v x
/--
A p-adic Wilson family has locally constant UV dynamics at scale N₀ (for IR ball k
and labels v) if for every N ≥ N₀, the n-point correlator finiteMoment N k v
is invariant under UV refinement (pulled back from scale totalLevel N₀ k), and the
test observable t_N is inflated from a coarse test t₀ at scale totalLevel N₀ k.
-/
def UVStabilizedAt (N₀ k : ℕ) {n : ℕ} (v : Fin n → C.Token)
    (t : ∀ N, PadicPoints n p (C.totalLevel N k) → ℂ) : Prop :=
  ∃ (t₀ : PadicPoints n p (C.totalLevel N₀ k) → ℂ)
  (M₀ : PadicPoints n p (C.totalLevel N₀ k) → ℂ),
  ∀ (N : ℕ) (hN : N₀ ≤ N),
  let hlev : C.totalLevel N₀ k ≤ C.totalLevel N k :=
    Nat.add_le_add_left (C.uvStrict.monotone hN) (C.irLevel k)
  (∀ x, t N x = t₀ (projPoints n p hlev x)) ∧
  (∀ x, C.finiteMoment N k v x = M₀ (projPoints n p hlev x))
/--
Ultraviolet Mesh Stabilization (Exact Constancy for N ≥ N₀):
Whenever t and finiteMoment stabilize at UV scale N₀ (C.UVStabilizedAt N₀ k v t),
the smeared correlator C.smear N k v (t N) is identically equal to the coarse
correlator (C.padicMesh N₀) ^ (4 * n) * ∑ r, t₀ r * M₀ r for every N ≥ N₀.
-/
theorem uv_smear_eventually_constant (N₀ k : ℕ) {n : ℕ} (v : Fin n → C.Token)
    (t : ∀ N, PadicPoints n p (C.totalLevel N k) → ℂ)
    (hstab : C.UVStabilizedAt N₀ k v t) :
    ∀ᶠ N : ℕ in Filter.atTop,
    C.smear N k v (t N) = C.smear N₀ k v (t N₀) := by
  obtain ⟨t₀, M₀, hN_eq⟩ := hstab
  rw [Filter.eventually_atTop]
  refine ⟨N₀, fun N hN => ?_⟩
  let hlev : C.totalLevel N₀ k ≤ C.totalLevel N k :=
    Nat.add_le_add_left (C.uvStrict.monotone hN) (C.irLevel k)
  obtain ⟨htN, hMN⟩ := hN_eq N hN
  obtain ⟨ht0, hM0⟩ := hN_eq N₀ (le_refl N₀)
  have ht0_eq : t N₀ = t₀ := by
    funext r
    have := ht0 r
    have hr : projPoints n p (le_refl (C.totalLevel N₀ k)) r = r := by
      funext i a; simp [projPoints, projSite, projPow]
    simpa [hr] using this
  have hM0_eq : C.finiteMoment N₀ k v = M₀ := by
    funext r
    have := hM0 r
    have hr : projPoints n p (le_refl (C.totalLevel N₀ k)) r = r := by
      funext i a; simp [projPoints, projSite, projPow]
    simpa [hr] using this
  unfold smear
  rw [ht0_eq, hM0_eq]
  simp only [htN, hMN]
  rw [← Finset.sum_fiberwise_of_maps_to (g := projPoints n p hlev) (t := Finset.univ)
    (fun _ _ => Finset.mem_univ _)]
  have h_fiber : ∀ r : PadicPoints n p (C.totalLevel N₀ k),
    (∑ x ∈ Finset.univ.filter (fun x : PadicPoints n p (C.totalLevel N k) =>
    projPoints n p hlev x = r),
    t₀ (projPoints n p hlev x) * M₀ (projPoints n p hlev x)) =
    ((p : ℂ) ^ (4 * n * (C.uvLevel N - C.uvLevel N₀))) * (t₀ r * M₀ r) := by
    intro r
    have h_const : ∀ x ∈ Finset.univ.filter (fun x : PadicPoints n p (C.totalLevel N k) =>
      projPoints n p hlev x = r),
      t₀ (projPoints n p hlev x) * M₀ (projPoints n p hlev x) = t₀ r * M₀ r := by
      intro x hx
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hx
      rw [hx]
    rw [Finset.sum_congr rfl h_const, Finset.sum_const, card_fiber_projPoints n p hlev r,
      nsmul_eq_mul]
    have hsub : C.totalLevel N k - C.totalLevel N₀ k = C.uvLevel N - C.uvLevel N₀ := by
      unfold totalLevel; omega
    rw [hsub]
    push_cast
    rfl
  simp only [h_fiber, ← Finset.mul_sum]
  unfold padicMesh
  have hp_ne : (p : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr hp.1.ne_zero
  have huv_le : C.uvLevel N₀ ≤ C.uvLevel N := C.uvStrict.monotone hN
  have h_scale : (((p : ℂ) ^ C.uvLevel N)⁻¹) ^ (4 * n) *
    (p : ℂ) ^ (4 * n * (C.uvLevel N - C.uvLevel N₀)) =
    (((p : ℂ) ^ C.uvLevel N₀)⁻¹) ^ (4 * n) := by
    obtain ⟨a, ha⟩ : ∃ a, C.uvLevel N = a + C.uvLevel N₀ :=
      ⟨_, (Nat.sub_add_cancel huv_le).symm⟩
    have hsub : C.uvLevel N - C.uvLevel N₀ = a := by omega
    have hq : ((p : ℂ) ^ a) ^ (4 * n) ≠ 0 := pow_ne_zero _ (pow_ne_zero _ hp_ne)
    rw [hsub, ha, pow_add, mul_inv, mul_pow, mul_comm (4 * n) a, pow_mul (p : ℂ) a (4 * n),
      inv_pow ((p : ℂ) ^ a) (4 * n), mul_right_comm, inv_mul_cancel₀ hq, one_mul]
  calc (((p : ℂ) ^ C.uvLevel N)⁻¹) ^ (4 * n) *
    ((p : ℂ) ^ (4 * n * (C.uvLevel N - C.uvLevel N₀)) * ∑ r, t₀ r * M₀ r)
    = ((((p : ℂ) ^ C.uvLevel N)⁻¹) ^ (4 * n) *
    (p : ℂ) ^ (4 * n * (C.uvLevel N - C.uvLevel N₀))) * ∑ r, t₀ r * M₀ r := by ring
  _ = (((p : ℂ) ^ C.uvLevel N₀)⁻¹) ^ (4 * n) * ∑ r, t₀ r * M₀ r := by rw [h_scale]
/--
Continuum UV Limit Theorem (Tendsto as N → ∞):
For any locally constant UV-stabilized test sequence t, the continuum UV limit
lim_{N → ∞} C.smear N k v (t N) exists and equals C.smear N₀ k v (t N₀).
-/
theorem uv_smear_tendsto (N₀ k : ℕ) {n : ℕ} (v : Fin n → C.Token)
    (t : ∀ N, PadicPoints n p (C.totalLevel N k) → ℂ)
    (hstab : C.UVStabilizedAt N₀ k v t) :
    Filter.Tendsto (fun N => C.smear N k v (t N)) Filter.atTop
    (nhds (C.smear N₀ k v (t N₀))) :=
  tendsto_const_nhds.congr'
  (Filter.Eventually.mono (C.uv_smear_eventually_constant N₀ k v t hstab) fun _ h => h.symm)
/--
A p-adic test observable t at (N, k) is IR-suitable at ball scale k₀ (k₀ ≤ k)
if t vanishes outside the inner ball {x | projPoints n p hk_ir x = 0} of radius p^(-irLevel k₀),
mirroring WilsonFamily.suitable p t in PublicWilson.lean.
-/
def suitable (k₀ k N : ℕ) {n : ℕ} (t : PadicPoints n p (C.totalLevel N k) → ℂ) : Prop :=
  ∃ (hk : k₀ ≤ k),
  let h_ir : C.irLevel k - C.irLevel k₀ ≤ C.totalLevel N k := by
    unfold totalLevel; omega
  ∀ x : PadicPoints n p (C.totalLevel N k),
  projPoints n p h_ir x ≠ 0 → t x = 0
/--
Ordered Double Limit (PadicWilsonFamily.Converges):
Mirrors WilsonFamily.Converges in PublicWilson.lean:
Eventually along volumeOrder, the test family is IR-suitable (C.suitable k₀ (volumeOrder k) N).
For each IR volume p_ir, the continuum UV mesh limit N → ∞ exists (row p_ir).
As k → ∞, row (volumeOrder k) converges to the infinite-volume expectation target v t.
-/
def Converges (volumeOrder : ℕ → ℕ)
    (target : {n : ℕ} → (Fin n → C.Token) →
    (∀ N k, PadicPoints n p (C.totalLevel N k) → ℂ) → ℂ) : Prop :=
  ∀ (n : ℕ) (v : Fin n → C.Token)
  (t : ∀ N k, PadicPoints n p (C.totalLevel N k) → ℂ),
  (∃ k₀ : ℕ, ∀ᶠ k : ℕ in Filter.atTop, ∀ N : ℕ, C.suitable k₀ (volumeOrder k) N (t N (volumeOrder k))) ∧
  ∃ row : ℕ → ℂ,
  (∀ p_ir : ℕ, Filter.Tendsto (fun N => C.smear N p_ir v (t N p_ir)) Filter.atTop (nhds (row p_ir))) ∧
  Filter.Tendsto (fun k => row (volumeOrder k)) Filter.atTop (nhds (target v t))
/--
Infrared Stabilization Hypothesis (IRStabilizedAt):
For a test family t supported inside IR ball k₀ and UV-stabilized at scale N₀,
the coarse (N₀, k) observables stabilize for all k ≥ k₀ (the finite-volume boundary
of p^(-irLevel k) ℤ_p^4 decouples from the inner ball p^(-irLevel k₀) ℤ_p^4).
-/
def IRStabilizedAt (N₀ k₀ : ℕ) {n : ℕ} (v : Fin n → C.Token)
    (t : ∀ N k, PadicPoints n p (C.totalLevel N k) → ℂ) : Prop :=
  (∀ k : ℕ, C.UVStabilizedAt N₀ k v (fun N => t N k)) ∧
  (∀ k : ℕ, k₀ ≤ k → C.smear N₀ k v (t N₀ k) = C.smear N₀ k₀ v (t N₀ k₀))
/--
Infrared Volume Stabilization (Tendsto as k → ∞):
For any strictly increasing volumeOrder : ℕ → ℕ and any UV/IR-stabilized observable family,
the continuum row row k = C.smear N₀ k v (t N₀ k) is eventually constant along volumeOrder
and converges to C.smear N₀ k₀ v (t N₀ k₀) as k → ∞.
-/
theorem ir_row_tendsto (N₀ k₀ : ℕ) (volumeOrder : ℕ → ℕ) (hvol : StrictMono volumeOrder)
    {n : ℕ} (v : Fin n → C.Token)
    (t : ∀ N k, PadicPoints n p (C.totalLevel N k) → ℂ)
    (hir : C.IRStabilizedAt N₀ k₀ v t) :
    Filter.Tendsto (fun k => C.smear N₀ (volumeOrder k) v (t N₀ (volumeOrder k)))
    Filter.atTop (nhds (C.smear N₀ k₀ v (t N₀ k₀))) := by
  have hev : ∀ᶠ k : ℕ in Filter.atTop,
    C.smear N₀ (volumeOrder k) v (t N₀ (volumeOrder k)) = C.smear N₀ k₀ v (t N₀ k₀) := by
    rw [Filter.eventually_atTop]
    obtain ⟨k₁, hk₁⟩ := Filter.eventually_atTop.mp (hvol.tendsto_atTop (Filter.eventually_ge_atTop k₀))
    exact ⟨k₁, fun k hk => hir.2 (volumeOrder k) (hk₁ k hk)⟩
  exact tendsto_const_nhds.congr' (Filter.Eventually.mono hev fun _ h => h.symm)
/--
Complete Ordered Double Limit Theorem (PadicWilsonFamily.Converges):
Any observable family that is IR-suitable at scale k₀ and UV/IR-stabilized at (N₀, k₀)
satisfies C.Converges volumeOrder for every strictly increasing volumeOrder : ℕ → ℕ,
with infinite-volume continuum limit C.smear N₀ k₀ v (t N₀ k₀).
-/
theorem converges_of_stabilized (N₀ k₀ : ℕ) (volumeOrder : ℕ → ℕ) (hvol : StrictMono volumeOrder)
    (h_suit : ∀ {n : ℕ} (t : ∀ N k, PadicPoints n p (C.totalLevel N k) → ℂ),
    ∀ k N : ℕ, k₀ ≤ k → C.suitable k₀ k N (t N k))
    (h_stab : ∀ {n : ℕ} (v : Fin n → C.Token)
    (t : ∀ N k, PadicPoints n p (C.totalLevel N k) → ℂ),
    C.IRStabilizedAt N₀ k₀ v t) :
    C.Converges volumeOrder
    (fun {n} v t => C.smear N₀ k₀ v (t N₀ k₀)) := by
  intro n v t
  refine ⟨⟨k₀, ?_⟩, fun p_ir => C.smear N₀ p_ir v (t N₀ p_ir), ?_, ?_⟩
  · rw [Filter.eventually_atTop]
    obtain ⟨k₁, hk₁⟩ := Filter.eventually_atTop.mp (hvol.tendsto_atTop (Filter.eventually_ge_atTop k₀))
    exact ⟨k₁, fun k hk N => h_suit t (volumeOrder k) N (hk₁ k hk)⟩
  · intro p_ir
    exact C.uv_smear_tendsto N₀ p_ir v (fun N => t N p_ir) ((h_stab v t).1 p_ir)
  · exact C.ir_row_tendsto N₀ k₀ volumeOrder hvol v t (h_stab v t)
end PadicWilsonFamily
/-! ### Section 5: Direct Bridge Between PadicWilsonFamily (p = 3) and P_collatz (1-Point Observables) -/
/-- Extract the 0-th (Euclidean time) coordinate ZMod (3 ^ l) from a 1-point configuration
x : PadicPoints 1 3 l. -/
def timeCoord1Pt (l : ℕ) (x : PadicPoints 1 3 l) : ZMod (3 ^ l) :=
  x 0 0
/-- Embed a 1-variable Collatz observable φ : ZMod (3 ^ l) → ℂ as a 1-point observable
on PadicPoints 1 3 l. -/
def embed1Pt (l : ℕ) (φ : ZMod (3 ^ l) → ℂ) (x : PadicPoints 1 3 l) : ℂ :=
  φ (timeCoord1Pt l x)
/-- timeCoord1Pt commutes with projPoints 1 3 hk. -/
lemma timeCoord1Pt_projPoints {j k : ℕ} (hk : k ≤ j) (x : PadicPoints 1 3 j) :
    timeCoord1Pt k (projPoints 1 3 hk x) = projPow 3 j k hk (timeCoord1Pt j x) :=
  rfl
/-- embed1Pt intertwines liftPow 3 j k hk with projPoints 1 3 hk. -/
lemma embed1Pt_liftPow {j k : ℕ} (hk : k ≤ j) (g : ZMod (3 ^ k) → ℂ)
    (x : PadicPoints 1 3 j) :
    embed1Pt j (liftPow 3 j k hk g) x = embed1Pt k g (projPoints 1 3 hk x) :=
  rfl
/--
Multi-Step Intertwining of P_collatz Along liftPow 3 j k hk (1 ≤ k ≤ j):
Inflating any k-level observable g : ZMod (3 ^ k) → ℂ to level j (k ≤ j) and
applying P_collatz j equals applying P_collatz k first and then inflating to level j:
P_collatz j (liftPow 3 j k hk g) = liftPow 3 j k hk (P_collatz k g).
-/
theorem P_collatz_intertwines_liftPow {j k : ℕ} (hk1 : 1 ≤ k) (hkj : k ≤ j)
    (g : ZMod (3 ^ k) → ℂ) :
    P_collatz j (liftPow 3 j k hkj g) = liftPow 3 j k hkj (P_collatz k g) := by
  funext v
  simp only [P_collatz, liftPow, LinearMap.coe_mk, AddHom.coe_mk,
    map_mul, map_add, map_ofNat, map_one, projPow3_inv_two j k hkj hk1]
/--
Eigenfunction Persistence Across All UV Refinements (k ≤ j):
If g : ZMod (3 ^ k) → ℂ is an eigenfunction of P_collatz k with eigenvalue lam : ℂ
(e.g., g_witness at k = 1, witness9_* at k = 2, or shellIndicator / shellAlternating),
then its UV inflation liftPow 3 j k hkj g is an exact eigenfunction of P_collatz j
with the same eigenvalue lam for every j ≥ k.
-/
theorem P_collatz_liftPow_eigenfunction {j k : ℕ} (hk1 : 1 ≤ k) (hkj : k ≤ j)
    (g : ZMod (3 ^ k) → ℂ) (lam : ℂ)
    (heig : ∀ u : ZMod (3 ^ k), P_collatz k g u = lam * g u)
    (v : ZMod (3 ^ j)) :
    P_collatz j (liftPow 3 j k hkj g) v = lam * liftPow 3 j k hkj g v := by
  rw [P_collatz_intertwines_liftPow hk1 hkj g]
  exact heig (projPow 3 j k hkj v)
/--
Bridge Theorem: UV Stabilization & Continuum Limit of P_collatz-Evolved 1-Point Observables:
Suppose a 3-adic PadicWilsonFamily has irLevel 0 = 0 and uvLevel N = N (so totalLevel N 0 = N),
and its 1-point gauge moment C.finiteMoment N 0 v is induced by a coarse 1-variable observable
M₀ : ZMod (3 ^ N₀) → ℂ (1 ≤ N₀). Then for any coarse observable g : ZMod (3 ^ N₀) → ℂ,
the P_collatz-evolved 1-point test sequence
t N := embed1Pt N (P_collatz N (liftPow 3 N N₀ hN g))
is UVStabilizedAt N₀ 0 v, so its UV continuum limit N → ∞ exists (Tendsto) and equals
C.smear N₀ 0 v (embed1Pt N₀ (P_collatz N₀ g)).
-/
theorem padicWilson_collatz_uv_stabilized
    {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
    (C : PadicWilsonFamily 3 G)
    (hir0 : C.irLevel 0 = 0)
    (huv : ∀ N, C.uvLevel N = N)
    (N₀ : ℕ) (hN₀ : 1 ≤ N₀) (v : Fin 1 → C.Token)
    (M₀ : ZMod (3 ^ N₀) → ℂ)
    (hM : ∀ (N : ℕ) (hN : N₀ ≤ N) (x : PadicPoints 1 3 (C.totalLevel N 0)),
    C.finiteMoment N 0 v x =
    embed1Pt (C.totalLevel N 0)
    (liftPow 3 (C.totalLevel N 0) N₀ (by simp [PadicWilsonFamily.totalLevel, hir0, huv, hN]) M₀) x)
    (g : ZMod (3 ^ N₀) → ℂ) :
    let t : ∀ N, PadicPoints 1 3 (C.totalLevel N 0) → ℂ := fun N =>
      if hN : N₀ ≤ N then
        embed1Pt (C.totalLevel N 0)
          (P_collatz (C.totalLevel N 0)
            (liftPow 3 (C.totalLevel N 0) N₀
              (by simp [PadicWilsonFamily.totalLevel, hir0, huv, hN]) g))
      else 0
    C.UVStabilizedAt N₀ 0 v t ∧
    Filter.Tendsto (fun N => C.smear N 0 v (t N)) Filter.atTop
    (nhds (C.smear N₀ 0 v (t N₀))) := by
  intro t
  have hlev0 : C.totalLevel N₀ 0 = N₀ := by
    simp [PadicWilsonFamily.totalLevel, hir0, huv]
  have hstab : C.UVStabilizedAt N₀ 0 v t := by
    refine ⟨fun x₀ => embed1Pt N₀ (P_collatz N₀ g) (projPoints 1 3 (by omega) x₀),
      fun x₀ => embed1Pt N₀ M₀ (projPoints 1 3 (by omega) x₀), ?_⟩
    intro N hN
    have hlevN : C.totalLevel N 0 = N := by
      simp [PadicWilsonFamily.totalLevel, hir0, huv]
    have hle_tot : C.totalLevel N₀ 0 ≤ C.totalLevel N 0 := by omega
    have hNtot : N₀ ≤ C.totalLevel N 0 := by omega
    constructor
    · intro x
      have e1 : t N x = embed1Pt (C.totalLevel N 0)
          (P_collatz (C.totalLevel N 0) (liftPow 3 (C.totalLevel N 0) N₀ hNtot g)) x := by
        simp only [t, dif_pos hN]
      rw [e1, P_collatz_intertwines_liftPow (j := C.totalLevel N 0) hN₀ hNtot g]
      change P_collatz N₀ g (projPow 3 _ N₀ _ (x 0 0)) =
        P_collatz N₀ g (projPow 3 _ N₀ _ (projPow 3 _ _ _ (x 0 0)))
      rw [projPow_trans]
    · intro x
      rw [hM N hN x]
      change M₀ (projPow 3 _ N₀ _ (x 0 0)) = M₀ (projPow 3 _ N₀ _ (projPow 3 _ _ _ (x 0 0)))
      rw [projPow_trans]
  exact ⟨hstab, C.uv_smear_tendsto N₀ 0 v t hstab⟩
/--
Corollary for Collatz Eigenmodes (P_collatz N₀ g = lam • g):
When g is an eigenfunction of P_collatz N₀ with eigenvalue lam : ℂ (such as λ = ±1/2),
the 1-point smeared observable at every UV refinement N ≥ N₀ scales by lam, and its
continuum UV limit N → ∞ equals lam * C.smear N₀ 0 v (embed1Pt N₀ g).
-/
theorem padicWilson_collatz_eigenmode_limit
    {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
    (C : PadicWilsonFamily 3 G)
    (hir0 : C.irLevel 0 = 0)
    (huv : ∀ N, C.uvLevel N = N)
    (N₀ : ℕ) (hN₀ : 1 ≤ N₀) (v : Fin 1 → C.Token)
    (M₀ : ZMod (3 ^ N₀) → ℂ)
    (hM : ∀ (N : ℕ) (hN : N₀ ≤ N) (x : PadicPoints 1 3 (C.totalLevel N 0)),
    C.finiteMoment N 0 v x =
    embed1Pt (C.totalLevel N 0)
    (liftPow 3 (C.totalLevel N 0) N₀ (by simp [PadicWilsonFamily.totalLevel, hir0, huv, hN]) M₀) x)
    (g : ZMod (3 ^ N₀) → ℂ) (lam : ℂ)
    (heig : ∀ u : ZMod (3 ^ N₀), P_collatz N₀ g u = lam * g u) :
    let t : ∀ N, PadicPoints 1 3 (C.totalLevel N 0) → ℂ := fun N =>
      if hN : N₀ ≤ N then
        embed1Pt (C.totalLevel N 0)
          (P_collatz (C.totalLevel N 0)
            (liftPow 3 (C.totalLevel N 0) N₀
              (by simp [PadicWilsonFamily.totalLevel, hir0, huv, hN]) g))
      else 0
    Filter.Tendsto (fun N => C.smear N 0 v (t N)) Filter.atTop
    (nhds (lam * C.smear N₀ 0 v (embed1Pt (C.totalLevel N₀ 0)
    (liftPow 3 (C.totalLevel N₀ 0) N₀ (by simp [PadicWilsonFamily.totalLevel, hir0, huv]) g)))) := by
  intro t
  have hle : N₀ ≤ C.totalLevel N₀ 0 := by simp [PadicWilsonFamily.totalLevel, hir0, huv]
  have hmain := (padicWilson_collatz_uv_stabilized C hir0 huv N₀ hN₀ v M₀ hM g).2
  have h_eq_t0 : C.smear N₀ 0 v (t N₀) =
    lam * C.smear N₀ 0 v (embed1Pt (C.totalLevel N₀ 0)
    (liftPow 3 (C.totalLevel N₀ 0) N₀ hle g)) := by
    unfold PadicWilsonFamily.smear
    have h_sum : ∑ x : PadicPoints 1 3 (C.totalLevel N₀ 0),
      t N₀ x * C.finiteMoment N₀ 0 v x =
      lam * ∑ x : PadicPoints 1 3 (C.totalLevel N₀ 0),
      embed1Pt (C.totalLevel N₀ 0)
      (liftPow 3 (C.totalLevel N₀ 0) N₀ hle g) x *
      C.finiteMoment N₀ 0 v x := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro x _
      simp only [t, embed1Pt, dif_pos (le_refl N₀),
        P_collatz_liftPow_eigenfunction hN₀ hle g lam heig (timeCoord1Pt _ x)]
      ring
    rw [h_sum]
    ring
  rwa [h_eq_t0] at hmain
/-! ### Section 6: Bridge 2 — Block-Spin Renormalization Map, Collatz Fixed Point, Linearization -/

/-- Fiber averaging (conditional expectation) onto level-`j` observables: the adjoint /
down-projection of `liftStep`. `downAvg p j f r` averages `f` over the fiber of `r`
under `projPow p (j + 1) j`. This is the decimation step of the block-spin RG map. -/
noncomputable def downAvg (p : ℕ) [Fact (Nat.Prime p)] (j : ℕ)
    (f : ZMod (p ^ (j + 1)) → ℂ) : ZMod (p ^ j) → ℂ :=
  fun r => (1 / (p : ℂ)) * ∑ v ∈ Finset.univ.filter
    (fun v : ZMod (p ^ (j + 1)) => projPow p (j + 1) j (Nat.le_succ j) v = r), f v

/-- Averaging after inflation is the identity: `downAvg ∘ liftStep = id`. The fiber has
cardinality `p` (`card_fiber_projPow_succ`), which cancels the `1 / p` prefactor. -/
theorem downAvg_liftStep (p : ℕ) [hp : Fact (Nat.Prime p)] (j : ℕ)
    (g : ZMod (p ^ j) → ℂ) :
    downAvg p j (liftStep p j g) = g := by
  funext r
  have hsum : ∑ v ∈ Finset.univ.filter
      (fun v : ZMod (p ^ (j + 1)) => projPow p (j + 1) j (Nat.le_succ j) v = r),
      (liftStep p j g) v = (p : ℂ) * g r := by
    have hconst : ∀ v ∈ Finset.univ.filter
        (fun v : ZMod (p ^ (j + 1)) => projPow p (j + 1) j (Nat.le_succ j) v = r),
        (liftStep p j g) v = g r := by
      intro v hv
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv
      simp only [liftStep, LinearMap.coe_mk, AddHom.coe_mk, hv]
    rw [Finset.sum_congr rfl hconst, Finset.sum_const, card_fiber_projPow_succ, nsmul_eq_mul]
  have hpC : (p : ℂ) ≠ 0 := Nat.cast_ne_zero.mpr hp.1.ne_zero
  simp only [downAvg, hsum]
  rw [one_div, ← mul_assoc, inv_mul_cancel₀ hpC, one_mul]

/-- Fiber averaging is additive. -/
theorem downAvg_add (p : ℕ) [Fact (Nat.Prime p)] (j : ℕ)
    (f₁ f₂ : ZMod (p ^ (j + 1)) → ℂ) :
    downAvg p j (f₁ + f₂) = downAvg p j f₁ + downAvg p j f₂ := by
  funext r
  simp only [downAvg, Pi.add_apply, Finset.sum_add_distrib, mul_add]

/-- Fiber averaging is homogeneous. -/
theorem downAvg_smul (p : ℕ) [Fact (Nat.Prime p)] (j : ℕ) (c : ℂ)
    (f : ZMod (p ^ (j + 1)) → ℂ) :
    downAvg p j (c • f) = c • downAvg p j f := by
  funext r
  simp only [downAvg, Pi.smul_apply, smul_eq_mul, ← Finset.mul_sum]
  ring

/-- Block-spin renormalization map on transfer operators: inflate a coarse observable,
apply the fine operator, then average back down. `rgMap j T` is the decimated operator
at level `j` of the fine operator `T` at level `j + 1`. The "fixed point" below is a
statement about the family `{P_j}`: `rgMap j` sends the `(j + 1)`-operator to the
`j`-operator, for every `j ≥ 1`. -/
noncomputable def rgMap (j : ℕ)
    (T : (ZMod (3 ^ (j + 1)) → ℂ) → (ZMod (3 ^ (j + 1)) → ℂ)) :
    (ZMod (3 ^ j) → ℂ) → (ZMod (3 ^ j) → ℂ) :=
  fun f => downAvg 3 j (T ((liftStep 3 j) f))

/-- The Collatz operator family is an exact fixed point of the block-spin map:
`rgMap j P_{j+1} = P_j` for `j ≥ 1`. This is the intertwining lemma
`P_collatz_intertwines_liftStep` plus `downAvg_liftStep`. -/
theorem rgMap_fixed_point (j : ℕ) (hj : 1 ≤ j) :
    rgMap j (P_collatz (j + 1)) = P_collatz j := by
  funext f
  simp only [rgMap, P_collatz_intertwines_liftStep j hj f, downAvg_liftStep]

/-- Linearization: the derivative of `rgMap` at any operator is decimation. If a fine
operator `T` intertwines with a coarse operator `S` (i.e. `T` preserves the locally
constant subspace and acts there as `S`), then its decimation is exactly `S`. In
particular, a perturbation `Q` of the fixed point decimates to its action `S_Q` on the
locally constant subspace — there is no other contribution. -/
theorem rgMap_of_intertwining {j : ℕ}
    {T : (ZMod (3 ^ (j + 1)) → ℂ) → (ZMod (3 ^ (j + 1)) → ℂ)}
    {S : (ZMod (3 ^ j) → ℂ) → (ZMod (3 ^ j) → ℂ)}
    (h : ∀ f, T ((liftStep 3 j) f) = (liftStep 3 j) (S f)) :
    rgMap j T = S := by
  funext f
  simp only [rgMap, h f, downAvg_liftStep]

/-- Eigenvalue lifting: eigenvalues of the decimated operator are eigenvalues of the
fine operator, realized on inflated eigenfunctions. This is the rigorous content of
"linearized RG eigenvalues are ratios λ / λ₀" in the intertwining sector: decimation
restricts to the locally constant subspace. -/
theorem eigenvalue_lift_of_intertwining {j : ℕ}
    {T : (ZMod (3 ^ (j + 1)) → ℂ) → (ZMod (3 ^ (j + 1)) → ℂ)}
    {S : (ZMod (3 ^ j) → ℂ) → (ZMod (3 ^ j) → ℂ)}
    (h : ∀ f, T ((liftStep 3 j) f) = (liftStep 3 j) (S f))
    {φ : ZMod (3 ^ j) → ℂ} {ν : ℂ} (hφ : S φ = ν • φ) :
    T ((liftStep 3 j) φ) = ν • (liftStep 3 j) φ := by
  rw [h φ, hφ, map_smul]

/-- The block-spin map is additive in the operator: decimation is a linear map on
operator space, not just a formal linearization. -/
theorem rgMap_add {j : ℕ}
    (T₁ T₂ : (ZMod (3 ^ (j + 1)) → ℂ) → (ZMod (3 ^ (j + 1)) → ℂ)) :
    rgMap j (T₁ + T₂) = rgMap j T₁ + rgMap j T₂ := by
  funext f
  simp only [rgMap, Pi.add_apply, downAvg_add]

/-- The block-spin map is homogeneous in the operator. -/
theorem rgMap_smul {j : ℕ} (c : ℂ)
    (T : (ZMod (3 ^ (j + 1)) → ℂ) → (ZMod (3 ^ (j + 1)) → ℂ)) :
    rgMap j (c • T) = c • rgMap j T := by
  funext f
  simp only [rgMap, Pi.smul_apply, downAvg_smul]

/-- Linearized flow: a perturbation of the fixed point decimates to the perturbation
of the decimated operator. If `T = P_{j+1} + Q` with `Q` intertwining with `S_Q`,
then `rgMap j T = P_j + S_Q`. -/
theorem rgMap_perturbed_fixed_point {j : ℕ} (hj : 1 ≤ j)
    {Q : (ZMod (3 ^ (j + 1)) → ℂ) → (ZMod (3 ^ (j + 1)) → ℂ)}
    {S_Q : (ZMod (3 ^ j) → ℂ) → (ZMod (3 ^ j) → ℂ)}
    (hQ : ∀ f, Q ((liftStep 3 j) f) = (liftStep 3 j) (S_Q f)) :
    rgMap j (P_collatz (j + 1) + Q) = P_collatz j + S_Q := by
  rw [rgMap_add, rgMap_fixed_point j hj, rgMap_of_intertwining hQ]

/-- Indicator of `0` at level `j`, over `ℂ`. -/
def oneZeroC (j : ℕ) (v : ZMod (3 ^ j)) : ℂ := if v = 0 then 1 else 0

/-- `oneZeroC j` is a `+1/2`-eigenfunction of `P_collatz j` for `j ≥ 1`: the first
branch hits `0` iff `v = 0`, and the second branch never hits `0` (since
`3 * v + 1 ≡ 1 (mod 3)`). -/
theorem oneZeroC_is_plus_half_eigenfunction (j : ℕ) (hj : 1 ≤ j) (v : ZMod (3 ^ j)) :
    P_collatz j (oneZeroC j) v = (1 / 2 : ℂ) * oneZeroC j v := by
  have h2ne : (2 : ZMod (3 ^ j)) ≠ 0 := by
    intro h
    have hmap : projPow 3 j 1 (by omega) (2 : ZMod (3 ^ j)) = 2 := map_ofNat _ _
    rw [h, map_zero] at hmap
    exact absurd hmap.symm (by decide)
  have hu2 : IsUnit (2 : ZMod (3 ^ j)) := by
    have h' := (ZMod.isUnit_iff_coprime 2 (3 ^ j)).mpr
      (Nat.Coprime.pow_right j (by decide : Nat.Coprime 2 3))
    simpa using h'
  have hmul_ne : ∀ y : ZMod (3 ^ j), y ≠ 0 → (2 : ZMod (3 ^ j))⁻¹ * y ≠ 0 := by
    intro y hy h
    apply hy
    have h2 := congrArg (fun z => (2 : ZMod (3 ^ j)) * z) h
    simpa only [mul_zero, ← mul_assoc, ZMod.mul_inv_of_unit _ hu2, one_mul] using h2
  have h2inv_ne : (2 : ZMod (3 ^ j))⁻¹ ≠ 0 := by
    intro h
    have h1 := ZMod.inv_mul_of_unit _ hu2
    rw [h, zero_mul] at h1
    have hmap := congrArg (projPow 3 j 1 (by omega)) h1
    rw [map_zero, map_one] at hmap
    exact absurd hmap (by decide)
  have h3v1_ne : ∀ w : ZMod (3 ^ j), 3 * w + 1 ≠ 0 := by
    intro w hw
    have hmap : projPow 3 j 1 (by omega) (3 * w + 1) = 1 := by
      rw [map_add, map_mul, map_ofNat, map_one]
      have h3 : (3 : ZMod 3) = 0 := by decide
      rw [h3, zero_mul, zero_add]
    rw [hw, map_zero] at hmap
    exact absurd hmap.symm (by decide)
  have hsecond_ne : ∀ w : ZMod (3 ^ j),
      (2 : ZMod (3 ^ j))⁻¹ * (3 * w + 1) ≠ 0 :=
    fun w => hmul_ne _ (h3v1_ne w)
  simp only [P_collatz, oneZeroC]
  by_cases hv : v = 0
  · subst hv
    rw [mul_zero, mul_zero, zero_add, mul_one, if_pos rfl, if_neg h2inv_ne]
    ring
  · rw [if_neg (hmul_ne v hv), if_neg (hsecond_ne v), if_neg hv]
    ring

/-- Exact witness function on `ZMod 3` for eigenvalue `-1/2`, over `ℂ`. -/
def gWitnessC : ZMod 3 → ℂ
  | 0 => 1 / 2
  | 1 => 2
  | 2 => -1

/-- `gWitnessC` is a `-1/2`-eigenfunction of `P_collatz 1`, by direct check on `ZMod 3`. -/
theorem gWitnessC_is_minus_half_eigenfunction (v : ZMod 3) :
    P_collatz 1 gWitnessC v = (-1 / 2 : ℂ) * gWitnessC v := by
  have h2inv : (2 : ZMod (3 ^ 1))⁻¹ = 2 := ZMod.inv_eq_of_mul_eq_one _ 2 2 (by decide)
  have key : ∀ w : ZMod 3, w = 0 ∨ w = 1 ∨ w = 2 := by decide
  rcases key v with rfl | rfl | rfl
  · unfold P_collatz
    rw [h2inv]
    show (1 / 2 : ℂ) * gWitnessC 0 + (1 / 2 : ℂ) * gWitnessC 2 = (-1 / 2 : ℂ) * gWitnessC 0
    norm_num [gWitnessC]
  · unfold P_collatz
    rw [h2inv]
    show (1 / 2 : ℂ) * gWitnessC 2 + (1 / 2 : ℂ) * gWitnessC 2 = (-1 / 2 : ℂ) * gWitnessC 1
    norm_num [gWitnessC]
  · unfold P_collatz
    rw [h2inv]
    show (1 / 2 : ℂ) * gWitnessC 1 + (1 / 2 : ℂ) * gWitnessC 2 = (-1 / 2 : ℂ) * gWitnessC 2
    norm_num [gWitnessC]

/-- The lift of `gWitnessC` to any level `j ≥ 1` is a `-1/2`-eigenfunction of
`P_collatz j`: intertwining moves `P_collatz` past the lift, and the level-`1`
computation does the rest. -/
theorem gWitnessC_lift_is_minus_half_eigenfunction (j : ℕ) (hj : 1 ≤ j)
    (v : ZMod (3 ^ j)) :
    P_collatz j (liftPow 3 j 1 hj gWitnessC) v =
      (-1 / 2 : ℂ) * liftPow 3 j 1 hj gWitnessC v := by
  have h : P_collatz 1 gWitnessC = (-1 / 2 : ℂ) • gWitnessC := by
    funext u
    simp only [gWitnessC_is_minus_half_eigenfunction, Pi.smul_apply, smul_eq_mul]
  rw [P_collatz_intertwines_liftPow (le_refl 1) hj gWitnessC, h, map_smul]
  simp only [Pi.smul_apply, smul_eq_mul]

/-- A decimated eigendirection with eigenvalue `ν` is **relevant** if `‖ν‖ > 1`,
**marginal** if `‖ν‖ = 1`, **irrelevant** if `‖ν‖ < 1`. This is the classification
of tangent directions of the RG map at the fixed point, in the intertwining sector. -/
def IsRelevantEigenvalue (ν : ℂ) : Prop := 1 < ‖ν‖
def IsMarginalEigenvalue (ν : ℂ) : Prop := ‖ν‖ = 1
def IsIrrelevantEigenvalue (ν : ℂ) : Prop := ‖ν‖ < 1

theorem norm_half : ‖((1 : ℂ) / 2)‖ = 1 / 2 := by
  have h : ((1 : ℂ) / 2) = ((1 / 2 : ℝ) : ℂ) := by push_cast; ring
  rw [h, Complex.norm_real]
  norm_num

theorem norm_neg_half : ‖((-1 : ℂ) / 2)‖ = 1 / 2 := by
  rw [show ((-1 : ℂ) / 2) = -((1 : ℂ) / 2) by ring, norm_neg, norm_half]

/-- The `+1/2` eigendirection is irrelevant. -/
theorem plus_half_eigenvalue_irrelevant : IsIrrelevantEigenvalue ((1 : ℂ) / 2) := by
  unfold IsIrrelevantEigenvalue
  rw [norm_half]
  norm_num

/-- The `-1/2` eigendirection is irrelevant. -/
theorem minus_half_eigenvalue_irrelevant : IsIrrelevantEigenvalue ((-1 : ℂ) / 2) := by
  unfold IsIrrelevantEigenvalue
  rw [norm_neg_half]
  norm_num

/-- The constant function `1` is a `1`-eigenfunction of `P_collatz j`: the stationary
(marginal) direction. -/
theorem const_one_is_one_eigenfunction (j : ℕ) (v : ZMod (3 ^ j)) :
    P_collatz j (fun _ => 1) v = (1 : ℂ) * (fun _ => 1) v := by
  simp only [P_collatz]
  ring

/-- The `1` eigendirection is marginal. -/
theorem one_eigenvalue_marginal : IsMarginalEigenvalue (1 : ℂ) := by
  unfold IsMarginalEigenvalue
  rw [norm_one]

/- Summary of the linearization at the Collatz fixed point, in the intertwining sector:
the decimated operator is `P_j` itself (`rgMap_fixed_point`); a perturbation decimates
to its action on the locally constant subspace (`rgMap_of_intertwining`,
`rgMap_perturbed_fixed_point`); eigenvalues lift (`eigenvalue_lift_of_intertwining`);
the explicit non-trivial eigendirections `oneZeroC` (`+1/2`) and the lift of `gWitnessC`
(`-1/2`) are irrelevant, and the stationary direction (`1`) is marginal.

The full statement "the Collatz fixed point has no relevant directions" would require
the full spectrum of `P_j`, which is not in these files — it is open, not proved here.

Bridge 3 implication, as a remark (not a theorem): the linearization shows why the
Bridge 3 obstruction is structural. A deformation `P_{j+1}(β)` that is decimation-
compatible (intertwines with some `S(β)`) decimates to `S(β)` — it cannot escape the
fixed point's control. Producing the Bridge 3 scaling `1 - |λ₁| ~ a·Λ_YM` would
require a deformation whose decimation does not exist, i.e. one that breaks the
intertwining. That is the precise price of dimensional transmutation in this setting. -/

/-! ### Section 7: Full Spectrum of P_j (Classification) -/

/-! Full spectrum of `P_collatz j`, in characteristic-polynomial form (numerically
verified for `j = 1, 2, 3, 4`):
  χ_{P_j}(X) = (X - 1) · ∏_{i=1}^{j} 2^{-2·3^{i-1}} · ((2X)^{2·3^{i-1}} - 1).
Equivalently: the eigenvalues are `1` (multiplicity 1) and `(1/2)·ζ` for
`ζ^{2·3^{j-1}} = 1`, with algebraic multiplicity `mult((1/2)·ζ) = j - t(ζ)` where
`t(ζ) = min { t : ζ^{2·3^t} = 1 } ∈ {0, ..., j-1}`. In particular every eigenvalue
`λ ≠ 1` satisfies `‖λ‖ = 1/2 < 1`: there are no relevant directions.

Proof sketch for the characteristic-polynomial form (Steps 1–2 are proved in this file,
Step 3 is supported by the numerical checks below, Step 4 is open; the eigenvalue
classification itself has a direct proof at the end of this section, see below):
1. Base `j = 1`: proved below (`spectrum_classification_level_one`) by evaluating the
   eigen-equation at `0, 1, 2`.
2. Persistence: eigenvalues of `P_{j-1}` persist in `P_j` via lifts
   (`P_collatz_liftPow_eigenfunction`).
3. Quotient: `P_j` preserves the lift subspace `im L` (intertwining). On the quotient
   `V_j / im L`, the second branch `B f (v) = f (a (3v + 1))` lands in `im L` (it is
   constant on fibers, since `3v mod 3^j` depends only on `v mod 3^{j-1}`), so the
   induced operator is `(1/2)·[A]` where `A f (v) = f (a v)` is the permutation from
   multiplication by `a = 2⁻¹`. The permutation `a` on `ZMod (3^j)` has one cycle per
   3-adic shell, of length `2·3^{j-t-1}` on shell `t` (this uses that `2` is a
   primitive root mod `3^j`, i.e. `a` generates the unit group); subtracting the
   cycles on `im L ≅ V_{j-1}` leaves every `(2·3^{j-1})`-th root of unity exactly once
   in the quotient. Hence the quotient contributes `∏_{ζ^{2·3^{j-1}}=1} (X - ζ/2)`.
   Numerically verified for `j = 2, 3`: the quotient operator's eigenvalues are
   exactly `(1/2)·ζ`, `ζ^{2·3^{j-1}} = 1`; and `Π B = 0`, `Π P L = 0` where `Π` is
   the projection onto `ker D` along `im L`.
4. Induction: `χ_{P_j} = χ_{P_{j-1}} · ∏_{ζ^{2·3^{j-1}}=1} (X - ζ/2)`, unrolling to
   the formula above. The dimension count `1 + Σ_{i=1}^{j} 2·3^{i-1} = 3^j` shows
   no eigenvalue is missed.

WARNING — a false shortcut: `D ∘ P_j = P_{j-1} ∘ D` is FALSE (checked numerically,
max error `1/3`). Do not attempt a "co-intertwining" proof; the quotient argument
in Step 3 is the correct route.

What is proved in this section: the base case `j = 1` in full; the conditional
theorem `no_relevant_directions_of_spectrum_classification`; and (added in v7) a direct
proof of `SpectrumClassification` for all `j ≥ 1` (`spectrum_classification_proved`),
using only the containment half of Step 3: the second branch is locally constant
(`second_branch_isLocallyConstant`), so modulo `im L` the operator acts as `(1/2)·A`,
and `A ^ φ(3^{j+1}) = id` by Euler's theorem (`inv_two_pow_totient`); no primitive root
and no `Matrix.charpoly` is needed. This gives `no_relevant_directions` unconditionally.
Still open: the exact characteristic polynomial and the multiplicities (Steps 3–4), which
the classification does not assert. v7 additions compiled with Lean 4.35.0 and Mathlib v4.35.0 as part of v22. -/

/-- The full spectrum classification for `P_collatz j`: every eigenvalue is `1` or
`(1/2)·ζ` with `ζ` a `(2·3^{j-1})`-th root of unity. Base case `j = 1`:
`spectrum_classification_at_one`; all `j ≥ 1`: `spectrum_classification_proved` (v7). -/
def SpectrumClassification : Prop :=
  ∀ (j : ℕ) (hj : 1 ≤ j) (lam : ℂ) (f : ZMod (3 ^ j) → ℂ),
    P_collatz j f = lam • f → f ≠ 0 →
    lam = 1 ∨ ∃ ζ : ℂ, ζ ^ (2 * 3 ^ (j - 1)) = 1 ∧ lam = (1 / 2 : ℂ) * ζ

/-- Base case of the full spectrum classification: at level `1`, every eigenvalue of
`P_collatz 1` is `1`, `1/2`, or `-1/2`. Proved by evaluating the eigen-equation at
the three points `0, 1, 2` of `ZMod 3` and solving the resulting scalar system. -/
theorem spectrum_classification_level_one {lam : ℂ} {f : ZMod (3 ^ 1) → ℂ}
    (hP : P_collatz 1 f = lam • f) (hf : f ≠ 0) :
    lam = 1 ∨ lam = 1 / 2 ∨ lam = -1 / 2 := by
  have h2inv : (2 : ZMod (3 ^ 1))⁻¹ = 2 := ZMod.inv_eq_of_mul_eq_one _ 2 2 (by decide)
  have hP0 : P_collatz 1 f 0 = (1 / 2 : ℂ) * f 0 + (1 / 2 : ℂ) * f 2 := by
    simp only [P_collatz]
    rw [show (2 : ZMod (3 ^ 1))⁻¹ * 0 = 0 by rw [mul_zero],
      show (2 : ZMod (3 ^ 1))⁻¹ * (3 * 0 + 1) = 2 by
        rw [mul_zero, zero_add, mul_one, h2inv]]
  have hP1 : P_collatz 1 f 1 = (1 / 2 : ℂ) * f 2 + (1 / 2 : ℂ) * f 2 := by
    simp only [P_collatz]
    rw [show (2 : ZMod (3 ^ 1))⁻¹ * 1 = 2 by rw [mul_one, h2inv],
      show (2 : ZMod (3 ^ 1))⁻¹ * (3 * 1 + 1) = 2 by rw [h2inv]; decide]
  have hP2 : P_collatz 1 f 2 = (1 / 2 : ℂ) * f 1 + (1 / 2 : ℂ) * f 2 := by
    simp only [P_collatz]
    rw [show (2 : ZMod (3 ^ 1))⁻¹ * 2 = 1 by rw [h2inv]; decide,
      show (2 : ZMod (3 ^ 1))⁻¹ * (3 * 2 + 1) = 2 by rw [h2inv]; decide]
  have e0 := congrFun hP 0
  have e1 := congrFun hP 1
  have e2 := congrFun hP 2
  simp only [Pi.smul_apply, smul_eq_mul, hP0, hP1, hP2] at e0 e1 e2
  by_cases hy : f 1 = 0
  · rw [hy] at e1
    have hz : f 2 = 0 := by linear_combination e1
    by_cases hx : f 0 = 0
    · exfalso
      apply hf
      funext v
      rw [Pi.zero_apply]
      change ZMod 3 at v
      have key3 : ∀ w : ZMod 3, w = 0 ∨ w = 1 ∨ w = 2 := by decide
      rcases key3 v with rfl | rfl | rfl
      · exact hx
      · exact hy
      · exact hz
    · rw [hz] at e0
      have hfactor : (lam - 1 / 2) * f 0 = 0 := by linear_combination -e0
      rcases mul_eq_zero.mp hfactor with h | h
      · right
        left
        linear_combination h
      · exact absurd h hx
  · have hz : f 2 = lam * f 1 := by linear_combination e1
    rw [hz] at e2
    have hfactor : (1 + 2 * lam) * (1 - lam) * f 1 = 0 := by
      linear_combination 2 * e2
    have hfactor2 : (1 + 2 * lam) * (1 - lam) = 0 := by
      rcases mul_eq_zero.mp hfactor with h | h
      · exact h
      · exact absurd h hy
    rcases mul_eq_zero.mp hfactor2 with h | h
    · right
      right
      linear_combination h / 2
    · left
      linear_combination -h

/-- The base case `j = 1` is an instance of `SpectrumClassification`. -/
theorem spectrum_classification_at_one :
    ∀ (lam : ℂ) (f : ZMod (3 ^ 1) → ℂ),
      P_collatz 1 f = lam • f → f ≠ 0 →
      lam = 1 ∨ ∃ ζ : ℂ, ζ ^ (2 * 3 ^ (1 - 1)) = 1 ∧ lam = (1 / 2 : ℂ) * ζ := by
  intro lam f hP hf
  rcases spectrum_classification_level_one hP hf with rfl | rfl | rfl
  · exact Or.inl rfl
  · exact Or.inr ⟨1, by norm_num, by norm_num⟩
  · exact Or.inr ⟨-1, by norm_num, by norm_num⟩

/-- The classification implies there are no relevant directions: every eigenvalue
`λ ≠ 1` of `P_j` satisfies `‖λ‖ = 1/2 < 1`. This closes the Bridge 2 gap
conditionally on `SpectrumClassification`; `no_relevant_directions` below is the
unconditional form (v7). -/
theorem no_relevant_directions_of_spectrum_classification
    (h : SpectrumClassification) {j : ℕ} (hj : 1 ≤ j) {lam : ℂ}
    {f : ZMod (3 ^ j) → ℂ} (hP : P_collatz j f = lam • f) (hf : f ≠ 0)
    (hne : lam ≠ 1) :
    ‖lam‖ = 1 / 2 := by
  rcases h j hj lam f hP hf with rfl | ⟨ζ, hζ, rfl⟩
  · exact absurd rfl hne
  · have hn : (2 * 3 ^ (j - 1) : ℕ) ≠ 0 := by positivity
    have h1 : ‖ζ‖ ^ (2 * 3 ^ (j - 1)) = 1 := by
      rw [← norm_pow, hζ, norm_one]
    have hζnorm : ‖ζ‖ = 1 := (pow_eq_one_iff_of_nonneg (norm_nonneg ζ) hn).mp h1
    rw [norm_mul, norm_half, hζnorm, mul_one]

/-! #### Section 7 completion (v7): unconditional `SpectrumClassification`

Containment half of Step 3, which is all the classification needs. Write
`P_{j+1} f = (1/2)·A f + (1/2)·B f` with `A f (v) = f (2⁻¹ * v)` and
`B f (v) = f (2⁻¹ * (3 * v + 1))`. `B f` is always locally constant at level `j`
(`second_branch_isLocallyConstant`), and `A` preserves the lift subspace
`im (liftStep 3 j)` (`mulInvTwoOp_liftStep`). So if `P_{j+1} f = λ f` with `f` not
locally constant, then `A f ≡ 2λ f`, hence `A^k f ≡ (2λ)^k f` modulo `im (liftStep 3 j)`;
taking `k = φ(3^{j+1})`, where `A^k = id` by Euler (`inv_two_pow_totient`), gives
`(1 - (2λ)^k) • f ∈ im (liftStep 3 j)`, forcing `(2λ)^k = 1`. No primitive root,
no fiber-difference iteration and no `Matrix.charpoly` are used. (The fiber-difference
route does not work directly: `2⁻¹ * (v + 3^j) = 2⁻¹ * v + 2 * 3^j` in `ZMod (3^(j+1))`,
so `A` does not commute with `fiberDiffP 3 j`.) -/

/-- Multiplication-by-`2⁻¹` pullback `A f (v) = f (2⁻¹ * v)` on `ZMod (3 ^ j) → ℂ`: the
first branch of `P_collatz j` without its factor `1 / 2`. -/
noncomputable def mulInvTwoOp (j : ℕ) : Module.End ℂ (ZMod (3 ^ j) → ℂ) :=
  LinearMap.funLeft ℂ ℂ (fun v : ZMod (3 ^ j) => (2 : ZMod (3 ^ j))⁻¹ * v)

theorem mulInvTwoOp_apply (j : ℕ) (g : ZMod (3 ^ j) → ℂ) (v : ZMod (3 ^ j)) :
    mulInvTwoOp j g v = g ((2 : ZMod (3 ^ j))⁻¹ * v) := rfl

theorem mulInvTwoOp_pow_apply (j k : ℕ) (g : ZMod (3 ^ j) → ℂ) (v : ZMod (3 ^ j)) :
    (mulInvTwoOp j ^ k) g v = g ((2 : ZMod (3 ^ j))⁻¹ ^ k * v) := by
  induction k generalizing v with
  | zero => simp
  | succ k ih =>
    rw [pow_succ' (mulInvTwoOp j) k, Module.End.mul_apply, mulInvTwoOp_apply, ih,
      pow_succ ((2 : ZMod (3 ^ j))⁻¹) k, mul_assoc]

/-- Euler: `(2⁻¹) ^ φ(3 ^ j) = 1` in `ZMod (3 ^ j)` (`ZMod.pow_totient` on the unit `2`). -/
theorem inv_two_pow_totient (j : ℕ) :
    (2 : ZMod (3 ^ j))⁻¹ ^ Nat.totient (3 ^ j) = 1 := by
  have hcop : Nat.Coprime 2 (3 ^ j) := Nat.Coprime.pow_right j (by decide)
  have hu : ((ZMod.unitOfCoprime 2 hcop : (ZMod (3 ^ j))ˣ) : ZMod (3 ^ j)) = 2 := by
    rw [ZMod.coe_unitOfCoprime]
    norm_num
  have hinv : (2 : ZMod (3 ^ j))⁻¹ =
      (((ZMod.unitOfCoprime 2 hcop)⁻¹ : (ZMod (3 ^ j))ˣ) : ZMod (3 ^ j)) := by
    rw [← ZMod.inv_coe_unit, hu]
  rw [hinv, ← Units.val_pow_eq_pow_val, ZMod.pow_totient, Units.val_one]

theorem mulInvTwoOp_pow_totient (j : ℕ) (g : ZMod (3 ^ j) → ℂ) :
    (mulInvTwoOp j ^ Nat.totient (3 ^ j)) g = g := by
  funext v
  rw [mulInvTwoOp_pow_apply, inv_two_pow_totient, one_mul]

/-- `A` commutes with inflation (`j ≥ 1`), so it preserves the lift subspace. -/
theorem mulInvTwoOp_liftStep (j : ℕ) (hj : 1 ≤ j) (g : ZMod (3 ^ j) → ℂ) :
    mulInvTwoOp (j + 1) (liftStep 3 j g) = liftStep 3 j (mulInvTwoOp j g) := by
  funext v
  simp only [mulInvTwoOp_apply, liftStep, LinearMap.coe_mk, AddHom.coe_mk, map_mul,
    projPow3_inv_two (j + 1) j (Nat.le_succ j) hj]

/-- The second branch of `P_collatz (j + 1)` is ALWAYS locally constant at level `j`
(i.e. lies in `LinearMap.range (liftStep 3 j)`), because `3 * (v + 3^j) + 1 = 3 * v + 1`
in `ZMod (3 ^ (j + 1))`. -/
lemma second_branch_isLocallyConstant (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ) :
    IsLocallyConstantAtLevel 3 j
      (fun v : ZMod (3 ^ (j + 1)) => f ((2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1))) := by
  intro v
  simp only [fiberDiffP]
  have h3 : (3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = 0 := by
    norm_cast
    rw [← pow_succ']
    exact ZMod.natCast_self (3 ^ (j + 1))
  have harg : (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) + 1) =
      (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1) := by
    calc (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) + 1)
      _ = (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1 + 3 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) := by ring
      _ = (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1 + 0) := by rw [h3]
      _ = (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1) := by ring
  rw [harg, sub_self]

/-- Quotient step: if `P_collatz (j + 1) f = lam • f` and `f` is not locally constant at
level `j`, then `(2 * lam) ^ φ(3 ^ (j + 1)) = 1`. -/
theorem quotient_eigenvalue_root (j : ℕ) (hj : 1 ≤ j) {lam : ℂ}
    {f : ZMod (3 ^ (j + 1)) → ℂ} (hP : P_collatz (j + 1) f = lam • f)
    (hlc : ¬ IsLocallyConstantAtLevel 3 j f) :
    (2 * lam) ^ Nat.totient (3 ^ (j + 1)) = 1 := by
  have hApres : ∀ h ∈ LinearMap.range (liftStep 3 j),
      mulInvTwoOp (j + 1) h ∈ LinearMap.range (liftStep 3 j) := by
    rintro h ⟨g, rfl⟩
    exact ⟨mulInvTwoOp j g, (mulInvTwoOp_liftStep j hj g).symm⟩
  have hB : (fun v : ZMod (3 ^ (j + 1)) => f ((2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1))) ∈
      LinearMap.range (liftStep 3 j) :=
    (isLocallyConstant_iff_mem_range_liftStep 3 j _).mp (second_branch_isLocallyConstant j f)
  have hstep : mulInvTwoOp (j + 1) f - (2 * lam) • f ∈ LinearMap.range (liftStep 3 j) := by
    have heq : mulInvTwoOp (j + 1) f - (2 * lam) • f =
        -(fun v : ZMod (3 ^ (j + 1)) => f ((2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1))) := by
      funext v
      have hv := congrFun hP v
      simp only [P_collatz, Pi.smul_apply, smul_eq_mul] at hv
      simp only [Pi.sub_apply, Pi.smul_apply, smul_eq_mul, Pi.neg_apply, mulInvTwoOp_apply]
      linear_combination 2 * hv
    rw [heq]
    exact Submodule.neg_mem _ hB
  have hpow : ∀ k : ℕ, (mulInvTwoOp (j + 1) ^ k) f - (2 * lam) ^ k • f ∈
      LinearMap.range (liftStep 3 j) := by
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      have hid : (mulInvTwoOp (j + 1) ^ (k + 1)) f - (2 * lam) ^ (k + 1) • f =
          mulInvTwoOp (j + 1) ((mulInvTwoOp (j + 1) ^ k) f - (2 * lam) ^ k • f) +
            (2 * lam) ^ k • (mulInvTwoOp (j + 1) f - (2 * lam) • f) := by
        rw [pow_succ' (mulInvTwoOp (j + 1)) k, Module.End.mul_apply, map_sub, map_smul,
          smul_sub, pow_succ (2 * lam) k, mul_smul]
        abel
      rw [hid]
      exact Submodule.add_mem _ (hApres _ ih) (Submodule.smul_mem _ _ hstep)
  have hfin := hpow (Nat.totient (3 ^ (j + 1)))
  rw [mulInvTwoOp_pow_totient] at hfin
  by_contra hne
  have hsub : (1 : ℂ) - (2 * lam) ^ Nat.totient (3 ^ (j + 1)) ≠ 0 :=
    sub_ne_zero.mpr (Ne.symm hne)
  have hf1 : ((1 : ℂ) - (2 * lam) ^ Nat.totient (3 ^ (j + 1))) • f ∈
      LinearMap.range (liftStep 3 j) := by
    rw [sub_smul, one_smul]
    exact hfin
  have hf2 := Submodule.smul_mem _ ((1 : ℂ) - (2 * lam) ^ Nat.totient (3 ^ (j + 1)))⁻¹ hf1
  rw [smul_smul, inv_mul_cancel₀ hsub, one_smul] at hf2
  exact hlc ((isLocallyConstant_iff_mem_range_liftStep 3 j f).mpr hf2)

/-- `SpectrumClassification` for all `j ≥ 1`, by induction on `j`.
- If `f` is locally constant at level `j`, then `f = liftStep 3 j g` with `g ≠ 0` and
  `P_collatz j g = lam • g`; the induction hypothesis gives `lam = 1` or `lam = (1/2)·ζ`
  with `ζ ^ (2 * 3 ^ (j - 1)) = 1`, and the same `ζ` satisfies `ζ ^ (2 * 3 ^ j) = 1`.
- Otherwise `quotient_eigenvalue_root` gives `(2 * lam) ^ φ(3 ^ (j + 1)) = 1`, and
  `φ(3 ^ (j + 1)) = 2 * 3 ^ j`; take `ζ = 2 * lam`. -/
theorem spectrum_classification_proved : SpectrumClassification := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base =>
    exact spectrum_classification_at_one
  | succ j hj ih =>
    intro lam f hP hf
    by_cases hlc : IsLocallyConstantAtLevel 3 j f
    · -- Case 1: `f` is locally constant at level `j`, so `f = liftStep 3 j g`
      rw [isLocallyConstant_iff_mem_range_liftStep] at hlc
      obtain ⟨g, rfl⟩ := hlc
      have hg : g ≠ 0 := by
        rintro rfl
        exact hf (map_zero _)
      have hPg : P_collatz j g = lam • g := by
        apply liftStep_injective 3 j
        rw [← P_collatz_intertwines_liftStep j hj g, hP, map_smul]
      rcases ih lam g hPg hg with rfl | ⟨ζ, hζ, rfl⟩
      · exact Or.inl rfl
      · refine Or.inr ⟨ζ, ?_, rfl⟩
        have hexp : 2 * 3 ^ (j + 1 - 1) = (2 * 3 ^ (j - 1)) * 3 := by
          have : j + 1 - 1 = (j - 1) + 1 := by omega
          rw [this, pow_succ 3 (j - 1)]
          ring
        rw [hexp, pow_mul, hζ, one_pow]
    · -- Case 2: `f` is not locally constant at level `j`
      refine Or.inr ⟨2 * lam, ?_, by ring⟩
      have htot : Nat.totient (3 ^ (j + 1)) = 2 * 3 ^ (j + 1 - 1) := by
        rw [Nat.totient_prime_pow Nat.prime_three (by omega : 0 < j + 1)]
        simp [mul_comm]
      rw [← htot]
      exact quotient_eigenvalue_root j hj hP hlc

/-- No relevant directions, unconditionally: every eigenvalue `λ ≠ 1` of `P_collatz j`
(`j ≥ 1`) satisfies `‖λ‖ = 1/2`. -/
theorem no_relevant_directions {j : ℕ} (hj : 1 ≤ j) {lam : ℂ}
    {f : ZMod (3 ^ j) → ℂ} (hP : P_collatz j f = lam • f) (hf : f ≠ 0)
    (hne : lam ≠ 1) :
    ‖lam‖ = 1 / 2 :=
  no_relevant_directions_of_spectrum_classification spectrum_classification_proved hj hP hf hne

/-! ### Section 7b: Exact characteristic polynomial of `P_collatz j` (v10)

Goal: `χ_{P_j}(X) = (X - 1) * ∏_{i=1}^{j} 2^{-2·3^{i-1}} ((2X)^{2·3^{i-1}} - 1)`
(`ExactCharpolyStatement`, proved for all `j ≥ 1` in `exact_charpoly_proved`).

Proof plan.
1. Block-triangular split along the invariant subspace `W_j = im (liftStep 3 j)`:
   `χ_{P_{j+1}} = χ_{P_{j+1}|W_j} · χ_{P_{j+1} mod W_j}` (`charpoly_split_locallyConstant`), and the
   restriction is conjugate to `P_j` via `liftStepEquiv j` (`charpoly_restrict_P_collatz_end`).
2. On the quotient `Q_j = V_{j+1} ⧸ W_j` (dimension `2·3^j`), `P_{j+1}` acts as `(1/2) • Ā`, where
   `Ā` is induced by `A f (v) = f (2⁻¹ v)` (`quotient_P_collatz_eq_half_mulInvTwo`), because the
   second branch always lies in `W_j`.
3. `Ā ^ (2·3^j) = 1` (Euler), and EVERY `(2·3^j)`-th root of unity `μ` is an eigenvalue of `Ā`
   (`exists_quotient_eigenvector`). With `2·3^j = dim Q_j` distinct roots, the minimal polynomial has
   degree `≥ 2·3^j`, so `χ_Ā = minpoly Ā = X^{2·3^j} - 1`; likewise `χ_{(1/2)Ā} = X^{2·3^j} - (1/2)^{2·3^j}`.

Correction to the roadmap in the request: the quotient is NOT carried by the unit shell alone.
`Q_j` decomposes over the 3-adic shells `3^i·(ZMod 3^{j+1-i})ˣ`: shell `i < j` contributes the roots of
unity of order `3^{j-i}` or `2·3^{j-i}` (dimension `4·3^{j-i-1}`), and the top fiber `{0, 3^j, 2·3^j}`
contributes `±1`. The unit shell alone has dimension `4·3^{j-1} < 2·3^j`, so testing only `δ_1` cannot
give the degree bound (the request's own drafts reach this point). The eigenvectors used here are
`f_{i,μ} (v) = ∑_{m < 2·3^j} μ^m [v = 2^{-m}·3^i]`, one shell per `μ`, plus `δ_0` for `μ = 1`.

Number theory used: `orderOf (2 : ZMod (3^(k+1))) = 2·3^k` (`orderOf_two_zmod_three_pow`), proved from
`2^{3^k} ≢ 1 (mod 3)` and the lifting-the-exponent lemma `v₃(4^{3^k} - 1) = k + 1`.

The block split is proved in this file (`charpoly_restrict_mul_mapQ`, v3 of the combined file): a complement
`U` of `W`, `U ≃ V ⧸ W` via `mkQ`, and `Matrix.charpoly_fromBlocks_zero₂₁` in the product basis of `W × U`.
-/

section CharpolyExtension

open Polynomial

/-- The `ℂ`-linear endomorphism version of `P_collatz j` for `LinearMap.charpoly`. -/
noncomputable def P_collatz_end (j : ℕ) : Module.End ℂ (ZMod (3 ^ j) → ℂ) where
  toFun := P_collatz j
  map_add' f g := by
    funext v
    simp only [P_collatz, Pi.add_apply]
    ring
  map_smul' c f := by
    funext v
    simp only [P_collatz, Pi.smul_apply, smul_eq_mul, RingHom.id_apply]
    ring

theorem P_collatz_end_apply (j : ℕ) (f : ZMod (3 ^ j) → ℂ) :
    P_collatz_end j f = P_collatz j f := rfl

/-- The locally constant subspace `W_j = im (liftStep 3 j)` inside `ZMod (3 ^ (j + 1)) → ℂ`. -/
noncomputable def locallyConstantSubmodule (j : ℕ) :
    Submodule ℂ (ZMod (3 ^ (j + 1)) → ℂ) :=
  LinearMap.range (liftStep 3 j)

/-- `P_collatz_end (j + 1)` leaves `locallyConstantSubmodule j` invariant. -/
lemma P_collatz_end_mem_locallyConstant (j : ℕ) (hj : 1 ≤ j)
    {f : ZMod (3 ^ (j + 1)) → ℂ} (hf : f ∈ locallyConstantSubmodule j) :
    P_collatz_end (j + 1) f ∈ locallyConstantSubmodule j := by
  obtain ⟨g, rfl⟩ := LinearMap.mem_range.mp hf
  exact LinearMap.mem_range.mpr ⟨P_collatz j g, (P_collatz_intertwines_liftStep j hj g).symm⟩

lemma P_collatz_end_le_comap (j : ℕ) (hj : 1 ≤ j) :
    locallyConstantSubmodule j ≤ (locallyConstantSubmodule j).comap (P_collatz_end (j + 1)) :=
  fun _ hf => P_collatz_end_mem_locallyConstant j hj hf

/-- `mulInvTwoOp (j + 1)` leaves `locallyConstantSubmodule j` invariant. -/
lemma mulInvTwoOp_le_comap (j : ℕ) (hj : 1 ≤ j) :
    locallyConstantSubmodule j ≤ (locallyConstantSubmodule j).comap (mulInvTwoOp (j + 1)) := by
  intro f hf
  obtain ⟨g, rfl⟩ := LinearMap.mem_range.mp hf
  exact LinearMap.mem_range.mpr ⟨mulInvTwoOp j g, (mulInvTwoOp_liftStep j hj g).symm⟩

/-- The restriction of `P_collatz_end (j + 1)` to `locallyConstantSubmodule j` is conjugate
to `P_collatz_end j` via the linear equivalence `LinearEquiv.ofInjective (liftStep 3 j)`. -/
noncomputable def liftStepEquiv (j : ℕ) :
    (ZMod (3 ^ j) → ℂ) ≃ₗ[ℂ] locallyConstantSubmodule j :=
  LinearEquiv.ofInjective (liftStep 3 j) (liftStep_injective 3 j)

/-- On the quotient by `locallyConstantSubmodule j`, the induced operator of
`P_collatz_end (j + 1)` equals `(1 / 2 : ℂ) •` the induced operator of `mulInvTwoOp (j + 1)`,
because the second branch lands in `locallyConstantSubmodule j`. -/
lemma quotient_P_collatz_eq_half_mulInvTwo (j : ℕ) (hj : 1 ≤ j) :
    Submodule.mapQ (locallyConstantSubmodule j) (locallyConstantSubmodule j)
      (P_collatz_end (j + 1)) (P_collatz_end_le_comap j hj) =
    (1 / 2 : ℂ) • Submodule.mapQ (locallyConstantSubmodule j) (locallyConstantSubmodule j)
      (mulInvTwoOp (j + 1)) (mulInvTwoOp_le_comap j hj) := by
  apply LinearMap.ext
  intro q
  obtain ⟨f, rfl⟩ := Submodule.Quotient.mk_surjective _ q
  rw [Submodule.mapQ_apply, LinearMap.smul_apply, Submodule.mapQ_apply,
    ← Submodule.Quotient.mk_smul, Submodule.Quotient.eq]
  have hdiff : P_collatz_end (j + 1) f - (1 / 2 : ℂ) • mulInvTwoOp (j + 1) f =
      (1 / 2 : ℂ) • (fun v : ZMod (3 ^ (j + 1)) =>
        f ((2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1))) := by
    funext v
    simp only [P_collatz_end_apply, P_collatz, Pi.sub_apply, Pi.smul_apply, smul_eq_mul,
      mulInvTwoOp_apply]
    ring
  rw [hdiff]
  apply Submodule.smul_mem
  exact (isLocallyConstant_iff_mem_range_liftStep 3 j _).mp
    (second_branch_isLocallyConstant j f)

/-- Exact characteristic polynomial formula (proved below as `exact_charpoly_proved`):
`χ_{P_j}(X) = (X - 1) * ∏_{i ∈ Finset.Icc 1 j} C ((1/2) ^ (2 * 3 ^ (i - 1))) * ((C 2 * X) ^ (2 * 3 ^ (i - 1)) - 1)`. -/
def ExactCharpolyStatement (j : ℕ) : Prop :=
  LinearMap.charpoly (P_collatz_end j) =
    (X - C 1) * ∏ i ∈ Finset.Icc 1 j,
      C ((1 / 2 : ℂ) ^ (2 * 3 ^ (i - 1))) * ((C 2 * X) ^ (2 * 3 ^ (i - 1)) - C 1)

end CharpolyExtension

section CharpolyCompleteProof

open Polynomial

/-! #### Number theory: `2` is a primitive root modulo `3 ^ (k + 1)` -/

theorem totient_three_pow_succ (j : ℕ) : Nat.totient (3 ^ (j + 1)) = 2 * 3 ^ j := by
  rw [Nat.totient_prime_pow Nat.prime_three (Nat.succ_pos j)]
  simp [mul_comm]

theorem zmod_two_pow_eq_one_iff (n m : ℕ) :
    (2 : ZMod (3 ^ n)) ^ m = 1 ↔ 2 ^ m ≡ 1 [MOD 3 ^ n] := by
  rw [← ZMod.natCast_eq_natCast_iff, Nat.cast_pow, Nat.cast_ofNat, Nat.cast_one]

/-- `2 ^ (3 ^ k) ≢ 1 (mod 3 ^ (k + 1))`, already modulo `3`: `3 ^ k` is odd and `2 ≡ -1 (mod 3)`. -/
theorem two_pow_three_pow_not_modEq_one (k : ℕ) : ¬ 2 ^ (3 ^ k) ≡ 1 [MOD 3 ^ (k + 1)] := by
  intro h
  have h3 : 2 ^ (3 ^ k) ≡ 1 [MOD 3] := Nat.ModEq.of_dvd (dvd_pow_self 3 (Nat.succ_ne_zero k)) h
  obtain ⟨t, ht⟩ : Odd (3 ^ k) := Odd.pow ⟨1, rfl⟩
  rw [ht, pow_succ, pow_mul] at h3
  have h4 : (2 ^ 2) ^ t * 2 ≡ 1 ^ t * 2 [MOD 3] :=
    Nat.ModEq.mul_right 2 (Nat.ModEq.pow t (by decide))
  have h5 := h4.symm.trans h3
  rw [one_pow, one_mul] at h5
  exact absurd h5 (by decide)

/-- `2 ^ (2 * 3 ^ k) = 4 ^ (3 ^ k) ≢ 1 (mod 3 ^ (k + 2))`: by lifting the exponent,
`v₃ (4 ^ (3 ^ k) - 1) = v₃ 3 + v₃ (3 ^ k) = k + 1`. -/
theorem two_pow_two_mul_three_pow_not_modEq_one (k : ℕ) :
    ¬ 2 ^ (2 * 3 ^ k) ≡ 1 [MOD 3 ^ (k + 1 + 1)] := by
  intro h
  have h4 : (2 : ℕ) ^ (2 * 3 ^ k) = 4 ^ (3 ^ k) := by
    rw [pow_mul]
    norm_num
  rw [h4] at h
  have hge : 4 ≤ 4 ^ (3 ^ k) := Nat.le_self_pow (pow_ne_zero _ (by norm_num)) 4
  have hdvd : 3 ^ (k + 1 + 1) ∣ 4 ^ (3 ^ k) - 1 := (Nat.modEq_iff_dvd' (by omega)).mp h.symm
  have hne : 4 ^ (3 ^ k) - 1 ≠ 0 := by omega
  have hle := (padicValNat_dvd_iff_le hne).mp hdvd
  have hlte : padicValNat 3 (4 ^ (3 ^ k) - 1 ^ (3 ^ k)) =
      padicValNat 3 (4 - 1) + padicValNat 3 (3 ^ k) :=
    padicValNat.pow_sub_pow (p := 3) ⟨1, rfl⟩ (by decide) (by decide) (by decide)
      (pow_ne_zero _ (by norm_num))
  rw [one_pow, show (4 : ℕ) - 1 = 3 from rfl, padicValNat_self, padicValNat.prime_pow] at hlte
  omega

/-- `2` has multiplicative order exactly `2 * 3 ^ k` in `ZMod (3 ^ (k + 1))`. -/
theorem orderOf_two_zmod_three_pow (k : ℕ) :
    orderOf (2 : ZMod (3 ^ (k + 1))) = 2 * 3 ^ k := by
  apply orderOf_eq_of_pow_and_pow_div_prime (by positivity)
  · rw [zmod_two_pow_eq_one_iff]
    have h := Nat.ModEq.pow_totient (Nat.Coprime.pow_right (k + 1) (by decide : Nat.Coprime 2 3))
    rwa [totient_three_pow_succ] at h
  · intro p hp hpd
    rcases (Nat.Prime.dvd_mul hp).mp hpd with h2 | h3
    · have hp2 : p = 2 := (Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp h2
      subst hp2
      rw [Nat.mul_div_cancel_left _ (by norm_num), Ne, zmod_two_pow_eq_one_iff]
      exact two_pow_three_pow_not_modEq_one k
    · have hp3 : p = 3 := (Nat.prime_dvd_prime_iff_eq hp Nat.prime_three).mp (hp.dvd_of_dvd_pow h3)
      subst hp3
      cases k with
      | zero => norm_num at h3
      | succ k =>
        have hdiv : 2 * 3 ^ (k + 1) / 3 = 2 * 3 ^ k := by
          rw [pow_succ, ← mul_assoc, Nat.mul_div_cancel _ (by norm_num)]
        rw [hdiv, Ne, zmod_two_pow_eq_one_iff]
        exact two_pow_two_mul_three_pow_not_modEq_one k

/-- The request's unit-group form of the primitive-root fact (its `ZMod.isPrimitiveRoot_two_three_pow`
does not exist in Mathlib; this is derived from `orderOf_two_zmod_three_pow`). -/
theorem orderOf_two_mod_three_pow (j : ℕ) :
    orderOf (ZMod.unitOfCoprime 2 (Nat.Coprime.pow_right (j + 1) (by decide)) :
      (ZMod (3 ^ (j + 1)))ˣ) = 2 * 3 ^ j := by
  rw [← orderOf_units, ZMod.coe_unitOfCoprime, Nat.cast_ofNat, orderOf_two_zmod_three_pow]

/-- `2 ^ m ≡ 1 (mod 3 ^ (k + 1))` iff `2 * 3 ^ k ∣ m`. -/
theorem two_pow_modEq_one_iff (k m : ℕ) : 2 ^ m ≡ 1 [MOD 3 ^ (k + 1)] ↔ 2 * 3 ^ k ∣ m := by
  rw [← zmod_two_pow_eq_one_iff, ← orderOf_dvd_iff_pow_eq_one, orderOf_two_zmod_three_pow]

theorem isUnit_two_zmod_three_pow (n : ℕ) : IsUnit (2 : ZMod (3 ^ n)) := by
  have h := (ZMod.isUnit_iff_coprime 2 (3 ^ n)).mpr (Nat.Coprime.pow_right n (by decide))
  simpa using h

/-- Shell stabilizers: for `i < n`, `2⁻¹ ^ m` fixes `3 ^ i` in `ZMod (3 ^ n)` iff
`2 * 3 ^ (n - 1 - i) ∣ m` (multiplication by `2` has order `2 * 3 ^ (n - 1 - i)` on the shell of `3 ^ i`). -/
theorem inv_two_pow_mul_three_pow_eq_iff (n i m : ℕ) (hi : i < n) :
    (2 : ZMod (3 ^ n))⁻¹ ^ m * 3 ^ i = 3 ^ i ↔ 2 * 3 ^ (n - 1 - i) ∣ m := by
  have h2u : (2 : ZMod (3 ^ n)) ^ m * (2 : ZMod (3 ^ n))⁻¹ ^ m = 1 := by
    rw [← mul_pow, ZMod.mul_inv_of_unit _ (isUnit_two_zmod_three_pow n), one_pow]
  have step1 : (2 : ZMod (3 ^ n))⁻¹ ^ m * 3 ^ i = 3 ^ i ↔
      (2 : ZMod (3 ^ n)) ^ m * 3 ^ i = 3 ^ i := by
    constructor
    · intro h
      calc (2 : ZMod (3 ^ n)) ^ m * 3 ^ i
          = 2 ^ m * ((2 : ZMod (3 ^ n))⁻¹ ^ m * 3 ^ i) := by rw [h]
        _ = 3 ^ i := by rw [← mul_assoc, h2u, one_mul]
    · intro h
      calc (2 : ZMod (3 ^ n))⁻¹ ^ m * 3 ^ i
          = (2 : ZMod (3 ^ n))⁻¹ ^ m * (2 ^ m * 3 ^ i) := by rw [h]
        _ = 3 ^ i := by rw [← mul_assoc, mul_comm ((2 : ZMod (3 ^ n))⁻¹ ^ m), h2u, one_mul]
  have step2 : (2 : ZMod (3 ^ n)) ^ m * 3 ^ i = 3 ^ i ↔
      3 ^ i * 2 ^ m ≡ 3 ^ i * 1 [MOD 3 ^ i * 3 ^ (n - i)] := by
    have hN : 3 ^ i * 3 ^ (n - i) = 3 ^ n := by rw [← pow_add, Nat.add_sub_cancel' hi.le]
    rw [hN, ← ZMod.natCast_eq_natCast_iff]
    push_cast
    try rw [mul_one]
    rw [mul_comm ((2 : ZMod (3 ^ n)) ^ m)]
  rw [step1, step2, Nat.ModEq.mul_left_cancel_iff' (pow_ne_zero _ (by norm_num)),
    show n - i = (n - 1 - i) + 1 by omega, two_pow_modEq_one_iff]

theorem inv_two_pow_N (j : ℕ) : (2 : ZMod (3 ^ (j + 1)))⁻¹ ^ (2 * 3 ^ j) = 1 := by
  have h := inv_two_pow_totient (j + 1)
  rwa [totient_three_pow_succ] at h

theorem natCast_three_pow_ne_zero (j : ℕ) : ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) ≠ 0 := by
  rw [Ne, zmodNatCast_eq_zero_iff]
  intro h
  have h1 := Nat.le_of_dvd (by positivity) h
  have h2 := Nat.pow_lt_pow_succ (by norm_num : 1 < 3) (n := j)
  omega

/-! #### The quotient operator `Ā` and its eigenvectors -/

/-- The induced operator `Ā` of `mulInvTwoOp (j + 1)` on
`Q_j = (ZMod (3 ^ (j + 1)) → ℂ) ⧸ locallyConstantSubmodule j`. -/
noncomputable def quotientMulInvTwo (j : ℕ) (hj : 1 ≤ j) :
    Module.End ℂ ((ZMod (3 ^ (j + 1)) → ℂ) ⧸ locallyConstantSubmodule j) :=
  Submodule.mapQ (locallyConstantSubmodule j) (locallyConstantSubmodule j)
    (mulInvTwoOp (j + 1)) (mulInvTwoOp_le_comap j hj)

theorem quotientMulInvTwo_mk (j : ℕ) (hj : 1 ≤ j) (f : ZMod (3 ^ (j + 1)) → ℂ) :
    quotientMulInvTwo j hj (Submodule.Quotient.mk f) =
      Submodule.Quotient.mk (mulInvTwoOp (j + 1) f) := rfl

theorem quotientMulInvTwo_pow_mk (j : ℕ) (hj : 1 ≤ j) (k : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ) :
    (quotientMulInvTwo j hj ^ k) (Submodule.Quotient.mk f) =
      Submodule.Quotient.mk ((mulInvTwoOp (j + 1) ^ k) f) := by
  induction k with
  | zero => simp
  | succ k ih =>
    rw [pow_succ' (quotientMulInvTwo j hj) k, Module.End.mul_apply, ih,
      pow_succ' (mulInvTwoOp (j + 1)) k, Module.End.mul_apply]
    rfl

/-- Euler on the quotient: `Ā ^ (2 * 3 ^ j) = 1`. -/
theorem quotientMulInvTwo_pow_N (j : ℕ) (hj : 1 ≤ j) :
    quotientMulInvTwo j hj ^ (2 * 3 ^ j) = 1 := by
  apply LinearMap.ext
  intro q
  obtain ⟨f, rfl⟩ := Submodule.Quotient.mk_surjective _ q
  rw [quotientMulInvTwo_pow_mk, ← totient_three_pow_succ, mulInvTwoOp_pow_totient,
    Module.End.one_apply]

/-- Dimension of the quotient space `Q_j` is `2 * 3 ^ j`. -/
lemma finrank_quotient_locallyConstant (j : ℕ) :
    Module.finrank ℂ ((ZMod (3 ^ (j + 1)) → ℂ) ⧸ locallyConstantSubmodule j) =
      2 * 3 ^ j := by
  have h_add := Submodule.finrank_quotient_add_finrank (locallyConstantSubmodule j)
  have h_tot : Module.finrank ℂ (ZMod (3 ^ (j + 1)) → ℂ) = 3 ^ (j + 1) := by
    simp [Module.finrank_pi, ZMod.card]
  have h_sub : Module.finrank ℂ (locallyConstantSubmodule j) = 3 ^ j := by
    rw [← (liftStepEquiv j).finrank_eq]
    simp [Module.finrank_pi, ZMod.card]
  rw [h_tot, h_sub] at h_add
  have h_pow : 3 ^ (j + 1) = 3 ^ j + 2 * 3 ^ j := by
    rw [pow_succ]
    ring
  omega

/-- Upper bound: `minpoly ℂ (quotientMulInvTwo j hj)` divides `X ^ (2 * 3 ^ j) - C 1`. -/
lemma aeval_quotientMulInvTwo_X_pow_sub_one (j : ℕ) (hj : 1 ≤ j) :
    aeval (quotientMulInvTwo j hj) (X ^ (2 * 3 ^ j) - C 1 : ℂ[X]) = 0 := by
  rw [map_sub, aeval_X_pow, aeval_C, map_one, quotientMulInvTwo_pow_N, sub_self]

lemma minpoly_quotientMulInvTwo_dvd (j : ℕ) (hj : 1 ≤ j) :
    minpoly ℂ (quotientMulInvTwo j hj) ∣ X ^ (2 * 3 ^ j) - C 1 :=
  minpoly.dvd ℂ _ (aeval_quotientMulInvTwo_X_pow_sub_one j hj)

lemma aeval_smul_quotientMulInvTwo (j : ℕ) (hj : 1 ≤ j) (c : ℂ) :
    aeval (c • quotientMulInvTwo j hj) (X ^ (2 * 3 ^ j) - C (c ^ (2 * 3 ^ j)) : ℂ[X]) = 0 := by
  rw [map_sub, aeval_X_pow, aeval_C, _root_.smul_pow, quotientMulInvTwo_pow_N,
    Algebra.algebraMap_eq_smul_one, sub_self]

/-- Cyclic reindexing used by the shell eigenvectors. -/
theorem sum_range_shift_of_periodic {M : Type*} [AddCommGroup M] (h : ℕ → M) (N : ℕ)
    (hN : h N = h 0) :
    ∑ m ∈ Finset.range N, h (m + 1) = ∑ m ∈ Finset.range N, h m := by
  have h2 := Finset.sum_range_succ' h N
  rw [Finset.sum_range_succ, hN] at h2
  exact (add_right_cancel h2).symm

theorem sum_cyclic_shift {R : Type*} [CommRing R] [DecidableEq R] (u w x v : R)
    (hwu : w * u = 1) (N : ℕ) (huN : u ^ N = 1) {ζ : ℂ} (hζ : ζ ^ N = 1) :
    ∑ m ∈ Finset.range N, ζ ^ m * (if u * v = u ^ m * x then (1 : ℂ) else 0) =
      ζ * ∑ m ∈ Finset.range N, ζ ^ m * (if v = u ^ m * x then (1 : ℂ) else 0) := by
  have hiff : ∀ m : ℕ, (u * v = u ^ (m + 1) * x ↔ v = u ^ m * x) := by
    intro m
    rw [pow_succ', mul_assoc]
    constructor
    · intro hv
      calc v = w * (u * v) := by rw [← mul_assoc, hwu, one_mul]
        _ = w * (u * (u ^ m * x)) := by rw [hv]
        _ = u ^ m * x := by rw [← mul_assoc, hwu, one_mul]
    · intro hv
      rw [hv]
  rw [Finset.mul_sum, ← sum_range_shift_of_periodic
    (fun m => ζ ^ m * (if u * v = u ^ m * x then (1 : ℂ) else 0)) N
    (by simp only [hζ, huN, pow_zero])]
  refine Finset.sum_congr rfl (fun m _ => ?_)
  beta_reduce
  rw [if_congr (hiff m) rfl rfl, pow_succ]
  ring

/-- Shell eigenvector `f_{x,ζ} (v) = ∑_{m < 2·3^j} ζ^m [v = 2⁻¹^m · x]`. -/
noncomputable def shellEigvec (j : ℕ) (x : ZMod (3 ^ (j + 1))) (ζ : ℂ) :
    ZMod (3 ^ (j + 1)) → ℂ :=
  fun v => ∑ m ∈ Finset.range (2 * 3 ^ j),
    ζ ^ m * (if v = (2 : ZMod (3 ^ (j + 1)))⁻¹ ^ m * x then 1 else 0)

theorem mulInvTwoOp_shellEigvec (j : ℕ) (x : ZMod (3 ^ (j + 1))) {ζ : ℂ}
    (hζ : ζ ^ (2 * 3 ^ j) = 1) :
    mulInvTwoOp (j + 1) (shellEigvec j x ζ) = ζ • shellEigvec j x ζ := by
  funext v
  rw [mulInvTwoOp_apply, Pi.smul_apply, smul_eq_mul]
  simp only [shellEigvec]
  exact sum_cyclic_shift _ 2 x v
    (ZMod.mul_inv_of_unit _ (isUnit_two_zmod_three_pow (j + 1))) _ (inv_two_pow_N j) hζ

/-- At `v = 3 ^ i` the shell eigenvector counts the stabilizer of `3 ^ i`; it is a positive
integer when `ζ ^ (2 * 3 ^ (j - i)) = 1`. -/
theorem shellEigvec_self_ne_zero (j i : ℕ) (hi : i ≤ j) {ζ : ℂ}
    (hζ : ζ ^ (2 * 3 ^ (j - i)) = 1) :
    shellEigvec j (3 ^ i) ζ (3 ^ i) ≠ 0 := by
  simp only [shellEigvec]
  have hterm : ∀ m ∈ Finset.range (2 * 3 ^ j),
      ζ ^ m * (if (3 : ZMod (3 ^ (j + 1))) ^ i = (2 : ZMod (3 ^ (j + 1)))⁻¹ ^ m * 3 ^ i
        then (1 : ℂ) else 0) =
      ((if (3 : ZMod (3 ^ (j + 1))) ^ i = (2 : ZMod (3 ^ (j + 1)))⁻¹ ^ m * 3 ^ i
        then 1 else 0 : ℕ) : ℂ) := by
    intro m _
    split_ifs with hm
    · have hdvd := (inv_two_pow_mul_three_pow_eq_iff (j + 1) i m (by omega)).mp hm.symm
      rw [show j + 1 - 1 - i = j - i by omega] at hdvd
      obtain ⟨t, rfl⟩ := hdvd
      rw [pow_mul, hζ, one_pow, mul_one, Nat.cast_one]
    · simp
  rw [Finset.sum_congr rfl hterm, ← Nat.cast_sum, Ne, Nat.cast_eq_zero]
  apply Nat.pos_iff_ne_zero.mp
  apply Finset.sum_pos'
  · intro m _
    exact Nat.zero_le _
  · refine ⟨0, Finset.mem_range.mpr (by positivity), ?_⟩
    simp

/-- Non-membership test: an `A`-eigenvector `f` with eigenvalue `ζ` and `f x ≠ 0`, where
`2⁻¹ ^ L * x ≡ x (mod 3 ^ j)` but `ζ ^ L ≠ 1`, is not locally constant at level `j`. -/
theorem not_mem_locallyConstant_of_eigen (j : ℕ) {f : ZMod (3 ^ (j + 1)) → ℂ} {ζ : ℂ}
    (hA : mulInvTwoOp (j + 1) f = ζ • f) {x : ZMod (3 ^ (j + 1))} (hx : f x ≠ 0) {L : ℕ}
    (hL : projPow 3 (j + 1) j (Nat.le_succ j) ((2 : ZMod (3 ^ (j + 1)))⁻¹ ^ L * x) =
      projPow 3 (j + 1) j (Nat.le_succ j) x)
    (hζL : ζ ^ L ≠ 1) :
    f ∉ locallyConstantSubmodule j := by
  intro hf
  obtain ⟨g, rfl⟩ := LinearMap.mem_range.mp hf
  have hpow : ∀ k : ℕ, (mulInvTwoOp (j + 1) ^ k) (liftStep 3 j g) = ζ ^ k • liftStep 3 j g := by
    intro k
    induction k with
    | zero => simp
    | succ k ih =>
      rw [pow_succ' (mulInvTwoOp (j + 1)) k, Module.End.mul_apply, ih, map_smul, hA, smul_smul,
        pow_succ ζ k]
  have hv := congrFun (hpow L) x
  rw [mulInvTwoOp_pow_apply, Pi.smul_apply, smul_eq_mul] at hv
  have hval : liftStep 3 j g ((2 : ZMod (3 ^ (j + 1)))⁻¹ ^ L * x) = liftStep 3 j g x := by
    simp only [liftStep, LinearMap.coe_mk, AddHom.coe_mk]
    rw [hL]
  rw [hval] at hv
  apply hζL
  have h0 : (ζ ^ L - 1) * liftStep 3 j g x = 0 := by linear_combination (-1 : ℂ) * hv
  rcases mul_eq_zero.mp h0 with h | h
  · exact sub_eq_zero.mp h
  · exact absurd h hx

/-- Every `(2 * 3 ^ j)`-th root of unity `μ` is an eigenvalue of `A` on a vector outside
`locallyConstantSubmodule j`, hence an eigenvalue of `Ā`. Shell choice: `μ = 1` uses `δ_0`;
otherwise `i` is the largest index `≤ j` with `μ ^ (2 * 3 ^ (j - i)) = 1`. -/
theorem exists_quotient_eigenvector (j : ℕ) (hj : 1 ≤ j) {μ : ℂ} (hμ : μ ^ (2 * 3 ^ j) = 1) :
    ∃ f : ZMod (3 ^ (j + 1)) → ℂ,
      mulInvTwoOp (j + 1) f = μ • f ∧ f ∉ locallyConstantSubmodule j := by
  classical
  by_cases hμ1 : μ = 1
  · subst hμ1
    refine ⟨fun v => if v = 0 then 1 else 0, ?_, ?_⟩
    · funext v
      have hu : IsUnit (2 : ZMod (3 ^ (j + 1)))⁻¹ :=
        ⟨⟨(2 : ZMod (3 ^ (j + 1)))⁻¹, 2,
          ZMod.inv_mul_of_unit _ (isUnit_two_zmod_three_pow (j + 1)),
          ZMod.mul_inv_of_unit _ (isUnit_two_zmod_three_pow (j + 1))⟩, rfl⟩
      rw [mulInvTwoOp_apply, one_smul]
      show (if (2 : ZMod (3 ^ (j + 1)))⁻¹ * v = 0 then (1 : ℂ) else 0) =
        if v = 0 then 1 else 0
      rw [if_congr hu.mul_right_eq_zero rfl rfl]
    · intro hf
      obtain ⟨g, hg⟩ := LinearMap.mem_range.mp hf
      have h0 := congrFun hg 0
      have h3 := congrFun hg ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))
      have hproj : projPow 3 (j + 1) j (Nat.le_succ j) ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
          projPow 3 (j + 1) j (Nat.le_succ j) 0 := by
        rw [map_zero, projPow, ZMod.castHom_apply,
          ZMod.cast_natCast (pow_dvd_pow 3 (Nat.le_succ j)), ZMod.natCast_self]
      simp only [liftStep, LinearMap.coe_mk, AddHom.coe_mk] at h0 h3
      rw [hproj, h0, if_neg (natCast_three_pow_ne_zero j)] at h3
      simp at h3
  · obtain ⟨i, hi_le, hPi, hmax⟩ : ∃ i, i ≤ j ∧ μ ^ (2 * 3 ^ (j - i)) = 1 ∧
        ∀ k, i < k → k ≤ j → ¬ μ ^ (2 * 3 ^ (j - k)) = 1 :=
      ⟨Nat.findGreatest (fun i => μ ^ (2 * 3 ^ (j - i)) = 1) j, Nat.findGreatest_le j,
        Nat.findGreatest_spec (P := fun i => μ ^ (2 * 3 ^ (j - i)) = 1) (Nat.zero_le j)
          (by simpa using hμ),
        fun k hk hkj => Nat.findGreatest_is_greatest hk hkj⟩
    refine ⟨shellEigvec j (3 ^ i) μ, mulInvTwoOp_shellEigvec j _ hμ, ?_⟩
    have hx := shellEigvec_self_ne_zero j i hi_le hPi
    rcases lt_or_eq_of_le hi_le with hlt | heq
    · refine not_mem_locallyConstant_of_eigen j (mulInvTwoOp_shellEigvec j _ hμ) hx
        (L := 2 * 3 ^ (j - 1 - i)) ?_ ?_
      · simp only [map_mul, map_pow, map_ofNat, projPow3_inv_two (j + 1) j (Nat.le_succ j) hj]
        exact (inv_two_pow_mul_three_pow_eq_iff j i _ hlt).mpr dvd_rfl
      · have h := hmax (i + 1) (by omega) (by omega)
        rwa [show j - (i + 1) = j - 1 - i by omega] at h
    · refine not_mem_locallyConstant_of_eigen j (mulInvTwoOp_shellEigvec j _ hμ) hx
        (L := 1) ?_ ?_
      · rw [heq]
        have h30 : (3 : ZMod (3 ^ j)) ^ j = 0 := by exact_mod_cast ZMod.natCast_self (3 ^ j)
        simp only [map_mul, map_pow, map_ofNat, h30, mul_zero]
      · rwa [pow_one]

/-- An eigenvector gives a root of the minimal polynomial. -/
theorem isRoot_minpoly_of_eigenvector {Q : Type*} [AddCommGroup Q] [Module ℂ Q]
    [FiniteDimensional ℂ Q] (T : Module.End ℂ Q) {μ : ℂ} {q : Q} (hq : q ≠ 0)
    (hT : T q = μ • q) : (minpoly ℂ T).IsRoot μ :=
  Module.End.isRoot_of_hasEigenvalue (Module.End.hasEigenvalue_of_hasEigenvector
    (Module.End.hasEigenvector_iff.mpr ⟨Module.End.mem_eigenspace_iff.mpr hT, hq⟩))

theorem isRoot_minpoly_smul_quotientMulInvTwo (j : ℕ) (hj : 1 ≤ j) (c : ℂ) {μ : ℂ}
    (hμ : μ ^ (2 * 3 ^ j) = 1) :
    (minpoly ℂ (c • quotientMulInvTwo j hj)).IsRoot (c * μ) := by
  obtain ⟨f, hAf, hf⟩ := exists_quotient_eigenvector j hj hμ
  apply isRoot_minpoly_of_eigenvector _ ((Submodule.Quotient.mk_eq_zero _).not.mpr hf)
  rw [LinearMap.smul_apply, quotientMulInvTwo_mk, hAf, Submodule.Quotient.mk_smul, smul_smul]

/-- `2 * 3 ^ j` distinct roots `c * ω ^ t` (`ω` a primitive `(2 * 3 ^ j)`-th root of unity). -/
theorem exists_roots_finset (j : ℕ) (hj : 1 ≤ j) (c : ℂ) (hc : c ≠ 0) :
    ∃ S : Finset ℂ, 2 * 3 ^ j ≤ S.card ∧
      ∀ μ ∈ S, (minpoly ℂ (c • quotientMulInvTwo j hj)).IsRoot μ := by
  obtain ⟨ω, hω⟩ : ∃ ω : ℂ, IsPrimitiveRoot ω (2 * 3 ^ j) :=
    ⟨_, Complex.isPrimitiveRoot_exp _ (by positivity)⟩
  refine ⟨(Finset.range (2 * 3 ^ j)).image (fun t => c * ω ^ t), ?_, ?_⟩
  · have hinj : Set.InjOn (fun t => c * ω ^ t) (Finset.range (2 * 3 ^ j) : Set ℕ) := by
      intro a ha b hb hab
      simp only [Finset.coe_range, Set.mem_Iio] at ha hb
      exact hω.pow_inj ha hb (mul_left_cancel₀ hc hab)
    exact ((Finset.card_image_of_injOn hinj).trans (Finset.card_range _)).ge
  · intro μ hμ
    obtain ⟨t, -, rfl⟩ := Finset.mem_image.mp hμ
    apply isRoot_minpoly_smul_quotientMulInvTwo j hj c
    rw [pow_right_comm, hω.pow_eq_one, one_pow]

/-- Roots bound the degree of the minimal polynomial. -/
theorem natDegree_minpoly_ge_of_roots {Q : Type*} [AddCommGroup Q] [Module ℂ Q]
    [FiniteDimensional ℂ Q] (T : Module.End ℂ Q) (S : Finset ℂ)
    (hroot : ∀ μ ∈ S, (minpoly ℂ T).IsRoot μ) : S.card ≤ (minpoly ℂ T).natDegree := by
  have hne : minpoly ℂ T ≠ 0 := minpoly.ne_zero (Algebra.IsIntegral.isIntegral T)
  calc S.card ≤ (minpoly ℂ T).roots.toFinset.card :=
        Finset.card_le_card (fun μ hμ => by
          rw [Multiset.mem_toFinset, Polynomial.mem_roots hne]
          exact hroot μ hμ)
    _ ≤ Multiset.card (minpoly ℂ T).roots := Multiset.toFinset_card_le _
    _ ≤ (minpoly ℂ T).natDegree := Polynomial.card_roots' _

/-- Degree squeeze: `T ^ N = c`, `dim = N` and `N` distinct roots of `minpoly T` force
`charpoly T = X ^ N - C c`. -/
theorem charpoly_eq_X_pow_sub_C_of_roots {Q : Type*} [AddCommGroup Q] [Module ℂ Q]
    [FiniteDimensional ℂ Q] (T : Module.End ℂ Q) {N : ℕ} (hN : N ≠ 0)
    (hdim : Module.finrank ℂ Q = N) (c : ℂ) (hann : aeval T (X ^ N - C c : ℂ[X]) = 0)
    (S : Finset ℂ) (hS : N ≤ S.card) (hroot : ∀ μ ∈ S, (minpoly ℂ T).IsRoot μ) :
    LinearMap.charpoly T = X ^ N - C c := by
  have hint : IsIntegral ℂ T := Algebra.IsIntegral.isIntegral T
  have hmon : (minpoly ℂ T).Monic := minpoly.monic hint
  have hdvd1 : minpoly ℂ T ∣ LinearMap.charpoly T := LinearMap.minpoly_dvd_charpoly T
  have hdvd2 : minpoly ℂ T ∣ X ^ N - C c := minpoly.dvd ℂ T hann
  have hdeg_char : (LinearMap.charpoly T).natDegree = N := by
    rw [LinearMap.charpoly_natDegree, hdim]
  have hle : (minpoly ℂ T).natDegree ≤ N := by
    have h := Polynomial.natDegree_le_of_dvd hdvd1 (LinearMap.charpoly_monic T).ne_zero
    rwa [hdeg_char] at h
  have hmin_deg : (minpoly ℂ T).natDegree = N :=
    le_antisymm hle (hS.trans (natDegree_minpoly_ge_of_roots T S hroot))
  have h1 : LinearMap.charpoly T = minpoly ℂ T :=
    Polynomial.eq_of_monic_of_dvd_of_natDegree_le hmon (LinearMap.charpoly_monic T) hdvd1
      (by rw [hdeg_char, hmin_deg])
  have h2 : (X ^ N - C c : ℂ[X]) = minpoly ℂ T :=
    Polynomial.eq_of_monic_of_dvd_of_natDegree_le hmon (monic_X_pow_sub_C c hN) hdvd2
      (by rw [natDegree_X_pow_sub_C, hmin_deg])
  rw [h1, ← h2]

/-- Lower bound (replaces the request's drafts, which stop at an unfinished case analysis):
`2 * 3 ^ j ≤ natDegree (minpoly Ā)`, from the `2 * 3 ^ j` distinct eigenvalues of `Ā`. -/
lemma degree_minpoly_quotientMulInvTwo_ge (j : ℕ) (hj : 1 ≤ j) :
    2 * 3 ^ j ≤ (minpoly ℂ (quotientMulInvTwo j hj)).natDegree := by
  obtain ⟨S, hS, hroot⟩ := exists_roots_finset j hj 1 one_ne_zero
  simp only [one_smul] at hroot
  exact hS.trans (natDegree_minpoly_ge_of_roots _ S hroot)

/-- Exact characteristic polynomial of `Ā`. -/
theorem charpoly_quotientMulInvTwo (j : ℕ) (hj : 1 ≤ j) :
    LinearMap.charpoly (quotientMulInvTwo j hj) = X ^ (2 * 3 ^ j) - C 1 := by
  obtain ⟨S, hS, hroot⟩ := exists_roots_finset j hj 1 one_ne_zero
  simp only [one_smul] at hroot
  exact charpoly_eq_X_pow_sub_C_of_roots _ (by positivity) (finrank_quotient_locallyConstant j)
    1 (aeval_quotientMulInvTwo_X_pow_sub_one j hj) S hS hroot

/-- Rescaling by `1 / 2`: the characteristic polynomial of the induced quotient operator of
`P_collatz_end (j + 1)` is `(1 / 2) ^ (2 * 3 ^ j) * ((2 * X) ^ (2 * 3 ^ j) - 1)`. -/
theorem charpoly_quotient_P_collatz (j : ℕ) (hj : 1 ≤ j) :
    LinearMap.charpoly
      (Submodule.mapQ (locallyConstantSubmodule j) (locallyConstantSubmodule j)
        (P_collatz_end (j + 1)) (P_collatz_end_le_comap j hj)) =
      C ((1 / 2 : ℂ) ^ (2 * 3 ^ j)) * ((C 2 * X) ^ (2 * 3 ^ j) - C 1) := by
  rw [quotient_P_collatz_eq_half_mulInvTwo j hj]
  change LinearMap.charpoly ((1 / 2 : ℂ) • quotientMulInvTwo j hj) = _
  obtain ⟨S, hS, hroot⟩ := exists_roots_finset j hj (1 / 2) (by norm_num)
  rw [charpoly_eq_X_pow_sub_C_of_roots _ (by positivity) (finrank_quotient_locallyConstant j)
    ((1 / 2 : ℂ) ^ (2 * 3 ^ j)) (aeval_smul_quotientMulInvTwo j hj (1 / 2)) S hS hroot]
  have key : C ((1 / 2 : ℂ) ^ (2 * 3 ^ j)) * (C 2 : ℂ[X]) ^ (2 * 3 ^ j) = 1 := by
    rw [← C_pow, ← C_mul, ← mul_pow]
    norm_num
  rw [C_1]
  linear_combination (-X ^ (2 * 3 ^ j) : ℂ[X]) * key

/-! #### Base case `j = 1` (the truncated part of the request, completed)

The request's base case computed a `3 × 3` determinant over `Pi.basisFun ℂ (ZMod 3)`; it was cut off
inside the entry list. It is replaced here by the same eigenvalue squeeze as above: `P_collatz 1` has
the three distinct eigenvalues `1, 1/2, -1/2` (eigenfunctions `const 1`, `oneZeroC 1`, `gWitnessC`
from Section 6) on a `3`-dimensional space, so its characteristic polynomial is
`(X - 1)(X - 1/2)(X + 1/2) = (X - 1) · (1/4) ((2X)^2 - 1)` (the matrix
`[[1/2, 0, 1/2], [0, 0, 1], [0, 1/2, 1/2]]` of the request gives the same polynomial). -/

/-- Three distinct roots of `minpoly T` in dimension `3` determine `charpoly T`. -/
theorem charpoly_eq_of_three_roots {Q : Type*} [AddCommGroup Q] [Module ℂ Q]
    [FiniteDimensional ℂ Q] (T : Module.End ℂ Q) (hdim : Module.finrank ℂ Q = 3)
    {a b c : ℂ} (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (ha : (minpoly ℂ T).IsRoot a) (hb : (minpoly ℂ T).IsRoot b) (hc : (minpoly ℂ T).IsRoot c) :
    LinearMap.charpoly T = (X - C a) * (X - C b) * (X - C c) := by
  have hcop : ∀ {x y : ℂ}, x ≠ y → IsCoprime (X - C x) (X - C y) := fun hxy =>
    Polynomial.isCoprime_X_sub_C_of_isUnit_sub (sub_ne_zero.mpr hxy).isUnit
  have hdvd : (X - C a) * (X - C b) * (X - C c) ∣ minpoly ℂ T := by
    apply IsCoprime.mul_dvd (IsCoprime.mul_left (hcop hac) (hcop hbc))
    · exact IsCoprime.mul_dvd (hcop hab) (dvd_iff_isRoot.mpr ha) (dvd_iff_isRoot.mpr hb)
    · exact dvd_iff_isRoot.mpr hc
  have hmon : ((X - C a) * (X - C b) * (X - C c)).Monic :=
    ((monic_X_sub_C a).mul (monic_X_sub_C b)).mul (monic_X_sub_C c)
  have hdeg : ((X - C a) * (X - C b) * (X - C c)).natDegree = 3 := by
    rw [((monic_X_sub_C a).mul (monic_X_sub_C b)).natDegree_mul (monic_X_sub_C c),
      (monic_X_sub_C a).natDegree_mul (monic_X_sub_C b), natDegree_X_sub_C, natDegree_X_sub_C,
      natDegree_X_sub_C]
  have hcp : (LinearMap.charpoly T).natDegree = 3 := by
    rw [LinearMap.charpoly_natDegree, hdim]
  exact Polynomial.eq_of_monic_of_dvd_of_natDegree_le hmon (LinearMap.charpoly_monic T)
    (hdvd.trans (LinearMap.minpoly_dvd_charpoly T)) (by rw [hcp, hdeg])

/-- Base case: `charpoly (P_collatz_end 1) = (X - 1) * ((1/2)^2 * ((2X)^2 - 1))`. -/
theorem charpoly_P_collatz_one :
    LinearMap.charpoly (P_collatz_end 1) =
      (X - C 1) * (C ((1 / 2 : ℂ) ^ (2 * 3 ^ (1 - 1))) *
        ((C 2 * X) ^ (2 * 3 ^ (1 - 1)) - C 1)) := by
  have hdim : Module.finrank ℂ (ZMod (3 ^ 1) → ℂ) = 3 := by
    simp [Module.finrank_pi, ZMod.card]
  have h1 : (minpoly ℂ (P_collatz_end 1)).IsRoot 1 := by
    refine isRoot_minpoly_of_eigenvector _ (q := fun _ => (1 : ℂ))
      (fun h => one_ne_zero (congrFun h 0)) ?_
    funext v
    rw [P_collatz_end_apply, const_one_is_one_eigenfunction, Pi.smul_apply, smul_eq_mul]
  have h2 : (minpoly ℂ (P_collatz_end 1)).IsRoot (1 / 2) := by
    refine isRoot_minpoly_of_eigenvector _ (q := oneZeroC 1) ?_ ?_
    · intro h
      have h0 := congrFun h 0
      simp [oneZeroC] at h0
    · funext v
      rw [P_collatz_end_apply, oneZeroC_is_plus_half_eigenfunction 1 le_rfl, Pi.smul_apply,
        smul_eq_mul]
  have h3 : (minpoly ℂ (P_collatz_end 1)).IsRoot (-1 / 2) := by
    refine isRoot_minpoly_of_eigenvector _ (q := gWitnessC) ?_ ?_
    · intro h
      have h0 := congrFun h 0
      norm_num [gWitnessC] at h0
    · funext v
      rw [P_collatz_end_apply, gWitnessC_is_minus_half_eigenfunction, Pi.smul_apply, smul_eq_mul]
  rw [charpoly_eq_of_three_roots _ hdim (by norm_num) (by norm_num) (by norm_num) h1 h2 h3]
  have e : 2 * 3 ^ (1 - 1) = 2 := by norm_num
  have hneg : (C (-1 / 2 : ℂ) : ℂ[X]) = -C (1 / 2) := by
    rw [show (-1 / 2 : ℂ) = -(1 / 2) by ring, C_neg]
  have hkey : (C 2 : ℂ[X]) * C (1 / 2) = 1 := by
    rw [← C_mul]
    norm_num
  rw [e, hneg, C_pow, C_1]
  linear_combination (-(X - 1) * X ^ 2 * (1 + C 2 * C (1 / 2 : ℂ)) : ℂ[X]) * hkey

/-! #### Inductive step -/

/-- The restriction of `P_collatz_end (j + 1)` to `W_j` is conjugate to `P_collatz_end j`. -/
theorem charpoly_restrict_P_collatz_end (j : ℕ) (hj : 1 ≤ j) :
    LinearMap.charpoly ((P_collatz_end (j + 1)).restrict (P_collatz_end_le_comap j hj)) =
      LinearMap.charpoly (P_collatz_end j) := by
  have hconj : (P_collatz_end (j + 1)).restrict (P_collatz_end_le_comap j hj) =
      (liftStepEquiv j).conj (P_collatz_end j) := by
    apply LinearMap.ext
    intro w
    obtain ⟨g, rfl⟩ := (liftStepEquiv j).surjective w
    apply Subtype.ext
    rw [LinearMap.restrict_coe_apply, LinearEquiv.conj_apply_apply,
      LinearEquiv.symm_apply_apply]
    exact P_collatz_intertwines_liftStep j hj g
  rw [hconj, LinearEquiv.charpoly_conj]

/-- General block-triangular split of the characteristic polynomial along an invariant
subspace `W ≤ V` over a field `K`: `χ_T = χ_{T|_W} * χ_{T mod W}`. Proof: choose a complement `U`
of `W`, identify `U ≃ V ⧸ W` through `mkQ`, and write `T` in the product basis of `W × U` as the
block upper-triangular matrix `fromBlocks M₁₁ M₁₂ 0 M₂₂` (`Matrix.charpoly_fromBlocks_zero₂₁`). -/
theorem charpoly_restrict_mul_mapQ
    {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (W : Submodule K V) (T : Module.End K V) (hW : W ≤ W.comap T) :
    LinearMap.charpoly T =
      LinearMap.charpoly (T.restrict hW) *
      LinearMap.charpoly (Submodule.mapQ W W T hW) := by
  classical
  -- Choose a complement `U` of `W` so `↥W × ↥U ≃ₗ[K] V`
  obtain ⟨U, hWU⟩ := Submodule.exists_isCompl W
  let e : (↥W × ↥U) ≃ₗ[K] V := W.prodEquivOfIsCompl U hWU
  let T' : Module.End K (↥W × ↥U) := e.symm.conj T
  -- Conjugate `T` to `T'` on `↥W × ↥U`
  have hT_conj : LinearMap.charpoly T = LinearMap.charpoly T' := by
    have h : T = e.conj T' := by
      ext v
      simp [T', LinearEquiv.conj_apply]
    rw [h, LinearEquiv.charpoly_conj]
  -- Define the `(2,2)` compression `T₂₂ : End K ↥U` and show it is conjugate to `mapQ W W T hW`
  let T₂₂ : Module.End K ↥U :=
    (LinearMap.snd K ↥W ↥U).comp (T'.comp (LinearMap.inr K ↥W ↥U))
  let qLin : ↥U →ₗ[K] (V ⧸ W) := (Submodule.mkQ W).comp U.subtype
  have hq_bij : Function.Bijective qLin := by
    constructor
    · rw [← LinearMap.ker_eq_bot, eq_bot_iff]
      intro u hu
      rw [LinearMap.mem_ker, LinearMap.comp_apply, Submodule.mkQ_apply,
        Submodule.Quotient.mk_eq_zero, Submodule.coe_subtype] at hu
      have hmem : (u : V) ∈ W ⊓ U := ⟨hu, u.2⟩
      rw [hWU.inf_eq_bot, Submodule.mem_bot] at hmem
      exact Subtype.ext hmem
    · intro q
      obtain ⟨v, rfl⟩ := Submodule.Quotient.mk_surjective W q
      obtain ⟨⟨w, u⟩, hwu⟩ := e.surjective v
      refine ⟨u, ?_⟩
      have hv : v = (w : V) + (u : V) := by
        simpa [e, Submodule.coe_prodEquivOfIsCompl] using hwu.symm
      simp only [qLin, LinearMap.comp_apply, Submodule.mkQ_apply, Submodule.coe_subtype, hv]
      rw [Submodule.Quotient.mk_add,
        (Submodule.Quotient.mk_eq_zero W).mpr w.2, zero_add]
  let qEquiv : ↥U ≃ₗ[K] (V ⧸ W) := LinearEquiv.ofBijective qLin hq_bij
  have hT₂₂_conj : LinearMap.charpoly (Submodule.mapQ W W T hW) = LinearMap.charpoly T₂₂ := by
    have h : Submodule.mapQ W W T hW = qEquiv.conj T₂₂ := by
      -- `ext` here would reduce to `v : V` (quotient ext lemma), so take a quotient element instead
      apply LinearMap.ext
      intro q
      obtain ⟨u, rfl⟩ := qEquiv.surjective q
      -- Unfold `T' (0, u) = (w', u')`, so `T u = w' + u'`
      have h0 : e (0, u) = (u : V) := by
        simp [e, Submodule.coe_prodEquivOfIsCompl']
      have he_eq : e (T' (0, u)) = T (u : V) := by
        simp only [T', LinearEquiv.conj_apply, LinearMap.comp_apply, LinearEquiv.coe_coe,
          LinearEquiv.symm_symm, LinearEquiv.apply_symm_apply, h0]
      have hsplit : T (u : V) = ((T' (0, u)).1 : V) + ((T' (0, u)).2 : V) := by
        simpa [e, Submodule.coe_prodEquivOfIsCompl'] using he_eq.symm
      rw [LinearEquiv.conj_apply_apply, LinearEquiv.symm_apply_apply]
      simp only [qEquiv, LinearEquiv.ofBijective_apply, qLin, LinearMap.comp_apply,
        Submodule.mkQ_apply, Submodule.coe_subtype, Submodule.mapQ_apply, T₂₂,
        LinearMap.inr_apply, LinearMap.snd_apply]
      rw [hsplit, Submodule.Quotient.mk_add,
        (Submodule.Quotient.mk_eq_zero W).mpr (T' (0, u)).1.2, zero_add]
    rw [h, LinearEquiv.charpoly_conj]
  -- Pick finite bases for `↥W` and `↥U` and form the product basis on `↥W × ↥U`
  let bW := Module.finBasis K ↥W
  let bU := Module.finBasis K ↥U
  let bProd := bW.prod bU
  -- Helper: `T'` maps `(w, 0)` into `↥W × {0}` because `W` is `T`-invariant
  have hT'_inl : ∀ w : ↥W, T' (w, 0) = (T.restrict hW w, 0) := by
    intro w
    apply e.injective
    have h0 : e (w, 0) = (w : V) := by
      simp [e, Submodule.coe_prodEquivOfIsCompl']
    have h1 : e (T.restrict hW w, 0) = T (w : V) := by
      simp [e, Submodule.coe_prodEquivOfIsCompl', LinearMap.coe_restrict_apply]
    simp only [T', LinearEquiv.conj_apply, LinearMap.comp_apply, LinearEquiv.coe_coe,
      LinearEquiv.symm_symm, LinearEquiv.apply_symm_apply, h0, h1]
  -- Express `T'` as a block upper-triangular matrix `fromBlocks M₁₁ M₁₂ 0 M₂₂`
  let M₁₁ := LinearMap.toMatrix bW bW (T.restrict hW)
  let M₁₂ := LinearMap.toMatrix bU bW
    ((LinearMap.fst K ↥W ↥U).comp (T'.comp (LinearMap.inr K ↥W ↥U)))
  let M₂₂ := LinearMap.toMatrix bU bU T₂₂
  have hMat : LinearMap.toMatrix bProd bProd T' = Matrix.fromBlocks M₁₁ M₁₂ 0 M₂₂ := by
    ext i j
    rcases i with i | i <;> rcases j with j | j
    · simp [bProd, M₁₁, LinearMap.toMatrix_apply, hT'_inl]
    · simp [bProd, M₁₂, LinearMap.toMatrix_apply]
    · simp [bProd, LinearMap.toMatrix_apply, hT'_inl]
    · simp [bProd, M₂₂, T₂₂, LinearMap.toMatrix_apply]
  rw [hT_conj, hT₂₂_conj,
    ← LinearMap.charpoly_toMatrix T' bProd,
    ← LinearMap.charpoly_toMatrix (T.restrict hW) bW,
    ← LinearMap.charpoly_toMatrix T₂₂ bU,
    hMat, Matrix.charpoly_fromBlocks_zero₂₁]

/-- Block-triangular split along the invariant subspace `W_j = im (liftStep 3 j)`. -/
theorem charpoly_split_locallyConstant (j : ℕ) (hj : 1 ≤ j) :
    LinearMap.charpoly (P_collatz_end (j + 1)) =
      LinearMap.charpoly ((P_collatz_end (j + 1)).restrict (P_collatz_end_le_comap j hj)) *
      LinearMap.charpoly (Submodule.mapQ (locallyConstantSubmodule j) (locallyConstantSubmodule j)
        (P_collatz_end (j + 1)) (P_collatz_end_le_comap j hj)) :=
  charpoly_restrict_mul_mapQ (locallyConstantSubmodule j) (P_collatz_end (j + 1))
    (P_collatz_end_le_comap j hj)

/-- `ExactCharpolyStatement j` for all `j ≥ 1`. -/
theorem exact_charpoly_proved (j : ℕ) (hj : 1 ≤ j) : ExactCharpolyStatement j := by
  induction j, hj using Nat.le_induction with
  | base =>
    unfold ExactCharpolyStatement
    rw [Finset.Icc_self, Finset.prod_singleton]
    exact charpoly_P_collatz_one
  | succ j hj ih =>
    unfold ExactCharpolyStatement at ih ⊢
    rw [charpoly_split_locallyConstant j hj, charpoly_restrict_P_collatz_end j hj, ih,
      charpoly_quotient_P_collatz j hj, Finset.prod_Icc_succ_top (by omega : 1 ≤ j + 1)]
    simp only [Nat.add_sub_cancel]
    ring

end CharpolyCompleteProof

/-! ### Section 8: Module Summary & Master Unification Theorem

#### Non-Archimedean Wilson Tower, Block-Spin RG Fixed Point & Spectral Stability (`PadicWilsonBridge`)

This file unifies the 3-adic Collatz transfer operator tower `{P_collatz j}_{j ≥ 1}` with
discrete non-Archimedean Wilson lattice gauge observables (`PadicWilsonFamily 3 G`) and
block-spin renormalization group (RG) decimation (`rgMap`):

1. **Projective Tower & Locally Constant Observables (Sections 1–3):**
   Inflation `liftStep 3 j` embeds coarse observables `ZMod (3 ^ j) → ℂ` into fine observables
   `ZMod (3 ^ (j + 1)) → ℂ` as exact Bruhat–Schwartz test functions (`IsLocallyConstantAtLevel 3 j`),
   preserving normalized Haar expectations (`haarExpectation_liftStep`) and intertwining with
   the transfer operator (`P_collatz_intertwines_liftStep`).

2. **Continuum UV/IR Limit Bridge (Sections 4–5):**
   For any 3-adic `PadicWilsonFamily 3 G` whose 1-point gauge moment stabilizes at precision `3 ^ N₀`,
   `P_collatz`-evolved observables stabilize in the ultraviolet mesh limit (`padicWilson_collatz_uv_stabilized`),
   and eigenmodes of eigenvalue `λ` scale the continuum limit by `λ` (`padicWilson_collatz_eigenmode_limit`).

3. **Block-Spin RG Fixed Point & No Relevant Directions (Sections 6–7):**
   Under block-spin decimation `rgMap j T := downAvg 3 j ∘ T ∘ liftStep 3 j`, the Collatz family
   is an exact fixed point (`rgMap_fixed_point : rgMap j (P_collatz (j + 1)) = P_collatz j`).
   By induction on `j ≥ 1` (`spectrum_classification_proved`), every eigenvalue `λ ≠ 1` of
   `P_collatz j` has the form `(1 / 2) * ζ` with `ζ ^ (2 * 3 ^ (j - 1)) = 1`, hence `‖λ‖ = 1 / 2 < 1`
   (`no_relevant_directions`). Thus the Collatz RG fixed point has **no relevant directions**
   at any finite 3-adic precision. (Interpretation, not a theorem of this file: a
   decimation-compatible deformation `P_{j+1}(β)` would have to break intertwining to produce a
   gap of dimensional-transmutation type `1 - |λ₁| ~ 3⁻ʲ Λ_YM`.)
-/

/--
**Master Unification Theorem (`PadicWilsonBridge` → `CollatzTransferTower`):**
At every level `j ≥ 1`:
1. **RG Fixed Point:** Block-spin decimation sends `P_collatz (j + 1)` to `P_collatz j`.
2. **No Relevant Directions:** Every non-stationary eigenvalue `λ ≠ 1` of `P_collatz j`
   satisfies `‖λ‖ = 1 / 2` and is RG-irrelevant (`IsIrrelevantEigenvalue λ`).
3. **Wilson Continuum Limit:** For any 3-adic `PadicWilsonFamily 3 G` stabilized at scale `j`,
   the UV continuum limit (`N → ∞`) of a `P_collatz`-evolved eigenmode `g` with eigenvalue `λ`
   exists and equals `λ` times the coarse Wilson expectation of `g`.
-/
theorem collatz_padic_wilson_rg_unification
    {j : ℕ} (hj : 1 ≤ j) :
    -- (1) Exact block-spin RG fixed point across levels
    (rgMap j (P_collatz (j + 1)) = P_collatz j) ∧
    -- (2) Every non-stationary eigenmode at level `j` has `‖λ‖ = 1/2` and is RG-irrelevant
    (∀ (lam : ℂ) (f : ZMod (3 ^ j) → ℂ),
      P_collatz j f = lam • f → f ≠ 0 → lam ≠ 1 →
      ‖lam‖ = 1 / 2 ∧ IsIrrelevantEigenvalue lam) ∧
    -- (3) Continuum UV limit of 1-point Wilson expectations scales by `λ`
    (∀ {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
      (C : PadicWilsonFamily 3 G)
      (hir0 : C.irLevel 0 = 0)
      (huv : ∀ N, C.uvLevel N = N)
      (v : Fin 1 → C.Token)
      (M₀ : ZMod (3 ^ j) → ℂ)
      (hM : ∀ (N : ℕ) (hN : j ≤ N) (x : PadicPoints 1 3 (C.totalLevel N 0)),
        C.finiteMoment N 0 v x =
        embed1Pt (C.totalLevel N 0)
          (liftPow 3 (C.totalLevel N 0) j (by simp [PadicWilsonFamily.totalLevel, hir0, huv, hN]) M₀) x)
      (g : ZMod (3 ^ j) → ℂ) (lam : ℂ)
      (heig : ∀ u : ZMod (3 ^ j), P_collatz j g u = lam * g u),
      let t : ∀ N, PadicPoints 1 3 (C.totalLevel N 0) → ℂ := fun N =>
        if hN : j ≤ N then
          embed1Pt (C.totalLevel N 0)
            (P_collatz (C.totalLevel N 0)
              (liftPow 3 (C.totalLevel N 0) j
                (by simp [PadicWilsonFamily.totalLevel, hir0, huv, hN]) g))
        else 0
      Filter.Tendsto (fun N => C.smear N 0 v (t N)) Filter.atTop
        (nhds (lam * C.smear j 0 v (embed1Pt (C.totalLevel j 0)
          (liftPow 3 (C.totalLevel j 0) j (by simp [PadicWilsonFamily.totalLevel, hir0, huv]) g))))) := by
  refine ⟨rgMap_fixed_point j hj, ?_, ?_⟩
  · intro lam f hP hf hne
    have hnorm := no_relevant_directions hj hP hf hne
    refine ⟨hnorm, ?_⟩
    unfold IsIrrelevantEigenvalue
    rw [hnorm]
    norm_num
  · intro G _ _ _ C hir0 huv v M₀ hM g lam heig
    exact padicWilson_collatz_eigenmode_limit C hir0 huv j hj v M₀ hM g lam heig

/-! ### Section 9: Finite-Adelic Wilson Product & Multi-Prime Stabilization (combined file v4)

Extends `PadicWilsonFamily` from a single prime `p` to a finite set of non-Archimedean
places `S : Finset ℕ` (a restricted adelic product `∏_{p ∈ S} ℤ_p^4`).
Pure-tensor adelic observables factorize as Euler products of local smeared correlators,
preserving ultraviolet mesh stabilization (`adelic_uv_smear_tendsto`), ordered double-limit
convergence (`adelic_converges_of_stabilized`), and local `P_collatz` eigenmode scaling at
the `p = 3` place (`adelic_collatz_place_unification`). Everything here is a finite product of
the single-prime results of Sections 4–5 and 7; no new analytic input.
-/

section AdelicExtension

open Filter Topology

/--
**Finite-Adelic Wilson Family (`AdelicWilsonFamily S G`):**
A collection of local `p`-adic Wilson lattice gauge families indexed by a finite set of
primes `S : Finset ℕ` over a shared compact gauge group `G`.
-/
structure AdelicWilsonFamily (S : Finset ℕ) (G : Type*) [Group G]
    [TopologicalSpace G] [MeasurableSpace G] where
  primeFact : ∀ p ∈ S, Fact (Nat.Prime p)
  localFamily : ∀ (p : ℕ) (hp : p ∈ S),
    @PadicWilsonFamily p (primeFact p hp) G _ _ _

namespace AdelicWilsonFamily

variable {S : Finset ℕ} {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
  (A : AdelicWilsonFamily S G)

/-- Local prime instance at a place `p ∈ S`. -/
def instPrime (p : ℕ) (hp : p ∈ S) : Fact (Nat.Prime p) :=
  A.primeFact p hp

/-- Token type of the local family at `p ∈ S`, with the prime instance of `A` supplied explicitly
(dot notation `(A.localFamily p hp).Token` would have to synthesize `Fact (Nat.Prime p)`). -/
abbrev LocalToken (p : ℕ) (hp : p ∈ S) : Type :=
  @PadicWilsonFamily.Token p (A.primeFact p hp) G _ _ _ (A.localFamily p hp)

/-- Total `p`-adic precision at place `p ∈ S`, UV index `N`, and IR index `k`. -/
abbrev localTotalLevel (p : ℕ) (hp : p ∈ S) (N k : ℕ) : ℕ :=
  @PadicWilsonFamily.totalLevel p (A.primeFact p hp) G _ _ _ (A.localFamily p hp) N k

/--
**Factorized Adelic Smeared Correlator (`adelicSmear`):**
Given local token labels `v p` and pure-tensor test observables `t p` at each place
`p ∈ S`, the finite-adelic smeared expectation is the Euler product over `p ∈ S` of the
local smeared correlators.
-/
noncomputable def adelicSmear (N k : ℕ) {n : ℕ}
    (v : ∀ (p : ℕ) (hp : p ∈ S), Fin n → A.LocalToken p hp)
    (t : ∀ (p : ℕ) (hp : p ∈ S), PadicPoints n p (A.localTotalLevel p hp N k) → ℂ) : ℂ :=
  ∏ p ∈ S.attach,
    @PadicWilsonFamily.smear p.1 (A.primeFact p.1 p.2) G _ _ _
      (A.localFamily p.1 p.2) N k n (v p.1 p.2) (t p.1 p.2)

/--
**Adelic UV Stabilization (`AdelicUVStabilizedAt`):**
An adelic test family `t` is UV-stabilized at local scales `N₀ : ∀ p ∈ S, ℕ` (for IR ball
`k` and labels `v`) if every local component `t p hp` is `UVStabilizedAt (N₀ p hp) k`.
-/
def AdelicUVStabilizedAt (N₀ : ∀ (p : ℕ) (hp : p ∈ S), ℕ) (k : ℕ) {n : ℕ}
    (v : ∀ (p : ℕ) (hp : p ∈ S), Fin n → A.LocalToken p hp)
    (t : ∀ (p : ℕ) (hp : p ∈ S) (N : ℕ), PadicPoints n p (A.localTotalLevel p hp N k) → ℂ) :
    Prop :=
  ∀ (p : ℕ) (hp : p ∈ S),
    @PadicWilsonFamily.UVStabilizedAt p (A.primeFact p hp) G _ _ _
      (A.localFamily p hp) (N₀ p hp) k n (v p hp) (t p hp)

/--
**Adelic Ultraviolet Mesh Stabilization (Exact Constancy for Large `N`):**
When every place `p ∈ S` is UV-stabilized at scale `N₀ p hp`, the Euler product
`A.adelicSmear N k v (fun p hp => t p hp N)` is eventually constant (for `N ≥ max_{p ∈ S} N₀ p hp`)
and equals the product of the local expectations at the local stabilization scales.
-/
theorem adelic_uv_smear_eventually_constant
    (N₀ : ∀ (p : ℕ) (hp : p ∈ S), ℕ) (k : ℕ) {n : ℕ}
    (v : ∀ (p : ℕ) (hp : p ∈ S), Fin n → A.LocalToken p hp)
    (t : ∀ (p : ℕ) (hp : p ∈ S) (N : ℕ), PadicPoints n p (A.localTotalLevel p hp N k) → ℂ)
    (hstab : A.AdelicUVStabilizedAt N₀ k v t) :
    ∀ᶠ N : ℕ in atTop,
      A.adelicSmear N k v (fun p hp => t p hp N) =
      ∏ p ∈ S.attach,
        @PadicWilsonFamily.smear p.1 (A.primeFact p.1 p.2) G _ _ _
          (A.localFamily p.1 p.2) (N₀ p.1 p.2) k n (v p.1 p.2) (t p.1 p.2 (N₀ p.1 p.2)) := by
  have h_each : ∀ p ∈ S.attach, ∀ᶠ N : ℕ in atTop,
      @PadicWilsonFamily.smear p.1 (A.primeFact p.1 p.2) G _ _ _
        (A.localFamily p.1 p.2) N k n (v p.1 p.2) (t p.1 p.2 N) =
      @PadicWilsonFamily.smear p.1 (A.primeFact p.1 p.2) G _ _ _
        (A.localFamily p.1 p.2) (N₀ p.1 p.2) k n (v p.1 p.2) (t p.1 p.2 (N₀ p.1 p.2)) := by
    intro p _
    letI : Fact (Nat.Prime p.1) := A.primeFact p.1 p.2
    exact (A.localFamily p.1 p.2).uv_smear_eventually_constant
      (N₀ p.1 p.2) k (v p.1 p.2) (t p.1 p.2) (hstab p.1 p.2)
  have h_all := (Filter.eventually_all_finset S.attach).mpr h_each
  refine h_all.mono fun N hN => ?_
  unfold adelicSmear
  exact Finset.prod_congr rfl (fun p hp => hN p hp)

/--
**Adelic Continuum UV Limit Theorem (`Tendsto` as `N → ∞`):**
For any UV-stabilized finite-adelic test family, the continuum limit `lim_{N → ∞} A.adelicSmear`
exists and equals the Euler product of the stabilized local expectations.
-/
theorem adelic_uv_smear_tendsto
    (N₀ : ∀ (p : ℕ) (hp : p ∈ S), ℕ) (k : ℕ) {n : ℕ}
    (v : ∀ (p : ℕ) (hp : p ∈ S), Fin n → A.LocalToken p hp)
    (t : ∀ (p : ℕ) (hp : p ∈ S) (N : ℕ), PadicPoints n p (A.localTotalLevel p hp N k) → ℂ)
    (hstab : A.AdelicUVStabilizedAt N₀ k v t) :
    Tendsto (fun N => A.adelicSmear N k v (fun p hp => t p hp N)) atTop
      (nhds (∏ p ∈ S.attach,
        @PadicWilsonFamily.smear p.1 (A.primeFact p.1 p.2) G _ _ _
          (A.localFamily p.1 p.2) (N₀ p.1 p.2) k n (v p.1 p.2) (t p.1 p.2 (N₀ p.1 p.2)))) :=
  tendsto_const_nhds.congr'
    (Eventually.mono (A.adelic_uv_smear_eventually_constant N₀ k v t hstab) fun _ h => h.symm)

/--
**Adelic Ordered Double Limit (`adelic_converges_of_stabilized`):**
If every place `p ∈ S` is UV/IR-stabilized at `(N₀ p hp, k₀ p hp)` (`IRStabilizedAt`), then for
every strictly increasing `volumeOrder : ℕ → ℕ`, each UV row `lim_{N → ∞} A.adelicSmear N p_ir`
exists, and the rows converge along `volumeOrder` to the Euler product at `(N₀, k₀)`.
-/
theorem adelic_converges_of_stabilized
    (N₀ k₀ : ∀ (p : ℕ) (hp : p ∈ S), ℕ)
    (volumeOrder : ℕ → ℕ) (hvol : StrictMono volumeOrder)
    {n : ℕ}
    (v : ∀ (p : ℕ) (hp : p ∈ S), Fin n → A.LocalToken p hp)
    (t : ∀ (p : ℕ) (hp : p ∈ S) (N k : ℕ),
      PadicPoints n p (A.localTotalLevel p hp N k) → ℂ)
    (h_stab : ∀ (p : ℕ) (hp : p ∈ S),
      @PadicWilsonFamily.IRStabilizedAt p (A.primeFact p hp) G _ _ _
        (A.localFamily p hp) (N₀ p hp) (k₀ p hp) n (v p hp) (t p hp)) :
    let row : ℕ → ℂ := fun p_ir =>
      ∏ p ∈ S.attach,
        @PadicWilsonFamily.smear p.1 (A.primeFact p.1 p.2) G _ _ _
          (A.localFamily p.1 p.2) (N₀ p.1 p.2) p_ir n (v p.1 p.2)
          (t p.1 p.2 (N₀ p.1 p.2) p_ir)
    (∀ p_ir : ℕ,
      Tendsto (fun N => A.adelicSmear N p_ir v (fun p hp => t p hp N p_ir))
        atTop (nhds (row p_ir))) ∧
    Tendsto (fun k => row (volumeOrder k)) atTop
      (nhds (∏ p ∈ S.attach,
        @PadicWilsonFamily.smear p.1 (A.primeFact p.1 p.2) G _ _ _
          (A.localFamily p.1 p.2) (N₀ p.1 p.2) (k₀ p.1 p.2) n (v p.1 p.2)
          (t p.1 p.2 (N₀ p.1 p.2) (k₀ p.1 p.2)))) := by
  intro row
  constructor
  · intro p_ir
    exact A.adelic_uv_smear_tendsto N₀ p_ir v (fun p hp N => t p hp N p_ir)
      (fun p hp => (h_stab p hp).1 p_ir)
  · apply tendsto_finset_prod
    intro p _
    letI : Fact (Nat.Prime p.1) := A.primeFact p.1 p.2
    exact (A.localFamily p.1 p.2).ir_row_tendsto
      (N₀ p.1 p.2) (k₀ p.1 p.2) volumeOrder hvol (v p.1 p.2) (t p.1 p.2) (h_stab p.1 p.2)

/--
**Adelic Collatz Place Unification (`adelic_collatz_place_unification`):**
Suppose `3 ∈ S` is an active place of `A : AdelicWilsonFamily S G` where the `3`-adic
factor `C₃ := A.localFamily 3 h3` has `irLevel 0 = 0`, `uvLevel N = N`, and 1-point gauge
moment induced by `M₀ : ZMod (3 ^ j) → ℂ` (`j ≥ 1`). For any non-zero eigenmode
`g : ZMod (3 ^ j) → ℂ` (`g ≠ 0`) of `P_collatz j` with eigenvalue `λ`, if all other
places `p ∈ S \ {3}` carry UV-stabilized observables, then:
1. `λ = 1` or `‖λ‖ = 1/2` (no RG-relevant directions at `p = 3`), and
2. Evolving the `3`-adic test observable by `P_collatz N` scales the `3`-adic factor of the
   finite-adelic UV continuum expectation by `λ`; the other places contribute their stabilized
   local expectations.
In the limit, the spectator product runs over `S.attach.erase ⟨3, h3⟩`; its `if p.1 = 3` branch
(value `1`) never occurs there and only supplies the proof of `p.1 ≠ 3` needed to call `t_other`.
-/
theorem adelic_collatz_place_unification
    (h3 : 3 ∈ S) {j : ℕ} (hj : 1 ≤ j)
    (v : ∀ (p : ℕ) (hp : p ∈ S), Fin 1 → A.LocalToken p hp)
    (hir0 : (A.localFamily 3 h3).irLevel 0 = 0)
    (huv3 : ∀ N, (A.localFamily 3 h3).uvLevel N = N)
    (M₀ : ZMod (3 ^ j) → ℂ)
    (hM3 : ∀ (N : ℕ) (hN : j ≤ N)
      (x : PadicPoints 1 3 ((A.localFamily 3 h3).totalLevel N 0)),
      (A.localFamily 3 h3).finiteMoment N 0 (v 3 h3) x =
      embed1Pt ((A.localFamily 3 h3).totalLevel N 0)
        (liftPow 3 ((A.localFamily 3 h3).totalLevel N 0) j
          (by simp [PadicWilsonFamily.totalLevel, hir0, huv3, hN]) M₀) x)
    (g : ZMod (3 ^ j) → ℂ) (hg : g ≠ 0) (lam : ℂ)
    (heig : ∀ u : ZMod (3 ^ j), P_collatz j g u = lam * g u)
    (N₀_other : ∀ (p : ℕ) (hp : p ∈ S), p ≠ 3 → ℕ)
    (t_other : ∀ (p : ℕ) (hp : p ∈ S) (hp3 : p ≠ 3) (N : ℕ),
      PadicPoints 1 p (A.localTotalLevel p hp N 0) → ℂ)
    (hstab_other : ∀ (p : ℕ) (hp : p ∈ S) (hp3 : p ≠ 3),
      @PadicWilsonFamily.UVStabilizedAt p (A.primeFact p hp) G _ _ _
        (A.localFamily p hp) (N₀_other p hp hp3) 0 1 (v p hp) (t_other p hp hp3)) :
    let t3 : ∀ N, PadicPoints 1 3 ((A.localFamily 3 h3).totalLevel N 0) → ℂ := fun N =>
      if hN : j ≤ N then
        embed1Pt ((A.localFamily 3 h3).totalLevel N 0)
          (P_collatz ((A.localFamily 3 h3).totalLevel N 0)
            (liftPow 3 ((A.localFamily 3 h3).totalLevel N 0) j
              (by simp [PadicWilsonFamily.totalLevel, hir0, huv3, hN]) g))
      else 0
    let t_adelic : ∀ (p : ℕ) (hp : p ∈ S) (N : ℕ),
      PadicPoints 1 p (A.localTotalLevel p hp N 0) → ℂ := fun p hp N =>
      if hp3 : p = 3 then (by subst hp3; exact t3 N)
      else t_other p hp hp3 N
    (lam = 1 ∨ ‖lam‖ = 1 / 2) ∧
    Tendsto (fun N => A.adelicSmear N 0 v (fun p hp => t_adelic p hp N)) atTop
      (nhds ((lam *
        ((A.localFamily 3 h3).smear j 0 (v 3 h3)
          (embed1Pt ((A.localFamily 3 h3).totalLevel j 0)
            (liftPow 3 ((A.localFamily 3 h3).totalLevel j 0) j
              (by simp [PadicWilsonFamily.totalLevel, hir0, huv3]) g)))) *
        ∏ p ∈ S.attach.erase ⟨3, h3⟩,
          if hp3 : p.1 = 3 then (1 : ℂ) else
            @PadicWilsonFamily.smear p.1 (A.primeFact p.1 p.2) G _ _ _
              (A.localFamily p.1 p.2) (N₀_other p.1 p.2 hp3) 0 1 (v p.1 p.2)
              (t_other p.1 p.2 hp3 (N₀_other p.1 p.2 hp3)))) := by
  intro t3 t_adelic
  constructor
  · by_cases h1 : lam = 1
    · exact Or.inl h1
    · right
      exact no_relevant_directions hj
        (funext fun u => by rw [heig, Pi.smul_apply, smul_eq_mul]) hg h1
  · have hsplit : ∀ N : ℕ,
        A.adelicSmear N 0 v (fun p hp => t_adelic p hp N) =
        (@PadicWilsonFamily.smear 3 (A.primeFact 3 h3) G _ _ _
          (A.localFamily 3 h3) N 0 1 (v 3 h3) (t3 N)) *
        ∏ p ∈ S.attach.erase ⟨3, h3⟩,
          if hp3 : p.1 = 3 then (1 : ℂ) else
            @PadicWilsonFamily.smear p.1 (A.primeFact p.1 p.2) G _ _ _
              (A.localFamily p.1 p.2) N 0 1 (v p.1 p.2) (t_other p.1 p.2 hp3 N) := by
      intro N
      unfold adelicSmear
      rw [← Finset.mul_prod_erase S.attach _ (Finset.mem_attach S ⟨3, h3⟩)]
      congr 1
      -- (the `p = 3` factor `t_adelic 3 h3 N = t3 N` is closed by `congr 1` itself)
      · refine Finset.prod_congr rfl (fun p hp => ?_)
        have hp3 : p.1 ≠ 3 := fun h => (Finset.mem_erase.mp hp).1 (Subtype.ext h)
        rw [dif_neg hp3]
        simp only [t_adelic, dif_neg hp3]
    simp_rw [hsplit]
    apply Tendsto.mul
    · exact padicWilson_collatz_eigenmode_limit
        (A.localFamily 3 h3) hir0 huv3 j hj (v 3 h3) M₀ hM3 g lam heig
    · apply tendsto_finset_prod
      intro p _
      by_cases hp3 : p.1 = 3
      · simp only [dif_pos hp3]
        exact tendsto_const_nhds
      · simp only [dif_neg hp3]
        letI : Fact (Nat.Prime p.1) := A.primeFact p.1 p.2
        exact (A.localFamily p.1 p.2).uv_smear_tendsto
          (N₀_other p.1 p.2 hp3) 0 (v p.1 p.2) (t_other p.1 p.2 hp3)
          (hstab_other p.1 p.2 hp3)

end AdelicWilsonFamily

/-! ### Section 9b: Restricted Adelic Product Inductive Limit over Increasing Place Sets (combined file v5)

Models the full non-Archimedean restricted adelic product `𝔸_{ℚ,fin}` as an inductive
limit over a monotone sequence `S_seq : ℕ → Finset ℕ` (`S_1 ⊆ S_2 ⊆ ⋯`) of finite
sets of primes. When observables are unramified (normalized to local vacuum expectation `1`)
outside a finite support `S₀ : Finset ℕ` covered by some `S_seq m₀`, the finite-place
Euler products stabilize identically for all `m ≥ m₀` (`restricted_adelic_inductive_limit`).
`restricted_adelic_collatz_unification` places the `P_collatz`-evolved observable at `p = 3`.
As in Section 9, these are finite products of the single-prime results: the limit over `m` is
reached at the finite stage `m₀`, by hypothesis.
-/

/--
**Global Non-Archimedean Wilson Family (`GlobalAdelicWilsonFamily G`):**
Assigns a local `p`-adic Wilson lattice gauge family to every prime `p : ℕ`
(`[Fact (Nat.Prime p)]`), modeling the full place-indexed family over `𝔸_{ℚ,fin}`.
-/
structure GlobalAdelicWilsonFamily (G : Type*) [Group G]
    [TopologicalSpace G] [MeasurableSpace G] where
  localAt : ∀ (p : ℕ) [Fact (Nat.Prime p)], PadicWilsonFamily p G

namespace GlobalAdelicWilsonFamily

variable {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
  (Ω : GlobalAdelicWilsonFamily G)

/-- Total `p`-adic precision at prime `p` (`[Fact (Nat.Prime p)]`), UV index `N`, and IR index `k`. -/
abbrev totalAt (p : ℕ) [Fact (Nat.Prime p)] (N k : ℕ) : ℕ :=
  (Ω.localAt p).totalLevel N k

/-- Restriction of a global family `Ω` to a finite set of primes `S : Finset ℕ`. -/
def restrictTo (S : Finset ℕ) (hS : ∀ p ∈ S, Fact (Nat.Prime p)) :
    AdelicWilsonFamily S G where
  primeFact := hS
  localFamily p hp := letI : Fact (Nat.Prime p) := hS p hp; Ω.localAt p

/--
**Truncated Restricted-Adelic Smeared Correlator (`restrictedSmear S`):**
Evaluates the Euler product of local smeared correlators over a finite set of primes
`S : Finset ℕ` (implicitly taking the unramified vacuum factor `1` at all `p ∉ S`).
The local test observables `t p` are at the given UV/IR indices `N, k`, as in `adelicSmear`.
-/
noncomputable def restrictedSmear (S : Finset ℕ) (hS : ∀ p ∈ S, Fact (Nat.Prime p))
    (N k : ℕ) {n : ℕ}
    (v : ∀ (p : ℕ) [Fact (Nat.Prime p)], Fin n → (Ω.localAt p).Token)
    (t : ∀ (p : ℕ) [Fact (Nat.Prime p)], PadicPoints n p (Ω.totalAt p N k) → ℂ) : ℂ :=
  ∏ p ∈ S.attach,
    letI : Fact (Nat.Prime p.1) := hS p.1 p.2
    (Ω.localAt p.1).smear N k (v p.1) (t p.1)

/--
**Restricted Adelic Vacuum Normalization (`IsUnramifiedAt`):**
A global observable `(v, t)` is unramified at prime `p` (at IR scale `k` and UV threshold
`N₀`) if it is UV-stabilized at `N₀` and its stabilized local smeared expectation equals `1`.
-/
def IsUnramifiedAt (p : ℕ) [Fact (Nat.Prime p)] (N₀ k : ℕ) {n : ℕ}
    (v : Fin n → (Ω.localAt p).Token)
    (t : ∀ N : ℕ, PadicPoints n p (Ω.totalAt p N k) → ℂ) : Prop :=
  (Ω.localAt p).UVStabilizedAt N₀ k v t ∧
  (Ω.localAt p).smear N₀ k v (t N₀) = 1

/--
**Restricted Adelic Stabilization Hypothesis (`RestrictedAdelicStabilizedAt S₀`):**
A global observable `(v, t)` is supported on a finite ramification set `S₀ : Finset ℕ`
(at IR ball `k`) if every prime `p` (`Fact (Nat.Prime p)`) is UV-stabilized at some scale
`N₀ p`, and every unramified prime `p ∉ S₀` has normalized vacuum expectation `1`.
-/
def RestrictedAdelicStabilizedAt (S₀ : Finset ℕ)
    (N₀ : ∀ (p : ℕ) [Fact (Nat.Prime p)], ℕ) (k : ℕ) {n : ℕ}
    (v : ∀ (p : ℕ) [Fact (Nat.Prime p)], Fin n → (Ω.localAt p).Token)
    (t : ∀ (p : ℕ) [Fact (Nat.Prime p)] (N : ℕ),
      PadicPoints n p (Ω.totalAt p N k) → ℂ) : Prop :=
  (∀ (p : ℕ) [Fact (Nat.Prime p)],
    (Ω.localAt p).UVStabilizedAt (N₀ p) k (v p) (t p)) ∧
  (∀ (p : ℕ) [Fact (Nat.Prime p)], p ∉ S₀ →
    (Ω.localAt p).smear (N₀ p) k (v p) (t p (N₀ p)) = 1)

/-- A prime-indexed quantity extended by `1` to non-primes. Used to compare Euler products over
different place sets: its value at a prime does not depend on which `Fact` proof is used. -/
noncomputable def primeValue (F : ∀ (p : ℕ) [Fact (Nat.Prime p)], ℂ) (p : ℕ) : ℂ :=
  if hp : Nat.Prime p then @F p ⟨hp⟩ else 1

theorem primeValue_eq (F : ∀ (p : ℕ) [Fact (Nat.Prime p)], ℂ) (p : ℕ)
    [inst : Fact (Nat.Prime p)] : primeValue F p = @F p inst := by
  rw [primeValue, dif_pos inst.out]

/-- An Euler product over `S.attach` with membership-supplied `Fact` instances is the product of
`primeValue F` over `S`. -/
theorem prod_attach_eq_prod_primeValue (S : Finset ℕ) (hS : ∀ p ∈ S, Fact (Nat.Prime p))
    (F : ∀ (p : ℕ) [Fact (Nat.Prime p)], ℂ) :
    (∏ p ∈ S.attach, @F p.1 (hS p.1 p.2)) = ∏ p ∈ S, primeValue F p := by
  rw [← Finset.prod_attach S (primeValue F)]
  refine Finset.prod_congr rfl (fun p _ => ?_)
  letI : Fact (Nat.Prime p.1) := hS p.1 p.2
  exact (primeValue_eq F p.1).symm

/--
**Inductive Limit over Increasing Finite Place Sets (`restricted_adelic_inductive_limit`):**
Let `S_seq : ℕ → Finset ℕ` be a monotone sequence of finite sets of primes (`Monotone S_seq`) with
`hPrime : ∀ m, ∀ p ∈ S_seq m, Fact (Nat.Prime p)`, and suppose `(v, t)` is restricted-adelic
stabilized outside `S₀ : Finset ℕ` (`RestrictedAdelicStabilizedAt S₀ N₀ k v t`).
If `S₀ ⊆ S_seq m₀` at some finite stage `m₀`, then:
1. For every stage `m : ℕ`, the continuum UV limit `row m := lim_{N → ∞} restrictedSmear (S_seq m)` exists.
2. For all `m ≥ m₀`, `row m` is identically equal to `target` (unramified places
   contribute `1` to the Euler product), so
3. `row m → target` as `m → ∞`.
-/
theorem restricted_adelic_inductive_limit
    (S_seq : ℕ → Finset ℕ) (hMono : Monotone S_seq)
    (hPrime : ∀ m, ∀ p ∈ S_seq m, Fact (Nat.Prime p))
    (S₀ : Finset ℕ) (m₀ : ℕ) (hCover : S₀ ⊆ S_seq m₀)
    (N₀ : ∀ (p : ℕ) [Fact (Nat.Prime p)], ℕ) (k : ℕ) {n : ℕ}
    (v : ∀ (p : ℕ) [Fact (Nat.Prime p)], Fin n → (Ω.localAt p).Token)
    (t : ∀ (p : ℕ) [Fact (Nat.Prime p)] (N : ℕ),
      PadicPoints n p (Ω.totalAt p N k) → ℂ)
    (hstab : Ω.RestrictedAdelicStabilizedAt S₀ N₀ k v t) :
    let row : ℕ → ℂ := fun m =>
      ∏ p ∈ (S_seq m).attach,
        letI : Fact (Nat.Prime p.1) := hPrime m p.1 p.2
        (Ω.localAt p.1).smear (N₀ p.1) k (v p.1) (t p.1 (N₀ p.1))
    let target : ℂ :=
      ∏ p ∈ (S_seq m₀).attach,
        if hp0 : p.1 ∈ S₀ then
          letI : Fact (Nat.Prime p.1) := hPrime m₀ p.1 p.2
          (Ω.localAt p.1).smear (N₀ p.1) k (v p.1) (t p.1 (N₀ p.1))
        else 1
    -- (1) At every finite stage `m`, the UV continuum limit `N → ∞` equals `row m`
    (∀ m : ℕ,
      Tendsto (fun (N : ℕ) => Ω.restrictedSmear (S_seq m) (hPrime m) N k v (fun p => t p N))
        atTop (nhds (row m))) ∧
    -- (2) For all `m ≥ m₀`, `row m` stabilizes identically to `target`
    (∀ m : ℕ, m₀ ≤ m → row m = target) ∧
    -- (3) The inductive limit `m → ∞` converges to `target`
    Tendsto row atTop (nhds target) := by
  intro row target
  let F : ∀ (p : ℕ) [Fact (Nat.Prime p)], ℂ := fun (p : ℕ) [Fact (Nat.Prime p)] =>
    (Ω.localAt p).smear (N₀ p) k (v p) (t p (N₀ p))
  have hrow : ∀ m, row m = ∏ p ∈ S_seq m, primeValue F p := fun m =>
    prod_attach_eq_prod_primeValue (S_seq m) (hPrime m) F
  have hvac : ∀ p, p ∉ S₀ → primeValue F p = 1 := by
    intro p hp
    unfold primeValue
    split_ifs with hpr
    · letI : Fact (Nat.Prime p) := ⟨hpr⟩
      exact hstab.2 p hp
    · rfl
  have htarget : target = ∏ p ∈ S₀, primeValue F p := by
    rw [Finset.prod_subset hCover (f := primeValue F) (fun p _ hp => hvac p hp),
      ← Finset.prod_attach (S_seq m₀) (primeValue F)]
    refine Finset.prod_congr rfl (fun p _ => ?_)
    split_ifs with hp0
    · letI : Fact (Nat.Prime p.1) := hPrime m₀ p.1 p.2
      exact (primeValue_eq F p.1).symm
    · exact (hvac p.1 hp0).symm
  have h_row_eq : ∀ m : ℕ, m₀ ≤ m → row m = target := by
    intro m hm
    rw [hrow m, htarget]
    exact (Finset.prod_subset (hCover.trans (Finset.le_iff_subset.mp (hMono hm)))
      (fun p _ hp => hvac p hp)).symm
  refine ⟨?_, h_row_eq, ?_⟩
  · intro m
    dsimp only [restrictedSmear, row]
    apply tendsto_finset_prod
    intro p _
    letI : Fact (Nat.Prime p.1) := hPrime m p.1 p.2
    exact (Ω.localAt p.1).uv_smear_tendsto (N₀ p.1) k (v p.1) (t p.1) (hstab.1 p.1)
  · exact tendsto_const_nhds.congr'
      (Filter.eventually_atTop.mpr ⟨m₀, fun m hm => (h_row_eq m hm).symm⟩)

/--
**Restricted Adelic Collatz Unification (`restricted_adelic_collatz_unification`):**
Combines the inductive place-set limit over `S_seq : ℕ → Finset ℕ` (`Monotone S_seq`) with
`P_collatz` eigenmode evolution at the active `3`-adic place (`3 ∈ S₀ ⊆ S_seq m₀`):
1. Every eigenvalue `λ ≠ 1` of `P_collatz j` (nonzero eigenmode `g`) satisfies `‖λ‖ = 1/2`.
2. `row m → target` as `m → ∞`.
3. For every stage `m ≥ m₀`, the UV continuum limit `lim_{N → ∞} restrictedSmear (S_seq m)`
   equals the same `target`.
The `3`-adic factor of `target` is the evolved observable `t3 j` at its stabilization scale `N = j`;
that it equals `λ` times the expectation of the lifted `g` is the computation in
`padicWilson_collatz_eigenmode_limit` (Section 5) and is not restated here.
-/
theorem restricted_adelic_collatz_unification
    (S_seq : ℕ → Finset ℕ) (hMono : Monotone S_seq)
    (hPrime : ∀ m, ∀ p ∈ S_seq m, Fact (Nat.Prime p))
    (S₀ : Finset ℕ) (h3 : 3 ∈ S₀) (m₀ : ℕ) (hCover : S₀ ⊆ S_seq m₀)
    {j : ℕ} (hj : 1 ≤ j)
    (v : ∀ (p : ℕ) [Fact (Nat.Prime p)], Fin 1 → (Ω.localAt p).Token)
    -- `3`-adic Collatz data
    (hir0 : (Ω.localAt 3).irLevel 0 = 0)
    (huv3 : ∀ N, (Ω.localAt 3).uvLevel N = N)
    (M₀ : ZMod (3 ^ j) → ℂ)
    (hM3 : ∀ (N : ℕ) (hN : j ≤ N) (x : PadicPoints 1 3 ((Ω.localAt 3).totalLevel N 0)),
      (Ω.localAt 3).finiteMoment N 0 (v 3) x =
      embed1Pt ((Ω.localAt 3).totalLevel N 0)
        (liftPow 3 ((Ω.localAt 3).totalLevel N 0) j
          (by simp [PadicWilsonFamily.totalLevel, hir0, huv3, hN]) M₀) x)
    (g : ZMod (3 ^ j) → ℂ) (hg : g ≠ 0) (lam : ℂ)
    (heig : ∀ u : ZMod (3 ^ j), P_collatz j g u = lam * g u)
    -- Spectator primes `p ≠ 3` (stabilized everywhere, vacuum-normalized outside `S₀`)
    (N₀_other : ∀ (p : ℕ) [Fact (Nat.Prime p)], p ≠ 3 → ℕ)
    (t_other : ∀ (p : ℕ) [Fact (Nat.Prime p)] (hp3 : p ≠ 3) (N : ℕ),
      PadicPoints 1 p (Ω.totalAt p N 0) → ℂ)
    (hstab_other : ∀ (p : ℕ) [Fact (Nat.Prime p)] (hp3 : p ≠ 3),
      (Ω.localAt p).UVStabilizedAt (N₀_other p hp3) 0 (v p) (t_other p hp3))
    (hvac_other : ∀ (p : ℕ) [Fact (Nat.Prime p)] (hp3 : p ≠ 3), p ∉ S₀ →
      (Ω.localAt p).smear (N₀_other p hp3) 0 (v p) (t_other p hp3 (N₀_other p hp3)) = 1) :
    let t3 : ∀ N, PadicPoints 1 3 (Ω.totalAt 3 N 0) → ℂ := fun N =>
      if hN : j ≤ N then
        embed1Pt ((Ω.localAt 3).totalLevel N 0)
          (P_collatz ((Ω.localAt 3).totalLevel N 0)
            (liftPow 3 ((Ω.localAt 3).totalLevel N 0) j
              (by simp [PadicWilsonFamily.totalLevel, hir0, huv3, hN]) g))
      else 0
    let t_global : ∀ (p : ℕ) [Fact (Nat.Prime p)] (N : ℕ),
      PadicPoints 1 p (Ω.totalAt p N 0) → ℂ := fun (p : ℕ) [Fact (Nat.Prime p)] N =>
      if hp3 : p = 3 then (by subst hp3; exact t3 N)
      else t_other p hp3 N
    let N₀_global : ∀ (p : ℕ) [Fact (Nat.Prime p)], ℕ := fun (p : ℕ) [Fact (Nat.Prime p)] =>
      if hp3 : p = 3 then j else N₀_other p hp3
    let row : ℕ → ℂ := fun m =>
      ∏ p ∈ (S_seq m).attach,
        letI : Fact (Nat.Prime p.1) := hPrime m p.1 p.2
        (Ω.localAt p.1).smear (N₀_global p.1) 0 (v p.1) (t_global p.1 (N₀_global p.1))
    let target : ℂ :=
      ∏ p ∈ (S_seq m₀).attach,
        if hp0 : p.1 ∈ S₀ then
          letI : Fact (Nat.Prime p.1) := hPrime m₀ p.1 p.2
          (Ω.localAt p.1).smear (N₀_global p.1) 0 (v p.1) (t_global p.1 (N₀_global p.1))
        else 1
    -- (1) No relevant RG directions at p = 3
    (lam = 1 ∨ ‖lam‖ = 1 / 2) ∧
    -- (2) Inductive limit over the place sets converges to target
    Tendsto row atTop (nhds target) ∧
    -- (3) At every stage m ≥ m₀, the UV continuum limit equals target
    (∀ m : ℕ, m₀ ≤ m →
      Tendsto (fun N => Ω.restrictedSmear (S_seq m) (hPrime m) N 0 v (fun p => t_global p N))
        atTop (nhds target)) := by
  intro t3 t_global N₀_global row target
  have h_global_stab : Ω.RestrictedAdelicStabilizedAt S₀ N₀_global 0 v t_global := by
    constructor
    · intro p hp
      by_cases hp3 : p = 3
      · subst hp3
        have hN3 : N₀_global 3 = j := dif_pos rfl
        have ht3_eq : t_global 3 = t3 := by
          funext N
          rfl
        rw [hN3, ht3_eq]
        exact (padicWilson_collatz_uv_stabilized
          (Ω.localAt 3) hir0 huv3 j hj (v 3) M₀ hM3 g).1
      · have hNp : N₀_global p = N₀_other p hp3 := dif_neg hp3
        have htp_eq : t_global p = t_other p hp3 := by
          funext N
          simp only [t_global, dif_neg hp3]
        rw [hNp, htp_eq]
        exact hstab_other p hp3
    · intro p hp hpS0
      have hp3 : p ≠ 3 := fun h => hpS0 (h ▸ h3)
      have hNp : N₀_global p = N₀_other p hp3 := dif_neg hp3
      have htp_eq : t_global p = t_other p hp3 := by
        funext N
        simp only [t_global, dif_neg hp3]
      rw [hNp, htp_eq]
      exact hvac_other p hp3 hpS0
  have h_lim := Ω.restricted_adelic_inductive_limit S_seq hMono hPrime S₀ m₀ hCover
    N₀_global 0 v t_global h_global_stab
  refine ⟨?_, h_lim.2.2, ?_⟩
  · by_cases h1 : lam = 1
    · exact Or.inl h1
    · right
      exact no_relevant_directions hj
        (funext fun u => by rw [heig, Pi.smul_apply, smul_eq_mul]) hg h1
  · intro m hm
    exact Eq.subst (motive := fun x => Tendsto
      (fun N => Ω.restrictedSmear (S_seq m) (hPrime m) N 0 v (fun p => t_global p N))
      atTop (nhds x)) (h_lim.2.1 m hm) (h_lim.1 m)

end GlobalAdelicWilsonFamily

end AdelicExtension

/-! ### Section 10: `p`-General Embeddings, Affine Transfer Families, and a 2-Point Bridge

Added in v6 (compiled with Lean 4.35.0 and Mathlib v4.35.0 as part of v22). Three generalizations of Section 5:
* `embed1` and `embed2` embed 1- and 2-variable observables through the Euclidean-time axis `0`
  for any prime `p`. Section 5's `embed1Pt` is `embed1` at `p = 3` (`embed1_three`).
* `affineTransfer p w₀ w₁ B₀ B₁` is any two-branch operator
  `f ↦ w₀ f(B₀ v) + w₁ f(B₁ v)` with affine branches `v ↦ u⁻¹ (c v + d)`. When each `u` is
  coprime to `p`, the family intertwines with inflation at every level (`affineTransfer_liftPow`,
  no `1 ≤ k` side condition). `P_collatz` is the case `p = 3`, weights `½, ½`
  (`affineTransfer_collatz_eq`). `sigmaOne7` is the `σ = 1` operator on `ℤ/7^l`
  (weights `¼, ¾`) studied numerically outside this file.
* The 2-point function is the time-ordered Green's function
  `greenFn p T l s A B = 𝔼_l[A · T_l^s B]` (normalized Haar pairing, `s` time steps).
  `greenFn_liftPow` proves it is exactly invariant under inflation from a coarse level.

Why the Wilson hypothesis is stated on the smeared observable. The physical kernel of
`greenFn` is the `s`-step transition kernel `P_l^s(a, b)`. At a fine level that kernel is not
pulled back from the coarse level; only its sums over fibers are (lumpability). So the
pointwise-moment condition `UVStabilizedAt` of Section 4 cannot hold for it. It would only accept
a product kernel `A(a) · (T^s B)(b)`, which is a disconnected correlator, not a Green's function.
The explicit transfer-matrix hypothesis `TwoPointTransferForm` therefore says: at every UV level
the smeared 2-point Wilson observable equals `greenFn` on the inflated insertions. Nothing in
this file derives that from a Wilson measure. For the operators of interest it cannot come from a
reflection-positive transfer matrix `e^{-H}`: `sigmaOne7` is non-normal and has a negative
eigenvalue (`≈ -0.804` at `l = 1`).

The gauge group `G` stays generic; `U(1)` is the case `G := Circle`, given the instances that the
structure `PadicWilsonFamily` requires.
-/

section TwoPointBridge

open Filter Topology

/-- Euclidean-time coordinate (axis `0`) of point `i` of an `n`-point configuration. -/
def timeCoord (p : ℕ) [Fact (Nat.Prime p)] {n l : ℕ} (x : PadicPoints n p l) (i : Fin n) :
    ZMod (p ^ l) :=
  x i 0

/-- `p`-general 1-point embedding of `φ : ZMod (p ^ l) → ℂ`. -/
def embed1 (p : ℕ) [Fact (Nat.Prime p)] (l : ℕ) (φ : ZMod (p ^ l) → ℂ)
    (x : PadicPoints 1 p l) : ℂ :=
  φ (timeCoord p x 0)

/-- At `p = 3`, `embed1` is Section 5's `embed1Pt`. -/
lemma embed1_three (l : ℕ) (φ : ZMod (3 ^ l) → ℂ) (x : PadicPoints 1 3 l) :
    embed1 3 l φ x = embed1Pt l φ x :=
  rfl

/-- 2-point embedding of a kernel `K` through the two time coordinates. -/
def embed2 (p : ℕ) [Fact (Nat.Prime p)] (l : ℕ) (K : ZMod (p ^ l) → ZMod (p ^ l) → ℂ)
    (x : PadicPoints 2 p l) : ℂ :=
  K (timeCoord p x 0) (timeCoord p x 1)

lemma timeCoord_projPoints (p : ℕ) [Fact (Nat.Prime p)] {n j k : ℕ} (hk : k ≤ j)
    (x : PadicPoints n p j) (i : Fin n) :
    timeCoord p (projPoints n p hk x) i = projPow p j k hk (timeCoord p x i) :=
  rfl

/-- `embed2` intertwines inflation of kernels with `projPoints`. -/
lemma embed2_inflate (p : ℕ) [Fact (Nat.Prime p)] {j k : ℕ} (hk : k ≤ j)
    (K : ZMod (p ^ k) → ZMod (p ^ k) → ℂ) (x : PadicPoints 2 p j) :
    embed2 p j (fun a b => K (projPow p j k hk a) (projPow p j k hk b)) x =
      embed2 p k K (projPoints 2 p hk x) :=
  rfl

lemma liftPow_self (p : ℕ) [Fact (Nat.Prime p)] (j : ℕ) (g : ZMod (p ^ j) → ℂ) :
    liftPow p j j (le_refl j) g = g := by
  funext v
  simp only [liftPow, LinearMap.coe_mk, AddHom.coe_mk, projPow_self]

/-- Inverses of integers coprime to `p` are compatible with the tower projections
(no `1 ≤ k` condition: at `k = 0` both sides live in `ZMod 1`). -/
lemma projPow_inv_natCast (p : ℕ) [Fact (Nat.Prime p)] {j k : ℕ} (hk : k ≤ j) {u : ℕ}
    (hu : Nat.Coprime u p) :
    projPow p j k hk ((u : ZMod (p ^ j))⁻¹) = (u : ZMod (p ^ k))⁻¹ := by
  have hunit : IsUnit (u : ZMod (p ^ j)) :=
    (ZMod.isUnit_iff_coprime u (p ^ j)).mpr (Nat.Coprime.pow_right j hu)
  have key : projPow p j k hk ((u : ZMod (p ^ j))⁻¹) * (u : ZMod (p ^ k)) = 1 := by
    rw [← map_natCast (projPow p j k hk) u, ← map_mul, ZMod.inv_mul_of_unit _ hunit, map_one]
  exact (ZMod.inv_eq_of_mul_eq_one _ _ _ (by rw [mul_comm]; exact key)).symm

/-- Affine branch data `v ↦ u⁻¹ (c v + d)`, read at every level `ZMod (p ^ l)`. -/
structure AffineBranch where
  u : ℕ
  c : ℤ
  d : ℤ

namespace AffineBranch

/-- The branch map at level `l`. -/
def apply (B : AffineBranch) (p l : ℕ) (v : ZMod (p ^ l)) : ZMod (p ^ l) :=
  ((B.u : ZMod (p ^ l)))⁻¹ * ((B.c : ZMod (p ^ l)) * v + (B.d : ZMod (p ^ l)))

/-- Branch maps commute with the tower projections when `u` is coprime to `p`. -/
lemma projPow_apply (B : AffineBranch) (p : ℕ) [Fact (Nat.Prime p)] (hu : Nat.Coprime B.u p)
    {j k : ℕ} (hk : k ≤ j) (v : ZMod (p ^ j)) :
    projPow p j k hk (B.apply p j v) = B.apply p k (projPow p j k hk v) := by
  simp only [apply, map_mul, map_add, map_intCast, projPow_inv_natCast p hk hu]

/-- Collatz even branch `v ↦ 2⁻¹ v`. -/
def even : AffineBranch := ⟨2, 1, 0⟩

/-- Collatz odd branch `v ↦ 2⁻¹ (3 v + 1)`. -/
def odd : AffineBranch := ⟨2, 3, 1⟩

end AffineBranch

/-- Two-branch affine transfer operator `f ↦ w₀ f(B₀ v) + w₁ f(B₁ v)` at level `l`. -/
noncomputable def affineTransfer (p : ℕ) (w₀ w₁ : ℂ) (B₀ B₁ : AffineBranch) (l : ℕ) :
    Module.End ℂ (ZMod (p ^ l) → ℂ) where
  toFun f v := w₀ * f (B₀.apply p l v) + w₁ * f (B₁.apply p l v)
  map_add' f g := by
    funext v
    simp only [Pi.add_apply]
    ring
  map_smul' c f := by
    funext v
    simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply]
    ring

lemma affineTransfer_apply (p : ℕ) (w₀ w₁ : ℂ) (B₀ B₁ : AffineBranch) (l : ℕ)
    (f : ZMod (p ^ l) → ℂ) (v : ZMod (p ^ l)) :
    affineTransfer p w₀ w₁ B₀ B₁ l f v = w₀ * f (B₀.apply p l v) + w₁ * f (B₁.apply p l v) :=
  rfl

/-- A level-indexed operator family intertwines with inflation. -/
def IntertwinesLift (p : ℕ) [Fact (Nat.Prime p)] (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) :
    Prop :=
  ∀ {j k : ℕ} (hk : k ≤ j) (g : ZMod (p ^ k) → ℂ),
    T j (liftPow p j k hk g) = liftPow p j k hk (T k g)

/-- **Affine intertwining.** With both `u`'s coprime to `p`, the affine family intertwines with
inflation at every pair of levels. -/
theorem affineTransfer_liftPow (p : ℕ) [Fact (Nat.Prime p)] (w₀ w₁ : ℂ) (B₀ B₁ : AffineBranch)
    (h₀ : Nat.Coprime B₀.u p) (h₁ : Nat.Coprime B₁.u p) :
    IntertwinesLift p (affineTransfer p w₀ w₁ B₀ B₁) := by
  intro j k hk g
  funext v
  simp only [affineTransfer_apply, liftPow, LinearMap.coe_mk, AddHom.coe_mk,
    B₀.projPow_apply p h₀ hk, B₁.projPow_apply p h₁ hk]

/-- Intertwining passes to powers. -/
theorem pow_liftPow_of_intertwines (p : ℕ) [Fact (Nat.Prime p)]
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (hT : IntertwinesLift p T)
    {j k : ℕ} (hk : k ≤ j) (s : ℕ) (g : ZMod (p ^ k) → ℂ) :
    (T j ^ s) (liftPow p j k hk g) = liftPow p j k hk ((T k ^ s) g) := by
  induction s with
  | zero => simp only [pow_zero, Module.End.one_apply]
  | succ s ih =>
    rw [pow_succ' (T j) s, Module.End.mul_apply, ih, hT hk, pow_succ' (T k) s,
      Module.End.mul_apply]

/-- `P_collatz` is the affine transfer operator at `p = 3` with weights `½, ½`. -/
theorem affineTransfer_collatz_eq (j : ℕ) (f : ZMod (3 ^ j) → ℂ) (v : ZMod (3 ^ j)) :
    affineTransfer 3 (1 / 2) (1 / 2) AffineBranch.even AffineBranch.odd j f v =
      P_collatz j f v := by
  simp [affineTransfer_apply, AffineBranch.apply, AffineBranch.even, AffineBranch.odd,
    P_collatz]

/-- The Collatz family at `p = 3` intertwines at every level (Section 5 needed `1 ≤ k`). -/
theorem collatz3_intertwines :
    IntertwinesLift 3 (affineTransfer 3 (1 / 2) (1 / 2) AffineBranch.even AffineBranch.odd) :=
  affineTransfer_liftPow 3 (1 / 2) (1 / 2) AffineBranch.even AffineBranch.odd (by decide) (by decide)

instance instFactPrimeSeven : Fact (Nat.Prime 7) := ⟨by norm_num⟩

/-- The `σ = 1` operator on `ℤ/7^l`: `f ↦ ¼ f(2⁻¹ v) + ¾ f(2⁻¹ (3 v + 1))`. -/
noncomputable def sigmaOne7 (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  affineTransfer 7 (1 / 4) (3 / 4) AffineBranch.even AffineBranch.odd l

theorem sigmaOne7_intertwines : IntertwinesLift 7 sigmaOne7 :=
  affineTransfer_liftPow 7 (1 / 4) (3 / 4) AffineBranch.even AffineBranch.odd (by decide) (by decide)

/-- Haar expectation is invariant under inflation from any coarser level. -/
theorem haarExpectation_liftPow (p : ℕ) [Fact (Nat.Prime p)] {j k : ℕ} (hk : k ≤ j)
    (g : ZMod (p ^ k) → ℂ) :
    haarExpectation p j (liftPow p j k hk g) = haarExpectation p k g := by
  induction hk with
  | refl => rw [liftPow_self]
  | @step j hkj ih =>
    have h2 : liftPow p (j + 1) j (Nat.le_succ j) = liftStep p j := by
      ext f v
      rfl
    have hcomp : liftPow p (j + 1) k (Nat.le_succ_of_le hkj) g =
        liftStep p j (liftPow p j k hkj g) := by
      rw [← h2]
      exact (LinearMap.congr_fun (liftPow_comp p hkj (Nat.le_succ j)) g).symm
    rw [hcomp, haarExpectation_liftStep, ih]

/-- **Time-ordered 2-point Green's function** of the family `T` at level `l`, with `s` time
steps between the insertions: `G_l(s; A, B) = 𝔼_l[A · T_l^s B]`. -/
noncomputable def greenFn (p : ℕ) [Fact (Nat.Prime p)]
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (l s : ℕ) (A B : ZMod (p ^ l) → ℂ) : ℂ :=
  haarExpectation p l (fun a => A a * (T l ^ s) B a)

/-- Connected part `G_l(s; A, B) - 𝔼_l[A] · 𝔼_l[B]`. -/
noncomputable def greenFnConn (p : ℕ) [Fact (Nat.Prime p)]
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (l s : ℕ) (A B : ZMod (p ^ l) → ℂ) : ℂ :=
  greenFn p T l s A B - haarExpectation p l A * haarExpectation p l B

/-- **Exact UV invariance of the 2-point function.** For an intertwining family, the Green's
function of inflated insertions equals the coarse Green's function, at every finer level. -/
theorem greenFn_liftPow (p : ℕ) [Fact (Nat.Prime p)]
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (hT : IntertwinesLift p T)
    {j k : ℕ} (hk : k ≤ j) (s : ℕ) (A B : ZMod (p ^ k) → ℂ) :
    greenFn p T j s (liftPow p j k hk A) (liftPow p j k hk B) = greenFn p T k s A B := by
  unfold greenFn
  rw [pow_liftPow_of_intertwines p T hT hk s B]
  have h : (fun a => liftPow p j k hk A a * liftPow p j k hk ((T k ^ s) B) a) =
      liftPow p j k hk (fun b => A b * (T k ^ s) B b) :=
    rfl
  rw [h, haarExpectation_liftPow]

theorem greenFnConn_liftPow (p : ℕ) [Fact (Nat.Prime p)]
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (hT : IntertwinesLift p T)
    {j k : ℕ} (hk : k ≤ j) (s : ℕ) (A B : ZMod (p ^ k) → ℂ) :
    greenFnConn p T j s (liftPow p j k hk A) (liftPow p j k hk B) =
      greenFnConn p T k s A B := by
  unfold greenFnConn
  rw [greenFn_liftPow p T hT hk s A B, haarExpectation_liftPow, haarExpectation_liftPow]

namespace PadicWilsonFamily

variable {p : ℕ} [Fact (Nat.Prime p)] {G : Type*} [Group G]
  [TopologicalSpace G] [MeasurableSpace G] (C : PadicWilsonFamily p G)

lemma totalLevel_mono (k : ℕ) {N₀ N : ℕ} (hN : N₀ ≤ N) :
    C.totalLevel N₀ k ≤ C.totalLevel N k :=
  Nat.add_le_add_left (C.uvStrict.monotone hN) (C.irLevel k)

/-- `p`-general 1-point test sequence: the `T`-evolved inflation of a coarse observable `g`. -/
noncomputable def onePointTest (k N₀ : ℕ) (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ))
    (g : ZMod (p ^ C.totalLevel N₀ k) → ℂ) : ∀ N, PadicPoints 1 p (C.totalLevel N k) → ℂ :=
  fun N => if hN : N₀ ≤ N then
    embed1 p (C.totalLevel N k) (T (C.totalLevel N k) (liftPow p _ _ (C.totalLevel_mono k hN) g))
  else 0

/-- **`p`-general 1-point bridge** (generalizes `padicWilson_collatz_uv_stabilized` to any prime,
any IR index `k`, and any intertwining family `T`). -/
theorem onePoint_transfer_uv_stabilized (k N₀ : ℕ) (v : Fin 1 → C.Token)
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (hT : IntertwinesLift p T)
    (M₀ g : ZMod (p ^ C.totalLevel N₀ k) → ℂ)
    (hM : ∀ (N : ℕ) (hN : N₀ ≤ N) (x : PadicPoints 1 p (C.totalLevel N k)),
      C.finiteMoment N k v x = embed1 p _ (liftPow p _ _ (C.totalLevel_mono k hN) M₀) x) :
    C.UVStabilizedAt N₀ k v (C.onePointTest k N₀ T g) ∧
      Tendsto (fun N => C.smear N k v (C.onePointTest k N₀ T g N)) atTop
        (nhds (C.smear N₀ k v (C.onePointTest k N₀ T g N₀))) := by
  have hstab : C.UVStabilizedAt N₀ k v (C.onePointTest k N₀ T g) := by
    refine ⟨fun r => embed1 p _ (T (C.totalLevel N₀ k) g) r, fun r => embed1 p _ M₀ r, ?_⟩
    intro N hN
    constructor
    · intro x
      simp only [onePointTest, dif_pos hN]
      rw [hT (C.totalLevel_mono k hN) g]
      rfl
    · intro x
      rw [hM N hN x]
      rfl
  exact ⟨hstab, C.uv_smear_tendsto N₀ k v _ hstab⟩

/-- **Transfer-matrix hypothesis for 2-point observables (explicit assumption).**
At every UV level `N ≥ N₀`, the smeared 2-point Wilson observable with test sequence `t` equals
the time-ordered Green's function of the family `T` at the total level, on the inflations of the
coarse insertions `A₀, B₀`, with `s` time steps between them. This is an assumption about the
Wilson measure; it is not derived here. -/
def TwoPointTransferForm (k N₀ : ℕ) (v : Fin 2 → C.Token)
    (t : ∀ N, PadicPoints 2 p (C.totalLevel N k) → ℂ)
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (s : ℕ)
    (A₀ B₀ : ZMod (p ^ C.totalLevel N₀ k) → ℂ) : Prop :=
  ∀ (N : ℕ) (hN : N₀ ≤ N),
    C.smear N k v (t N) =
      greenFn p T (C.totalLevel N k) s (liftPow p _ _ (C.totalLevel_mono k hN) A₀)
        (liftPow p _ _ (C.totalLevel_mono k hN) B₀)

/-- **2-point bridge.** Under the transfer-matrix hypothesis and intertwining, the smeared
2-point Wilson observable is eventually constant, equal to the coarse Green's function
`G_{L₀}(s; A₀, B₀)`, and this is its UV limit. -/
theorem twoPoint_transfer_limit (k N₀ : ℕ) (v : Fin 2 → C.Token)
    (t : ∀ N, PadicPoints 2 p (C.totalLevel N k) → ℂ)
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (hT : IntertwinesLift p T) (s : ℕ)
    (A₀ B₀ : ZMod (p ^ C.totalLevel N₀ k) → ℂ)
    (hTM : C.TwoPointTransferForm k N₀ v t T s A₀ B₀) :
    (∀ᶠ N in atTop, C.smear N k v (t N) = greenFn p T (C.totalLevel N₀ k) s A₀ B₀) ∧
      Tendsto (fun N => C.smear N k v (t N)) atTop
        (nhds (greenFn p T (C.totalLevel N₀ k) s A₀ B₀)) := by
  have hev : ∀ᶠ N in atTop, C.smear N k v (t N) = greenFn p T (C.totalLevel N₀ k) s A₀ B₀ := by
    rw [eventually_atTop]
    exact ⟨N₀, fun N hN => (hTM N hN).trans (greenFn_liftPow p T hT _ s A₀ B₀)⟩
  exact ⟨hev, tendsto_const_nhds.congr' (hev.mono fun _ h => h.symm)⟩

end PadicWilsonFamily

/-- **7-adic, `σ = 1` instance of the 2-point bridge.** -/
theorem twoPoint_sigmaOne7_limit {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
    (C : PadicWilsonFamily 7 G) (k N₀ : ℕ) (v : Fin 2 → C.Token)
    (t : ∀ N, PadicPoints 2 7 (C.totalLevel N k) → ℂ) (s : ℕ)
    (A₀ B₀ : ZMod (7 ^ C.totalLevel N₀ k) → ℂ)
    (hTM : C.TwoPointTransferForm k N₀ v t sigmaOne7 s A₀ B₀) :
    Tendsto (fun N => C.smear N k v (t N)) atTop
      (nhds (greenFn 7 sigmaOne7 (C.totalLevel N₀ k) s A₀ B₀)) :=
  (C.twoPoint_transfer_limit k N₀ v t sigmaOne7 sigmaOne7_intertwines s A₀ B₀ hTM).2

/-- **3-adic Collatz instance of the 2-point bridge** (`P_collatz`, weights `½, ½`). -/
theorem twoPoint_collatz3_limit {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
    (C : PadicWilsonFamily 3 G) (k N₀ : ℕ) (v : Fin 2 → C.Token)
    (t : ∀ N, PadicPoints 2 3 (C.totalLevel N k) → ℂ) (s : ℕ)
    (A₀ B₀ : ZMod (3 ^ C.totalLevel N₀ k) → ℂ)
    (hTM : C.TwoPointTransferForm k N₀ v t
      (affineTransfer 3 (1 / 2) (1 / 2) AffineBranch.even AffineBranch.odd) s A₀ B₀) :
    Tendsto (fun N => C.smear N k v (t N)) atTop
      (nhds (greenFn 3 (affineTransfer 3 (1 / 2) (1 / 2) AffineBranch.even AffineBranch.odd)
        (C.totalLevel N₀ k) s A₀ B₀)) :=
  (C.twoPoint_transfer_limit k N₀ v t _ collatz3_intertwines s A₀ B₀ hTM).2

end TwoPointBridge

/-! ### Section 11: Fiber Shells at `p = 7`: Orthogonality, `sigmaOne7`-Invariance, and the `p = 7` Spectator

Added in v7 from Notes A, with corrections (compiled with Lean 4.35.0 and Mathlib v4.35.0 as part of v22). For `1 ≤ i ≤ j`, the shell
`shellSubspace7 j i` is the set of inflations to level `j` of level-`i` functions whose sums over
every fiber of `ZMod (7 ^ i) → ZMod (7 ^ (i - 1))` vanish (these are the blocks `Kᵢ` of the
manuscript). This section proves:
* distinct shells are orthogonal for the standard Hermitian inner product, and every shell is
  orthogonal to the constants (`shellSubspace7_orthogonal`, `shellSubspace7_orthogonal_const_one`);
* every shell is invariant under the `σ = 1` operator `sigmaOne7`
  (`shellSubspace7_sigmaOne7_invariant`), because both branches are bijections compatible with
  the tower projections. This fails at `p = 3`, where the odd branch is not injective;
* the `p = 7` components of the spectator hypotheses `hstab_other` and `hvac_other` of
  `restricted_adelic_collatz_unification` (Section 9b), packaged as `IsUnramifiedAt` for a
  constant test observable (`prime7_isUnramifiedAt`). These use only inflation and a
  normalization hypothesis on the gauge moment, not the orthogonality.
Spanning and the dimension count are proved at the end of this section (added in v8, Notes B).
-/

section PrimeSevenShells

open Finset BigOperators Filter Topology

/-- Hermitian inner product `⟪f, g⟫ = ∑ v, star (f v) * g v` on `ZMod (7 ^ j) → ℂ`. -/
noncomputable def sevenInner (j : ℕ) (f g : ZMod (7 ^ j) → ℂ) : ℂ :=
  ∑ v : ZMod (7 ^ j), star (f v) * g v

/-- Fiber-vanishing at level `i ≥ 1`: `g` sums to zero over every fiber of
`projPow 7 i (i - 1)` (equivalently, its fiber average `downAvg` vanishes). -/
def IsFiberVanishing7 (i : ℕ) (_hi : 1 ≤ i) (g : ZMod (7 ^ i) → ℂ) : Prop :=
  ∀ r : ZMod (7 ^ (i - 1)),
    ∑ v ∈ Finset.univ.filter (fun v : ZMod (7 ^ i) =>
      projPow 7 i (i - 1) (Nat.sub_le i 1) v = r), g v = 0

/-- The shell `Kᵢ` inside `ZMod (7 ^ j) → ℂ` (`1 ≤ i ≤ j`). -/
def shellSubspace7 (j i : ℕ) (hi : 1 ≤ i) (hij : i ≤ j) :
    Submodule ℂ (ZMod (7 ^ j) → ℂ) where
  carrier := {f | ∃ g : ZMod (7 ^ i) → ℂ, IsFiberVanishing7 i hi g ∧ f = liftPow 7 j i hij g}
  add_mem' := by
    rintro _ _ ⟨g₁, hg₁, rfl⟩ ⟨g₂, hg₂, rfl⟩
    refine ⟨g₁ + g₂, fun r => ?_, (map_add (liftPow 7 j i hij) g₁ g₂).symm⟩
    simp only [Pi.add_apply, Finset.sum_add_distrib, hg₁ r, hg₂ r, add_zero]
  zero_mem' := ⟨0, fun _ => by simp, (map_zero (liftPow 7 j i hij)).symm⟩
  smul_mem' := by
    rintro c _ ⟨g, hg, rfl⟩
    refine ⟨c • g, fun r => ?_, (map_smul (liftPow 7 j i hij) c g).symm⟩
    simp only [Pi.smul_apply, smul_eq_mul, ← Finset.mul_sum, hg r, mul_zero]

/-- A function inflated from level `i - 1` is orthogonal to every fiber-vanishing function
at level `i`. -/
lemma sevenInner_lift_fiberVanishing_eq_zero (i : ℕ) (hi : 1 ≤ i)
    (φ₀ : ZMod (7 ^ (i - 1)) → ℂ) {ψ : ZMod (7 ^ i) → ℂ} (hψ : IsFiberVanishing7 i hi ψ) :
    sevenInner i (liftPow 7 i (i - 1) (Nat.sub_le i 1) φ₀) ψ = 0 := by
  simp only [sevenInner, liftPow, LinearMap.coe_mk, AddHom.coe_mk]
  rw [← Finset.sum_fiberwise_of_maps_to (g := projPow 7 i (i - 1) (Nat.sub_le i 1))
    (t := Finset.univ) (fun _ _ => Finset.mem_univ _)]
  refine Finset.sum_eq_zero (fun r _ => ?_)
  have hconst : ∀ v ∈ Finset.univ.filter (fun v : ZMod (7 ^ i) =>
      projPow 7 i (i - 1) (Nat.sub_le i 1) v = r),
      star (φ₀ (projPow 7 i (i - 1) (Nat.sub_le i 1) v)) * ψ v = star (φ₀ r) * ψ v := by
    intro v hv
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv
    rw [hv]
  rw [Finset.sum_congr rfl hconst, ← Finset.mul_sum, hψ r, mul_zero]

/-- Inflation scales the inner product by the fiber count `7 ^ (j - m)` (via
`haarExpectation_liftPow`, Section 10). -/
lemma sevenInner_liftPow (j m : ℕ) (hmj : m ≤ j) (f g : ZMod (7 ^ m) → ℂ) :
    sevenInner j (liftPow 7 j m hmj f) (liftPow 7 j m hmj g) =
      (7 : ℂ) ^ (j - m) * sevenInner m f g := by
  have h := haarExpectation_liftPow 7 hmj (fun r => star (f r) * g r)
  unfold haarExpectation at h
  simp only [Nat.cast_ofNat] at h
  have hj0 : (7 : ℂ) ^ j ≠ 0 := pow_ne_zero _ (by norm_num)
  have hm0 : (7 : ℂ) ^ m ≠ 0 := pow_ne_zero _ (by norm_num)
  have hfun : (fun v => star (liftPow 7 j m hmj f v) * liftPow 7 j m hmj g v) =
      liftPow 7 j m hmj (fun r => star (f r) * g r) :=
    rfl
  have key : ∑ v : ZMod (7 ^ j), liftPow 7 j m hmj (fun r => star (f r) * g r) v =
      (7 : ℂ) ^ j * ((1 / (7 : ℂ) ^ m) * ∑ r, star (f r) * g r) := by
    rw [← h, ← mul_assoc, mul_one_div_cancel hj0, one_mul]
  have h7j : (7 : ℂ) ^ j = (7 : ℂ) ^ (j - m) * (7 : ℂ) ^ m := by
    rw [← pow_add, Nat.sub_add_cancel hmj]
  unfold sevenInner
  rw [hfun, key, h7j, mul_assoc, ← mul_assoc ((7 : ℂ) ^ m), mul_one_div_cancel hm0, one_mul]

lemma sevenInner_conj_symm (j : ℕ) (f g : ZMod (7 ^ j) → ℂ) :
    sevenInner j f g = star (sevenInner j g f) := by
  unfold sevenInner
  rw [star_sum]
  refine Finset.sum_congr rfl (fun v _ => ?_)
  rw [star_mul, star_star]

/-- **Mutual orthogonality of shells** `Kᵢ ⊥ Kₘ` for `i ≠ m`. -/
theorem shellSubspace7_orthogonal (j i m : ℕ) (hi : 1 ≤ i) (hm : 1 ≤ m) (hij : i ≤ j)
    (hmj : m ≤ j) (hne : i ≠ m) {f g : ZMod (7 ^ j) → ℂ}
    (hf : f ∈ shellSubspace7 j i hi hij) (hg : g ∈ shellSubspace7 j m hm hmj) :
    sevenInner j f g = 0 := by
  obtain ⟨f₀, hf₀, rfl⟩ := hf
  obtain ⟨g₀, hg₀, rfl⟩ := hg
  rcases lt_or_gt_of_ne hne with hilt | hmlt
  · -- `i < m`: the `Kᵢ` function is inflated from level `m - 1`.
    have him1 : i ≤ m - 1 := by omega
    have hfactor : liftPow 7 j i hij f₀ = liftPow 7 j m hmj
        (liftPow 7 m (m - 1) (Nat.sub_le m 1) (liftPow 7 (m - 1) i him1 f₀)) := by
      funext v
      simp only [liftPow, LinearMap.coe_mk, AddHom.coe_mk, projPow_trans]
    rw [hfactor, sevenInner_liftPow j m hmj,
      sevenInner_lift_fiberVanishing_eq_zero m hm _ hg₀, mul_zero]
  · -- `m < i`: symmetric, through conjugate symmetry.
    have hmi1 : m ≤ i - 1 := by omega
    have hfactor : liftPow 7 j m hmj g₀ = liftPow 7 j i hij
        (liftPow 7 i (i - 1) (Nat.sub_le i 1) (liftPow 7 (i - 1) m hmi1 g₀)) := by
      funext v
      simp only [liftPow, LinearMap.coe_mk, AddHom.coe_mk, projPow_trans]
    rw [sevenInner_conj_symm, hfactor, sevenInner_liftPow j i hij,
      sevenInner_lift_fiberVanishing_eq_zero i hi _ hf₀, mul_zero, star_zero]

/-- Every shell is orthogonal to the constant function `1`. -/
theorem shellSubspace7_orthogonal_const_one (j m : ℕ) (hm : 1 ≤ m) (hmj : m ≤ j)
    {g : ZMod (7 ^ j) → ℂ} (hg : g ∈ shellSubspace7 j m hm hmj) :
    sevenInner j (fun _ => 1) g = 0 := by
  obtain ⟨g₀, hg₀, rfl⟩ := hg
  have h1 : (fun _ : ZMod (7 ^ j) => (1 : ℂ)) =
      liftPow 7 j m hmj (liftPow 7 m (m - 1) (Nat.sub_le m 1) (fun _ => 1)) :=
    rfl
  rw [h1, sevenInner_liftPow j m hmj, sevenInner_lift_fiberVanishing_eq_zero m hm _ hg₀,
    mul_zero]

/-! #### `sigmaOne7`-invariance of the shells -/

/-- An affine branch whose multiplier `u⁻¹ c` is a unit is injective at every level. -/
lemma AffineBranch.apply_injective (B : AffineBranch) (p l : ℕ)
    (hu : IsUnit (B.u : ZMod (p ^ l))) (hc : IsUnit (B.c : ZMod (p ^ l))) :
    Function.Injective (B.apply p l) := by
  intro v w h
  unfold AffineBranch.apply at h
  have h1 : (B.c : ZMod (p ^ l)) * v + B.d = B.c * w + B.d := by
    have := congrArg (fun z => (B.u : ZMod (p ^ l)) * z) h
    simpa only [← mul_assoc, ZMod.mul_inv_of_unit _ hu, one_mul] using this
  exact hc.mul_left_cancel (add_right_cancel h1)

lemma isUnit_natCast_seven {a : ℕ} (ha : Nat.Coprime a 7) (l : ℕ) :
    IsUnit ((a : ℕ) : ZMod (7 ^ l)) :=
  (ZMod.isUnit_iff_coprime a (7 ^ l)).mpr (Nat.Coprime.pow_right l ha)

lemma even_apply_injective7 (l : ℕ) : Function.Injective (AffineBranch.even.apply 7 l) :=
  AffineBranch.apply_injective _ 7 l (isUnit_natCast_seven (by decide) l)
    (by simp [AffineBranch.even])

lemma odd_apply_injective7 (l : ℕ) : Function.Injective (AffineBranch.odd.apply 7 l) :=
  AffineBranch.apply_injective _ 7 l (isUnit_natCast_seven (by decide) l)
    (by simpa [AffineBranch.odd] using isUnit_natCast_seven (a := 3) (by decide) l)

/-- Fiber sums transported by a bijection that is compatible with the projection. -/
lemma fiber_sum_comp_bijective (i : ℕ) (φ : ZMod (7 ^ i) → ZMod (7 ^ i))
    (ψ : ZMod (7 ^ (i - 1)) → ZMod (7 ^ (i - 1)))
    (hφ : Function.Bijective φ) (hψ : Function.Injective ψ)
    (hcomm : ∀ v, projPow 7 i (i - 1) (Nat.sub_le i 1) (φ v) =
      ψ (projPow 7 i (i - 1) (Nat.sub_le i 1) v))
    (g : ZMod (7 ^ i) → ℂ) (r : ZMod (7 ^ (i - 1))) :
    ∑ v ∈ Finset.univ.filter (fun v : ZMod (7 ^ i) =>
        projPow 7 i (i - 1) (Nat.sub_le i 1) v = r), g (φ v) =
      ∑ w ∈ Finset.univ.filter (fun w : ZMod (7 ^ i) =>
        projPow 7 i (i - 1) (Nat.sub_le i 1) w = ψ r), g w := by
  refine Finset.sum_bij (fun v _ => φ v) ?_ ?_ ?_ ?_
  · intro v hv
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv ⊢
    rw [hcomm, hv]
  · intro a _ b _ h
    exact hφ.1 h
  · intro w hw
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hw
    obtain ⟨v, rfl⟩ := hφ.2 w
    refine ⟨v, ?_, rfl⟩
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    apply hψ
    rw [← hcomm]
    exact hw
  · intro v _
    rfl

/-- `sigmaOne7` preserves fiber-vanishing at every level `i ≥ 1`. -/
theorem sigmaOne7_preserves_fiberVanishing (i : ℕ) (hi : 1 ≤ i) {g : ZMod (7 ^ i) → ℂ}
    (hg : IsFiberVanishing7 i hi g) : IsFiberVanishing7 i hi (sigmaOne7 i g) := by
  intro r
  have hsplit : ∑ v ∈ Finset.univ.filter (fun v : ZMod (7 ^ i) =>
        projPow 7 i (i - 1) (Nat.sub_le i 1) v = r), sigmaOne7 i g v =
      (1 / 4 : ℂ) * ∑ v ∈ Finset.univ.filter (fun v : ZMod (7 ^ i) =>
        projPow 7 i (i - 1) (Nat.sub_le i 1) v = r), g (AffineBranch.even.apply 7 i v) +
      (3 / 4 : ℂ) * ∑ v ∈ Finset.univ.filter (fun v : ZMod (7 ^ i) =>
        projPow 7 i (i - 1) (Nat.sub_le i 1) v = r), g (AffineBranch.odd.apply 7 i v) := by
    simp only [sigmaOne7, affineTransfer_apply, Finset.sum_add_distrib, Finset.mul_sum]
  have hbij₀ := Finite.injective_iff_bijective.mp (even_apply_injective7 i)
  have hbij₁ := Finite.injective_iff_bijective.mp (odd_apply_injective7 i)
  rw [hsplit,
    fiber_sum_comp_bijective i _ _ hbij₀ (even_apply_injective7 (i - 1))
      (fun v => AffineBranch.even.projPow_apply 7 (by decide) (Nat.sub_le i 1) v) g r,
    fiber_sum_comp_bijective i _ _ hbij₁ (odd_apply_injective7 (i - 1))
      (fun v => AffineBranch.odd.projPow_apply 7 (by decide) (Nat.sub_le i 1) v) g r,
    hg, hg, mul_zero, mul_zero, add_zero]

/-- **Shell invariance:** `sigmaOne7 j` maps `Kᵢ` into `Kᵢ`. -/
theorem shellSubspace7_sigmaOne7_invariant (j i : ℕ) (hi : 1 ≤ i) (hij : i ≤ j)
    {f : ZMod (7 ^ j) → ℂ} (hf : f ∈ shellSubspace7 j i hi hij) :
    sigmaOne7 j f ∈ shellSubspace7 j i hi hij := by
  obtain ⟨g, hg, rfl⟩ := hf
  exact ⟨sigmaOne7 i g, sigmaOne7_preserves_fiberVanishing i hi hg, sigmaOne7_intertwines hij g⟩

/-! #### The `p = 7` spectator in `restricted_adelic_collatz_unification` -/

/-- `p = 7` component of `hstab_other`: a 1-point test sequence pulled back from scale `N₀`
(in all four lattice coordinates) is UV-stabilized whenever the gauge moment is. This is the
generic stabilization mechanism; it does not use the shells. -/
theorem prime7_uvStabilized_of_pullback {G : Type*} [Group G] [TopologicalSpace G]
    [MeasurableSpace G] (C₇ : PadicWilsonFamily 7 G) (N₀ : ℕ) (v₇ : Fin 1 → C₇.Token)
    (t₀ M₀ : PadicPoints 1 7 (C₇.totalLevel N₀ 0) → ℂ)
    (hM : ∀ (N : ℕ) (hN : N₀ ≤ N) (x : PadicPoints 1 7 (C₇.totalLevel N 0)),
      C₇.finiteMoment N 0 v₇ x = M₀ (projPoints 1 7 (C₇.totalLevel_mono 0 hN) x)) :
    C₇.UVStabilizedAt N₀ 0 v₇ (fun N x =>
      if hN : N₀ ≤ N then t₀ (projPoints 1 7 (C₇.totalLevel_mono 0 hN) x) else 0) := by
  refine ⟨t₀, M₀, fun N hN => ⟨fun x => ?_, hM N hN⟩⟩
  simp only [dif_pos hN]

/-- `p = 7` component of `hvac_other`: with constant test `1` at scale `N₀`, the smeared
expectation is `1` exactly when the gauge moment has total mass `7 ^ (4 · uvLevel N₀)`.
That normalization is a hypothesis about the Wilson measure, not a consequence of the shells. -/
theorem prime7_unramified_vacuum_eq_one {G : Type*} [Group G] [TopologicalSpace G]
    [MeasurableSpace G] (C₇ : PadicWilsonFamily 7 G) (huv : ∀ N, C₇.uvLevel N = N)
    (N₀ : ℕ) (v₇ : Fin 1 → C₇.Token) (t₇ : ∀ N, PadicPoints 1 7 (C₇.totalLevel N 0) → ℂ)
    (ht0 : ∀ x, t₇ N₀ x = 1)
    (hM_norm : ∑ r : PadicPoints 1 7 (C₇.totalLevel N₀ 0),
      C₇.finiteMoment N₀ 0 v₇ r = ((7 : ℂ) ^ N₀) ^ 4) :
    C₇.smear N₀ 0 v₇ (t₇ N₀) = 1 := by
  unfold PadicWilsonFamily.smear PadicWilsonFamily.padicMesh
  simp only [ht0, one_mul, hM_norm, huv, Nat.cast_ofNat, mul_one]
  have hp7 : ((7 : ℂ) ^ N₀) ≠ 0 := pow_ne_zero _ (by norm_num)
  rw [inv_pow, inv_mul_cancel₀ (pow_ne_zero 4 hp7)]

/-- **`p = 7` is an unramified spectator** (`IsUnramifiedAt` of Section 9b) for the constant
test observable, under the moment-stabilization and normalization hypotheses. -/
theorem prime7_isUnramifiedAt {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
    (Ω : GlobalAdelicWilsonFamily G) (huv : ∀ N, (Ω.localAt 7).uvLevel N = N)
    (N₀ : ℕ) (v₇ : Fin 1 → (Ω.localAt 7).Token)
    (M₀ : PadicPoints 1 7 ((Ω.localAt 7).totalLevel N₀ 0) → ℂ)
    (hM : ∀ (N : ℕ) (hN : N₀ ≤ N) (x : PadicPoints 1 7 ((Ω.localAt 7).totalLevel N 0)),
      (Ω.localAt 7).finiteMoment N 0 v₇ x =
        M₀ (projPoints 1 7 ((Ω.localAt 7).totalLevel_mono 0 hN) x))
    (hM_norm : ∑ r : PadicPoints 1 7 ((Ω.localAt 7).totalLevel N₀ 0),
      (Ω.localAt 7).finiteMoment N₀ 0 v₇ r = ((7 : ℂ) ^ N₀) ^ 4) :
    Ω.IsUnramifiedAt 7 N₀ 0 v₇ (fun N x =>
      if hN : N₀ ≤ N then
        (fun _ => (1 : ℂ)) (projPoints 1 7 ((Ω.localAt 7).totalLevel_mono 0 hN) x)
      else 0) := by
  refine ⟨prime7_uvStabilized_of_pullback (Ω.localAt 7) N₀ v₇ (fun _ => 1) M₀ hM, ?_⟩
  exact prime7_unramified_vacuum_eq_one (Ω.localAt 7) huv N₀ v₇
    (fun N x => if hN : N₀ ≤ N then
        (fun _ => (1 : ℂ)) (projPoints 1 7 ((Ω.localAt 7).totalLevel_mono 0 hN) x)
      else 0)
    (fun x => dif_pos (le_refl N₀)) hM_norm

/-! #### Spanning and dimensions: `ℂ^{7^j} = ℂ · 1 + K₁ + ⋯ + Kⱼ` (added in v8 from Notes B)

`fullShellSpan7_eq_top` proves that the constants and the shells span every function on
`ZMod (7 ^ j)`. `finrank_shellSubspace7` proves `dim Kᵢ = 6 · 7 ^ (i - 1) = φ(7 ^ i)` by
rank–nullity for the fiber average `downAvg`. `finrank_const_add_shells7` shows the dimensions
of the pieces add up to `7 ^ j`. Together with the orthogonality above (Notes A), this makes
the sum direct; independence is not stated here as a separate Lean theorem.
-/

/-- The constant functions `ℂ · 1` on `ZMod (7 ^ j)`. -/
def constSubmodule7 (j : ℕ) : Submodule ℂ (ZMod (7 ^ j) → ℂ) :=
  Submodule.span ℂ {fun _ : ZMod (7 ^ j) => (1 : ℂ)}

/-- `ℂ · 1 ⊔ ⨆_{1 ≤ i ≤ j} Kᵢ` inside `ZMod (7 ^ j) → ℂ`. -/
def fullShellSpan7 (j : ℕ) : Submodule ℂ (ZMod (7 ^ j) → ℂ) :=
  constSubmodule7 j ⊔ ⨆ (i : ℕ) (hi : 1 ≤ i) (hij : i ≤ j), shellSubspace7 j i hi hij

/-- `downAvg 7 k` as a `ℂ`-linear map. -/
noncomputable def downAvgLinear7 (k : ℕ) :
    (ZMod (7 ^ (k + 1)) → ℂ) →ₗ[ℂ] (ZMod (7 ^ k) → ℂ) where
  toFun := downAvg 7 k
  map_add' f₁ f₂ := downAvg_add 7 k f₁ f₂
  map_smul' c f := downAvg_smul 7 k c f

lemma downAvgLinear7_apply (k : ℕ) (f : ZMod (7 ^ (k + 1)) → ℂ) :
    downAvgLinear7 k f = downAvg 7 k f :=
  rfl

/-- `downAvg 7 k ψ = 0` gives fiber-vanishing at level `k + 1` (the fiber sum is `7` times the
average). -/
lemma isFiberVanishing7_of_downAvg_eq_zero (k : ℕ) {ψ : ZMod (7 ^ (k + 1)) → ℂ}
    (h : downAvg 7 k ψ = 0) : IsFiberVanishing7 (k + 1) (Nat.succ_pos k) ψ := by
  intro r
  have hr := congrFun h r
  simp only [downAvg, Pi.zero_apply] at hr
  exact (mul_eq_zero.mp hr).resolve_left (by norm_num)

/-- Conversely, fiber-vanishing at level `k + 1` gives `downAvg 7 k ψ = 0`. -/
lemma downAvg_eq_zero_of_isFiberVanishing7 (k : ℕ) (hk : 1 ≤ k + 1)
    {ψ : ZMod (7 ^ (k + 1)) → ℂ} (h : IsFiberVanishing7 (k + 1) hk ψ) : downAvg 7 k ψ = 0 := by
  funext r
  have h0 : (∑ v ∈ Finset.univ.filter (fun v : ZMod (7 ^ (k + 1)) =>
      projPow 7 (k + 1) k (Nat.le_succ k) v = r), ψ v) = 0 :=
    h r
  simp only [downAvg, Pi.zero_apply]
  rw [h0, mul_zero]

/-- Lifting the decimated part of `f` and subtracting leaves an element of the top shell. -/
lemma sub_liftStep_downAvg_mem_top_shell (j : ℕ) (f : ZMod (7 ^ (j + 1)) → ℂ) :
    f - liftStep 7 j (downAvg 7 j f) ∈
      shellSubspace7 (j + 1) (j + 1) (Nat.succ_pos j) (le_refl (j + 1)) := by
  have havg : downAvg 7 j (f - liftStep 7 j (downAvg 7 j f)) = 0 := by
    have h := map_sub (downAvgLinear7 j) f (liftStep 7 j (downAvg 7 j f))
    simp only [downAvgLinear7_apply, downAvg_liftStep, sub_self] at h
    exact h
  exact ⟨f - liftStep 7 j (downAvg 7 j f), isFiberVanishing7_of_downAvg_eq_zero j havg,
    (liftPow_self 7 (j + 1) _).symm⟩

lemma zmod_seven_pow_zero_eq (x : ZMod (7 ^ 0)) : x = 0 := by
  have h : x.val < 1 := lt_of_lt_of_eq (ZMod.val_lt x) (pow_zero 7)
  have h0 : x.val = 0 := Nat.lt_one_iff.mp h
  rw [← ZMod.natCast_zmod_val x, h0, Nat.cast_zero]

lemma liftPow_liftStep_seven {m j : ℕ} (hjm : j + 1 ≤ m) (h : ZMod (7 ^ j) → ℂ) :
    liftPow 7 m (j + 1) hjm (liftStep 7 j h) = liftPow 7 m j (by omega) h := by
  funext v
  simp only [liftPow, liftStep, LinearMap.coe_mk, AddHom.coe_mk, projPow_trans]

lemma shell_mem_fullShellSpan7 {m i : ℕ} (hi : 1 ≤ i) (him : i ≤ m)
    {f : ZMod (7 ^ m) → ℂ} (hf : f ∈ shellSubspace7 m i hi him) : f ∈ fullShellSpan7 m :=
  Submodule.mem_sup_right (Submodule.mem_iSup_of_mem i
    (Submodule.mem_iSup_of_mem hi (Submodule.mem_iSup_of_mem him hf)))

/-- Every inflation of a level-`j` function to any level `m ≥ j` lies in `fullShellSpan7 m`. -/
theorem liftPow_mem_fullShellSpan7 (j : ℕ) :
    ∀ (m : ℕ) (hjm : j ≤ m) (g : ZMod (7 ^ j) → ℂ), liftPow 7 m j hjm g ∈ fullShellSpan7 m := by
  induction j with
  | zero =>
    intro m hjm g
    apply Submodule.mem_sup_left
    rw [constSubmodule7, Submodule.mem_span_singleton]
    refine ⟨g 0, ?_⟩
    funext v
    simp only [Pi.smul_apply, smul_eq_mul, mul_one, liftPow, LinearMap.coe_mk, AddHom.coe_mk,
      zmod_seven_pow_zero_eq (projPow 7 m 0 hjm v)]
  | succ j ih =>
    intro m hjm g
    have hsplit : g = liftStep 7 j (downAvg 7 j g) + (g - liftStep 7 j (downAvg 7 j g)) := by
      abel
    rw [hsplit, map_add, liftPow_liftStep_seven hjm]
    refine Submodule.add_mem _ (ih m (by omega) _) ?_
    obtain ⟨ψ, hψ, hψeq⟩ := sub_liftStep_downAvg_mem_top_shell j g
    refine shell_mem_fullShellSpan7 (Nat.succ_pos j) hjm ⟨ψ, hψ, ?_⟩
    rw [hψeq, liftPow_self]

/-- **Spanning:** the constants and the shells `K₁, …, Kⱼ` span `ZMod (7 ^ j) → ℂ`. -/
theorem fullShellSpan7_eq_top (j : ℕ) : fullShellSpan7 j = ⊤ := by
  rw [eq_top_iff]
  intro f _
  have h := liftPow_mem_fullShellSpan7 j j (le_refl j) f
  rwa [liftPow_self] at h

/-- **Shell dimension** `dim Kᵢ = 6 · 7 ^ (i - 1)` (`= φ(7 ^ i)`), by rank–nullity for the
surjective fiber average. -/
theorem finrank_shellSubspace7 (j i : ℕ) (hi : 1 ≤ i) (hij : i ≤ j) :
    Module.finrank ℂ (shellSubspace7 j i hi hij) = 6 * 7 ^ (i - 1) := by
  obtain ⟨k, rfl⟩ : ∃ k, i = k + 1 := ⟨i - 1, (Nat.sub_add_cancel hi).symm⟩
  have h_inj : Function.Injective (liftPow 7 j (k + 1) hij) := by
    intro g₁ g₂ h
    funext r
    obtain ⟨v, rfl⟩ := ZMod.castHom_surjective (pow_dvd_pow 7 hij) r
    exact congrFun h v
  have h_range : LinearMap.range ((liftPow 7 j (k + 1) hij).domRestrict
      (LinearMap.ker (downAvgLinear7 k))) = shellSubspace7 j (k + 1) hi hij := by
    ext f
    simp only [LinearMap.mem_range, LinearMap.domRestrict_apply, Subtype.exists,
      LinearMap.mem_ker]
    constructor
    · rintro ⟨g, hg, rfl⟩
      exact ⟨g, isFiberVanishing7_of_downAvg_eq_zero k hg, rfl⟩
    · rintro ⟨g, hg, rfl⟩
      exact ⟨g, downAvg_eq_zero_of_isFiberVanishing7 k hi hg, rfl⟩
  have h_dim_eq : Module.finrank ℂ (shellSubspace7 j (k + 1) hi hij) =
      Module.finrank ℂ (LinearMap.ker (downAvgLinear7 k)) := by
    rw [← h_range]
    exact (LinearEquiv.finrank_eq
      (LinearEquiv.ofInjective ((liftPow 7 j (k + 1) hij).domRestrict
        (LinearMap.ker (downAvgLinear7 k))) (fun a b hab => Subtype.ext (h_inj hab)))).symm
  have h_surj : LinearMap.range (downAvgLinear7 k) = ⊤ := by
    rw [eq_top_iff]
    intro g _
    exact ⟨liftStep 7 k g, downAvg_liftStep 7 k g⟩
  have hrk := LinearMap.finrank_range_add_finrank_ker (downAvgLinear7 k)
  rw [h_surj, finrank_top] at hrk
  have h_dom : Module.finrank ℂ (ZMod (7 ^ (k + 1)) → ℂ) = 7 ^ (k + 1) := by
    simp [Module.finrank_pi, ZMod.card]
  have h_cod : Module.finrank ℂ (ZMod (7 ^ k) → ℂ) = 7 ^ k := by
    simp [Module.finrank_pi, ZMod.card]
  rw [h_dom, h_cod] at hrk
  have h_pow : 7 ^ (k + 1) = 7 ^ k + 6 * 7 ^ k := by
    rw [pow_succ']
    ring
  rw [h_dim_eq, Nat.add_sub_cancel]
  omega

lemma finrank_constSubmodule7 (j : ℕ) : Module.finrank ℂ (constSubmodule7 j) = 1 :=
  finrank_span_singleton (fun h => one_ne_zero (congrFun h 0))

/-- `1 + ∑_{i=1}^{j} 6 · 7 ^ (i - 1) = 7 ^ j`. -/
theorem sum_dim_const_and_shells7 (j : ℕ) :
    1 + ∑ i ∈ Finset.Icc 1 j, 6 * 7 ^ (i - 1) = 7 ^ j := by
  induction j with
  | zero => simp
  | succ j ih =>
    rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ j + 1), Nat.add_sub_cancel, ← add_assoc, ih,
      pow_succ']
    ring

/-- **Dimension count:** `dim (ℂ · 1) + ∑_{i=1}^{j} dim Kᵢ = dim (ZMod (7 ^ j) → ℂ) = 7 ^ j`. -/
theorem finrank_const_add_shells7 (j : ℕ) :
    Module.finrank ℂ (constSubmodule7 j) +
      ∑ i ∈ (Finset.Icc 1 j).attach,
        Module.finrank ℂ (shellSubspace7 j i.1 (Finset.mem_Icc.mp i.2).1
          (Finset.mem_Icc.mp i.2).2) =
      Module.finrank ℂ (ZMod (7 ^ j) → ℂ) := by
  rw [finrank_constSubmodule7]
  have h : ∀ i ∈ (Finset.Icc 1 j).attach,
      Module.finrank ℂ (shellSubspace7 j i.1 (Finset.mem_Icc.mp i.2).1
        (Finset.mem_Icc.mp i.2).2) = 6 * 7 ^ (i.1 - 1) :=
    fun i _ => finrank_shellSubspace7 j i.1 _ _
  rw [Finset.sum_congr rfl h, Finset.sum_attach (Finset.Icc 1 j) (fun i => 6 * 7 ^ (i - 1)),
    sum_dim_const_and_shells7]
  simp [Module.finrank_pi, ZMod.card]

end PrimeSevenShells

/-! ### Section 12: Asymptotic Transfer Form, Vacuum Normalization, and the Affine-Shift U(1) Model

Manuscript Section 11.7 builds a 4D U(1) heat-kernel gauge model on `(ℤ/pˡℤ)⁴` with two branch
temporal links per site. Its smeared plaquette 2-point function has the transfer form of Section 10
only approximately: `λ ^ s · G_L(s; A, B)`, up to corrections of relative order `λ ^ α`. Numerically
`α = 2` in the branch-frozen model at `l = 1`; in the full model `α = 3/2` is the cheapest correction
found by power counting, not a proved bound. This section:
(12a) states the asymptotic form as an explicit hypothesis, `AsymptoticTwoPointTransferForm`, with
      an error constant uniform in the UV index and the coupling (an assumption: the numerics cover
      `l = 1` only);
(12b) proves the vacuum-normalized ratio bound and the strong-coupling limit `λ → 0⁺`, uniformly
      in the UV index;
(12c) defines the fields and plaquettes of the model and proves gauge invariance (Proposition
      11.7.1);
(12d) proves the algebraic core of Proposition 11.7.2: in a monomial of mixed transverse
      plaquettes, the exponent of each transverse link is the net plaquette charge flowing into its
      node of the affine-shift graph, so any character-orthogonal expectation over the transverse
      links (the property of Haar measure on `U(1)` that is used) vanishes unless the charges form
      a conserved flow;
(12e) proves that the two 7-adic branches coincide at exactly one point, `v = -2⁻¹`, at every level.
Not formalized: the heat-kernel weights and their character expansion, the identity of Proposition
11.7.2 with spatial and longitudinal plaquettes present, Proposition 11.7.3, the decay constants of
the manuscript, and the existence of any gauge measure satisfying the hypothesis of (12a). -/

section AsymptoticTwoPoint

open Finset BigOperators Filter Topology

/-- **Asymptotic transfer-matrix hypothesis (explicit assumption).** `obs lam N` is the smeared
2-point observable at strong-coupling parameter `lam` and UV index `N`, and `lev N` is the total
level at UV index `N`. For every `lam ∈ (0, 1)` and every `N ≥ N₀`, the observable equals
`lam ^ s` times the Green's function of `T` on the inflated insertions, up to `K · lam ^ s · lam ^ α`.
The constant `K` does not depend on `N` or `lam`; this uniformity is part of the assumption. -/
def AsymptoticTwoPointTransferForm (p : ℕ) [Fact (Nat.Prime p)]
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (lev : ℕ → ℕ) (hlev : Monotone lev) (N₀ s : ℕ)
    (α K : ℝ) (A₀ B₀ : ZMod (p ^ lev N₀) → ℂ) (obs : ℝ → ℕ → ℂ) : Prop :=
  ∀ (lam : ℝ), 0 < lam → lam < 1 → ∀ (N : ℕ) (hN : N₀ ≤ N),
    ‖obs lam N - (lam : ℂ) ^ s *
        greenFn p T (lev N) s (liftPow p _ _ (hlev hN) A₀) (liftPow p _ _ (hlev hN) B₀)‖ ≤
      K * lam ^ s * lam ^ α

/-- A two-branch affine family whose weights sum to `1` fixes the constant function `1`. -/
lemma affineTransfer_const_one (p : ℕ) (w₀ w₁ : ℂ) (B₀ B₁ : AffineBranch) (l : ℕ)
    (hw : w₀ + w₁ = 1) :
    affineTransfer p w₀ w₁ B₀ B₁ l (fun _ => 1) = fun _ => 1 := by
  funext v
  simp only [affineTransfer_apply, mul_one, hw]

lemma sigmaOne7_const_one (l : ℕ) : sigmaOne7 l (fun _ => 1) = fun _ => 1 :=
  affineTransfer_const_one 7 (1 / 4) (3 / 4) AffineBranch.even AffineBranch.odd l (by norm_num)

lemma pow_apply_const_one (p : ℕ) (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (l : ℕ)
    (h1 : T l (fun _ => 1) = fun _ => 1) (s : ℕ) :
    (T l ^ s) (fun _ => 1) = fun _ => 1 := by
  induction s with
  | zero => simp only [pow_zero, Module.End.one_apply]
  | succ s ih => rw [pow_succ' (T l) s, Module.End.mul_apply, ih, h1]

lemma haarExpectation_const_one (p : ℕ) [Fact (Nat.Prime p)] (l : ℕ) :
    haarExpectation p l (fun _ => 1) = 1 := by
  unfold haarExpectation
  rw [Finset.sum_const, Finset.card_univ, ZMod.card, nsmul_eq_mul, mul_one]
  have hne : ((p : ℂ) ^ l) ≠ 0 :=
    pow_ne_zero _ (Nat.cast_ne_zero.mpr (Fact.out : Nat.Prime p).ne_zero)
  push_cast
  field_simp

/-- For a family fixing constants, the Green's function of the constant insertions is `1`. -/
lemma greenFn_const_one (p : ℕ) [Fact (Nat.Prime p)] (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ))
    (l s : ℕ) (h1 : T l (fun _ => 1) = fun _ => 1) :
    greenFn p T l s (fun _ => 1) (fun _ => 1) = 1 := by
  unfold greenFn
  rw [pow_apply_const_one p T l h1 s]
  simpa only [mul_one] using haarExpectation_const_one p l

lemma liftPow_const_one (p : ℕ) [Fact (Nat.Prime p)] {j k : ℕ} (hk : k ≤ j) :
    liftPow p j k hk (fun _ => (1 : ℂ)) = fun _ => 1 := by
  ext v
  rfl

/-- **Vacuum-normalized ratio bound.** Suppose `obs` has the asymptotic transfer form for the
insertions `A₀, B₀` with constant `K`, and `obs₁` has it for the constant insertions `1, 1` with
constant `K₁`, for an intertwining family that fixes constants. Then for `lam ∈ (0, 1)` and every
`N ≥ N₀`, with `G₀ = G_{lev N₀}(s; A₀, B₀)` the coarse Green's function,
`‖obs lam N / obs₁ lam N - G₀‖ · (1 - K₁ lam ^ α) ≤ (K + K₁ ‖G₀‖) · lam ^ α`.
The factor `lam ^ s` (the ground-state tube weight) cancels in the ratio. -/
theorem normalized_twoPoint_bound (p : ℕ) [Fact (Nat.Prime p)]
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (hT : IntertwinesLift p T)
    (h1 : ∀ l, T l (fun _ => 1) = fun _ => 1)
    (lev : ℕ → ℕ) (hlev : Monotone lev) (N₀ s : ℕ) (α K K₁ : ℝ)
    (A₀ B₀ : ZMod (p ^ lev N₀) → ℂ) (obs obs₁ : ℝ → ℕ → ℂ)
    (hA : AsymptoticTwoPointTransferForm p T lev hlev N₀ s α K A₀ B₀ obs)
    (h₁ : AsymptoticTwoPointTransferForm p T lev hlev N₀ s α K₁ (fun _ => 1) (fun _ => 1) obs₁)
    (lam : ℝ) (hl0 : 0 < lam) (hl1 : lam < 1) (hsmall : K₁ * lam ^ α < 1)
    (N : ℕ) (hN : N₀ ≤ N) :
    ‖obs lam N / obs₁ lam N - greenFn p T (lev N₀) s A₀ B₀‖ * (1 - K₁ * lam ^ α) ≤
      (K + K₁ * ‖greenFn p T (lev N₀) s A₀ B₀‖) * lam ^ α := by
  have hAN := hA lam hl0 hl1 N hN
  have h1N := h₁ lam hl0 hl1 N hN
  rw [greenFn_liftPow p T hT (hlev hN) s A₀ B₀] at hAN
  rw [liftPow_const_one p (hlev hN), greenFn_const_one p T (lev N) s (h1 _), mul_one] at h1N
  have hxc : ((lam : ℂ) ^ s) = ((lam ^ s : ℝ) : ℂ) := by rw [Complex.ofReal_pow]
  rw [hxc] at hAN h1N
  have hxpos : 0 < lam ^ s := pow_pos hl0 s
  have hnx : ‖((lam ^ s : ℝ) : ℂ)‖ = lam ^ s := by
    rw [Complex.norm_real, Real.norm_of_nonneg hxpos.le]
  -- lower bound on the normalizer
  have hb : lam ^ s - K₁ * lam ^ s * lam ^ α ≤ ‖obs₁ lam N‖ := by
    have h := norm_sub_norm_le ((lam ^ s : ℝ) : ℂ) (obs₁ lam N)
    rw [hnx, norm_sub_rev] at h
    linarith
  have hbpos : 0 < ‖obs₁ lam N‖ := by
    nlinarith [mul_pos hxpos (sub_pos.mpr hsmall)]
  have hb0 : obs₁ lam N ≠ 0 := norm_pos_iff.mp hbpos
  -- numerator
  set G₀ := greenFn p T (lev N₀) s A₀ B₀ with hG₀
  have hnum : ‖obs lam N - G₀ * obs₁ lam N‖ ≤
      K * lam ^ s * lam ^ α + ‖G₀‖ * (K₁ * lam ^ s * lam ^ α) := by
    have hsplit : obs lam N - G₀ * obs₁ lam N =
        (obs lam N - ((lam ^ s : ℝ) : ℂ) * G₀) - G₀ * (obs₁ lam N - ((lam ^ s : ℝ) : ℂ)) := by
      ring
    rw [hsplit]
    calc ‖(obs lam N - ((lam ^ s : ℝ) : ℂ) * G₀) - G₀ * (obs₁ lam N - ((lam ^ s : ℝ) : ℂ))‖
        ≤ ‖obs lam N - ((lam ^ s : ℝ) : ℂ) * G₀‖ +
            ‖G₀ * (obs₁ lam N - ((lam ^ s : ℝ) : ℂ))‖ := norm_sub_le _ _
      _ = ‖obs lam N - ((lam ^ s : ℝ) : ℂ) * G₀‖ +
            ‖G₀‖ * ‖obs₁ lam N - ((lam ^ s : ℝ) : ℂ)‖ := by rw [norm_mul]
      _ ≤ K * lam ^ s * lam ^ α + ‖G₀‖ * (K₁ * lam ^ s * lam ^ α) :=
          add_le_add hAN (mul_le_mul_of_nonneg_left h1N (norm_nonneg _))
  -- the ratio times the normalizer is the numerator
  have hr : (obs lam N / obs₁ lam N - G₀) * obs₁ lam N = obs lam N - G₀ * obs₁ lam N := by
    first
      | (field_simp; done)
      | (field_simp; ring)
  have hrn : ‖obs lam N / obs₁ lam N - G₀‖ * ‖obs₁ lam N‖ =
      ‖obs lam N - G₀ * obs₁ lam N‖ := by
    rw [← norm_mul, hr]
  have hmono := mul_le_mul_of_nonneg_left hb (norm_nonneg (obs lam N / obs₁ lam N - G₀))
  have key : (‖obs lam N / obs₁ lam N - G₀‖ * (1 - K₁ * lam ^ α)) * lam ^ s ≤
      ((K + K₁ * ‖G₀‖) * lam ^ α) * lam ^ s := by
    nlinarith [hmono, hrn, hnum]
  exact le_of_mul_le_mul_right key hxpos

/-- **Strong-coupling limit of the normalized 2-point function.** Under the hypotheses of
`normalized_twoPoint_bound`, with `α > 0` and nonnegative constants, the normalized ratio tends to
the coarse Green's function `G₀` as `lam → 0⁺`, uniformly in the UV index `N ≥ N₀`. At fixed `lam`
the ratio is only shown to stay within `O(lam ^ α)` of `G₀`; it is not shown to converge in `N`. -/
theorem normalized_twoPoint_strong_coupling_limit (p : ℕ) [Fact (Nat.Prime p)]
    (T : ∀ l, Module.End ℂ (ZMod (p ^ l) → ℂ)) (hT : IntertwinesLift p T)
    (h1 : ∀ l, T l (fun _ => 1) = fun _ => 1)
    (lev : ℕ → ℕ) (hlev : Monotone lev) (N₀ s : ℕ) (α K K₁ : ℝ)
    (hα : 0 < α) (hK : 0 ≤ K) (hK₁ : 0 ≤ K₁)
    (A₀ B₀ : ZMod (p ^ lev N₀) → ℂ) (obs obs₁ : ℝ → ℕ → ℂ)
    (hA : AsymptoticTwoPointTransferForm p T lev hlev N₀ s α K A₀ B₀ obs)
    (h₁ : AsymptoticTwoPointTransferForm p T lev hlev N₀ s α K₁ (fun _ => 1) (fun _ => 1) obs₁) :
    ∀ ε : ℝ, 0 < ε → ∃ lam₀ : ℝ, 0 < lam₀ ∧ ∀ lam : ℝ, 0 < lam → lam < lam₀ → lam < 1 →
      ∀ N : ℕ, N₀ ≤ N →
        ‖obs lam N / obs₁ lam N - greenFn p T (lev N₀) s A₀ B₀‖ ≤ ε := by
  intro ε hε
  obtain ⟨M, hM⟩ : ∃ M : ℝ, M = K + K₁ * ‖greenFn p T (lev N₀) s A₀ B₀‖ := ⟨_, rfl⟩
  have hM0 : 0 ≤ M := by rw [hM]; exact add_nonneg hK (mul_nonneg hK₁ (norm_nonneg _))
  have hK1p : 0 < K₁ + 1 := by linarith
  have hM1p : 0 < M + 1 := by linarith
  have hK1ne : K₁ + 1 ≠ 0 := hK1p.ne'
  have hM1ne : M + 1 ≠ 0 := hM1p.ne'
  have hc1 : 0 < 2 * (K₁ + 1) := mul_pos two_pos hK1p
  have hc2 : 0 < 2 * (M + 1) := mul_pos two_pos hM1p
  obtain ⟨δ, hδ⟩ : ∃ δ : ℝ, δ = min (1 / (2 * (K₁ + 1))) (ε / (2 * (M + 1))) := ⟨_, rfl⟩
  have hδpos : 0 < δ := by
    rw [hδ]; exact lt_min (div_pos one_pos hc1) (div_pos hε hc2)
  have hδ1 : 2 * (K₁ + 1) * δ ≤ 1 := by
    have h := mul_le_mul_of_nonneg_left (min_le_left (1 / (2 * (K₁ + 1))) (ε / (2 * (M + 1))))
      hc1.le
    have he : 2 * (K₁ + 1) * (1 / (2 * (K₁ + 1))) = 1 := by field_simp
    rw [he, ← hδ] at h
    exact h
  have hδ2 : 2 * (M + 1) * δ ≤ ε := by
    have h := mul_le_mul_of_nonneg_left (min_le_right (1 / (2 * (K₁ + 1))) (ε / (2 * (M + 1))))
      hc2.le
    have he : 2 * (M + 1) * (ε / (2 * (M + 1))) = ε := by field_simp
    rw [he, ← hδ] at h
    exact h
  refine ⟨δ ^ α⁻¹, Real.rpow_pos_of_pos hδpos _, ?_⟩
  intro lam hl0 hlam hl1 N hN
  have he0 : 0 ≤ lam ^ α := Real.rpow_nonneg hl0.le α
  have heδ : lam ^ α < δ := by
    have h := Real.rpow_lt_rpow hl0.le hlam hα
    rwa [Real.rpow_inv_rpow hδpos.le hα.ne'] at h
  have hKe : K₁ * lam ^ α ≤ 1 / 2 := by
    nlinarith [mul_le_mul_of_nonneg_left heδ.le hK₁]
  have hMe : M * lam ^ α ≤ ε / 2 := by
    nlinarith [mul_le_mul_of_nonneg_left heδ.le hM0]
  have hbound := normalized_twoPoint_bound p T hT h1 lev hlev N₀ s α K K₁ A₀ B₀ obs obs₁ hA h₁
    lam hl0 hl1 (by linarith) N hN
  rw [← hM] at hbound
  have hhalf : ‖obs lam N / obs₁ lam N - greenFn p T (lev N₀) s A₀ B₀‖ * (1 / 2) ≤
      ‖obs lam N / obs₁ lam N - greenFn p T (lev N₀) s A₀ B₀‖ * (1 - K₁ * lam ^ α) :=
    mul_le_mul_of_nonneg_left (by linarith) (norm_nonneg _)
  linarith

/-- **7-adic `σ = 1` instance:** the vacuum-normalized 2-point function of a family with the
asymptotic transfer form for `sigmaOne7` tends to `G_{L₀}(s; A₀, B₀)` as `lam → 0⁺`, uniformly in
the UV index. The decay of that Green's function is the numerical content of manuscript §4.1. -/
theorem normalized_twoPoint_sigmaOne7_limit (lev : ℕ → ℕ) (hlev : Monotone lev) (N₀ s : ℕ)
    (α K K₁ : ℝ) (hα : 0 < α) (hK : 0 ≤ K) (hK₁ : 0 ≤ K₁)
    (A₀ B₀ : ZMod (7 ^ lev N₀) → ℂ) (obs obs₁ : ℝ → ℕ → ℂ)
    (hA : AsymptoticTwoPointTransferForm 7 sigmaOne7 lev hlev N₀ s α K A₀ B₀ obs)
    (h₁ : AsymptoticTwoPointTransferForm 7 sigmaOne7 lev hlev N₀ s α K₁ (fun _ => 1) (fun _ => 1)
      obs₁) :
    ∀ ε : ℝ, 0 < ε → ∃ lam₀ : ℝ, 0 < lam₀ ∧ ∀ lam : ℝ, 0 < lam → lam < lam₀ → lam < 1 →
      ∀ N : ℕ, N₀ ≤ N →
        ‖obs lam N / obs₁ lam N - greenFn 7 sigmaOne7 (lev N₀) s A₀ B₀‖ ≤ ε :=
  normalized_twoPoint_strong_coupling_limit 7 sigmaOne7 sigmaOne7_intertwines sigmaOne7_const_one
    lev hlev N₀ s α K K₁ hα hK hK₁ A₀ B₀ obs obs₁ hA h₁

end AsymptoticTwoPoint

section AffineShiftGaugeModel

open Finset BigOperators

/-- Sites `(t, v, q)` of the 4D lattice `(ℤ/pˡℤ)⁴`, with `q = (y, z)` the transverse coordinates;
the affine branches act on `v`. -/
abbrev GSite (p l : ℕ) := ZMod (p ^ l) × ZMod (p ^ l) × (ZMod (p ^ l) × ZMod (p ^ l))

variable {p l : ℕ} [NeZero p]

/-- The two branches `v ↦ 2⁻¹ v` and `v ↦ 2⁻¹ (3 v + 1)`. -/
def branchData : Fin 2 → AffineBranch := ![AffineBranch.even, AffineBranch.odd]

/-- Target of the branch temporal link `a` from `x = (t, v, q)`: `(t + 1, B_a v, q)`. -/
def branchSite (a : Fin 2) (x : GSite p l) : GSite p l :=
  (x.1 + 1, (branchData a).apply p l x.2.1, x.2.2)

/-- Unit transverse shift: `k = 0` moves `y`, `k = 1` moves `z`. -/
def yzShift (k : Fin 2) (q : ZMod (p ^ l) × ZMod (p ^ l)) : ZMod (p ^ l) × ZMod (p ^ l) :=
  if k = 0 then (q.1 + 1, q.2) else (q.1, q.2 + 1)

/-- Transverse shift of a site. -/
def tShift (k : Fin 2) (x : GSite p l) : GSite p l := (x.1, x.2.1, yzShift k x.2.2)

/-- The branches commute with transverse shifts. -/
lemma branchSite_tShift (a k : Fin 2) (x : GSite p l) :
    branchSite a (tShift k x) = tShift k (branchSite a x) := rfl

lemma yzShift_comm (q : ZMod (p ^ l) × ZMod (p ^ l)) :
    yzShift 1 (yzShift 0 q) = yzShift 0 (yzShift 1 q) := by
  simp [yzShift]

/-- Gauge field with values in a group `Gp`: transverse links `U k x` from `x` to `tShift k x`;
longitudinal links `W t v w q` from `(t, v, q)` to `(t, w, q)` (one for every pair, the
ultrametric link set of §11.7); branch temporal links `V a x` from `x` to `branchSite a x`. -/
structure GaugeConfig (p l : ℕ) (Gp : Type*) where
  U : Fin 2 → GSite p l → Gp
  W : ZMod (p ^ l) → ZMod (p ^ l) → ZMod (p ^ l) → ZMod (p ^ l) × ZMod (p ^ l) → Gp
  V : Fin 2 → GSite p l → Gp

namespace GaugeConfig

variable {Gp : Type*} [Group Gp]

/-- Gauge transformation by `Ω`. -/
def gauge (Ω : GSite p l → Gp) (C : GaugeConfig p l Gp) : GaugeConfig p l Gp where
  U k x := Ω x * C.U k x * (Ω (tShift k x))⁻¹
  W t v w q := Ω (t, v, q) * C.W t v w q * (Ω (t, w, q))⁻¹
  V a x := Ω x * C.V a x * (Ω (branchSite a x))⁻¹

/-- Transverse spatial plaquette at `x`. -/
def plaqSpatial (C : GaugeConfig p l Gp) (x : GSite p l) : Gp :=
  C.U 0 x * C.U 1 (tShift 0 x) * (C.U 0 (tShift 1 x))⁻¹ * (C.U 1 x)⁻¹

/-- Longitudinal spatial plaquette spanned by the pair `(v, w)` and the transverse direction `k`. -/
def plaqLongSpatial (C : GaugeConfig p l Gp) (k : Fin 2) (t v w : ZMod (p ^ l))
    (q : ZMod (p ^ l) × ZMod (p ^ l)) : Gp :=
  C.W t v w q * C.U k (t, w, q) * (C.W t v w (yzShift k q))⁻¹ * (C.U k (t, v, q))⁻¹

/-- Mixed transverse plaquette `P_{a,k}(x)` (the twisted time-like plaquette). -/
def plaqMixed (C : GaugeConfig p l Gp) (a k : Fin 2) (x : GSite p l) : Gp :=
  C.V a x * C.U k (branchSite a x) * (C.V a (tShift k x))⁻¹ * (C.U k x)⁻¹

/-- Mixed longitudinal plaquette. When `B_a v = B_a w` its top link is the diagonal
`W (t + 1) u u q`, which every gauge transformation leaves fixed in an abelian group; §11.7 sets it
to `1`, so the plaquette is a triangle. -/
def plaqMixedLong (C : GaugeConfig p l Gp) (a : Fin 2) (t v w : ZMod (p ^ l))
    (q : ZMod (p ^ l) × ZMod (p ^ l)) : Gp :=
  C.V a (t, v, q) * C.W (t + 1) ((branchData a).apply p l v) ((branchData a).apply p l w) q *
    (C.V a (t, w, q))⁻¹ * (C.W t v w q)⁻¹

/-- **Gauge covariance (any group).** Every plaquette is conjugated by the gauge transformation at
its base point. -/
theorem plaqSpatial_gauge (Ω : GSite p l → Gp) (C : GaugeConfig p l Gp) (x : GSite p l) :
    (C.gauge Ω).plaqSpatial x = Ω x * C.plaqSpatial x * (Ω x)⁻¹ := by
  have h : tShift 1 (tShift 0 x) = tShift 0 (tShift 1 x) := by
    simp only [tShift, yzShift_comm]
  simp only [plaqSpatial, gauge]
  rw [h]
  group

theorem plaqLongSpatial_gauge (Ω : GSite p l → Gp) (C : GaugeConfig p l Gp) (k : Fin 2)
    (t v w : ZMod (p ^ l)) (q : ZMod (p ^ l) × ZMod (p ^ l)) :
    (C.gauge Ω).plaqLongSpatial k t v w q =
      Ω (t, v, q) * C.plaqLongSpatial k t v w q * (Ω (t, v, q))⁻¹ := by
  simp only [plaqLongSpatial, gauge, tShift]
  group

theorem plaqMixed_gauge (Ω : GSite p l → Gp) (C : GaugeConfig p l Gp) (a k : Fin 2)
    (x : GSite p l) :
    (C.gauge Ω).plaqMixed a k x = Ω x * C.plaqMixed a k x * (Ω x)⁻¹ := by
  simp only [plaqMixed, gauge]
  rw [branchSite_tShift]
  group

theorem plaqMixedLong_gauge (Ω : GSite p l → Gp) (C : GaugeConfig p l Gp) (a : Fin 2)
    (t v w : ZMod (p ^ l)) (q : ZMod (p ^ l) × ZMod (p ^ l)) :
    (C.gauge Ω).plaqMixedLong a t v w q =
      Ω (t, v, q) * C.plaqMixedLong a t v w q * (Ω (t, v, q))⁻¹ := by
  simp only [plaqMixedLong, gauge, branchSite]
  group

end GaugeConfig

namespace GaugeConfig

variable {Gp : Type*} [CommGroup Gp]

/-- **Gauge invariance (Proposition 11.7.1).** For an abelian gauge group, such as `U(1)`, every
plaquette of the affine-shift model is gauge invariant. -/
theorem plaquettes_gauge_invariant (Ω : GSite p l → Gp) (C : GaugeConfig p l Gp) :
    (∀ x, (C.gauge Ω).plaqSpatial x = C.plaqSpatial x) ∧
    (∀ k t v w q, (C.gauge Ω).plaqLongSpatial k t v w q = C.plaqLongSpatial k t v w q) ∧
    (∀ a k x, (C.gauge Ω).plaqMixed a k x = C.plaqMixed a k x) ∧
    (∀ a t v w q, (C.gauge Ω).plaqMixedLong a t v w q = C.plaqMixedLong a t v w q) := by
  refine ⟨fun x => ?_, fun k t v w q => ?_, fun a k x => ?_, fun a t v w q => ?_⟩
  · rw [plaqSpatial_gauge, mul_comm (Ω x), mul_inv_cancel_right]
  · rw [plaqLongSpatial_gauge, mul_comm (Ω (t, v, q)), mul_inv_cancel_right]
  · rw [plaqMixed_gauge, mul_comm (Ω x), mul_inv_cancel_right]
  · rw [plaqMixedLong_gauge, mul_comm (Ω (t, v, q)), mul_inv_cancel_right]

/-- `∏ i ∈ s, g ^ f i = g ^ ∑ i ∈ s, f i`. -/
lemma prod_zpow_eq_zpow_sum' {ι : Type*} (s : Finset ι) (g : Gp) (f : ι → ℤ) :
    ∏ i ∈ s, g ^ f i = g ^ ∑ i ∈ s, f i := by
  classical
  refine Finset.induction_on s (by simp) ?_
  intro a s ha ih
  rw [Finset.prod_insert ha, Finset.sum_insert ha, ih, zpow_add]

/-- Monomial of mixed transverse plaquettes with integer charges `n a k x`: the term of the
character expansion with all spatial and longitudinal plaquette charges equal to zero. -/
def mixedMonomial (C : GaugeConfig p l Gp) (n : Fin 2 → Fin 2 → GSite p l → ℤ) : Gp :=
  ∏ a, ∏ k, ∏ x, C.plaqMixed a k x ^ n a k x

/-- Net plaquette charge flowing into the node `y` of the affine-shift graph in column `k`:
inflow along the branch edges `x → branchSite a x = y`, minus outflow from `y`. -/
def netCharge (n : Fin 2 → Fin 2 → GSite p l → ℤ) (k : Fin 2) (y : GSite p l) : ℤ :=
  (∑ a, ∑ x ∈ Finset.univ.filter (fun x => branchSite a x = y), n a k x) - ∑ a, n a k y

/-- The factor of the monomial that depends on the branch links only. -/
def VpartOf (V : Fin 2 → GSite p l → Gp) (n : Fin 2 → Fin 2 → GSite p l → ℤ) : Gp :=
  ∏ a, ∏ k, ∏ x, V a x ^ n a k x * (V a (tShift k x))⁻¹ ^ n a k x

/-- **Charge conservation (algebraic core of Proposition 11.7.2).** In a monomial of mixed
transverse plaquettes, the exponent of the transverse link `U k y` is the net plaquette charge
flowing into the node `y` of the affine-shift graph. -/
theorem mixedMonomial_factor (C : GaugeConfig p l Gp) (n : Fin 2 → Fin 2 → GSite p l → ℤ) :
    C.mixedMonomial n = (∏ k, ∏ y, C.U k y ^ netCharge n k y) * VpartOf C.V n := by
  classical
  -- split every plaquette power into its branch-link part and its transverse-link part
  have hsplit : ∀ a k x, C.plaqMixed a k x ^ n a k x =
      (C.V a x ^ n a k x * (C.V a (tShift k x))⁻¹ ^ n a k x) *
        (C.U k (branchSite a x) ^ n a k x * (C.U k x)⁻¹ ^ n a k x) := by
    intro a k x
    simp only [plaqMixed, mul_zpow]
    ac_rfl
  have h1 : C.mixedMonomial n =
      (∏ a, ∏ k, ∏ x, C.U k (branchSite a x) ^ n a k x * (C.U k x)⁻¹ ^ n a k x) *
        VpartOf C.V n := by
    rw [mul_comm _ (VpartOf C.V n)]
    simp only [mixedMonomial, VpartOf, hsplit, Finset.prod_mul_distrib] <;> ac_rfl
  -- inflow: regroup the branch images by their target node
  have hin : ∀ a k, ∏ x, C.U k (branchSite a x) ^ n a k x =
      ∏ y, C.U k y ^ ∑ x ∈ Finset.univ.filter (fun x => branchSite a x = y), n a k x := by
    intro a k
    rw [← Finset.prod_fiberwise_of_maps_to (s := Finset.univ) (t := Finset.univ) (g := branchSite a)
      (f := fun x => C.U k (branchSite a x) ^ n a k x) (fun x _ => Finset.mem_univ _)]
    refine Finset.prod_congr rfl (fun y _ => ?_)
    rw [← prod_zpow_eq_zpow_sum']
    refine Finset.prod_congr rfl (fun x hx => ?_)
    rw [(Finset.mem_filter.mp hx).2]
  -- outflow
  have hout : ∀ k y, ∏ a, (C.U k y)⁻¹ ^ n a k y = C.U k y ^ (-∑ a, n a k y) := by
    intro k y
    rw [prod_zpow_eq_zpow_sum', inv_zpow']
  rw [h1]
  congr 1
  simp only [Finset.prod_mul_distrib, hin]
  rw [Finset.prod_comm (s := (Finset.univ : Finset (Fin 2)))
      (t := (Finset.univ : Finset (Fin 2)))
      (f := fun a k => ∏ y, C.U k y ^ ∑ x ∈ Finset.univ.filter (fun x => branchSite a x = y),
        n a k x)]
  rw [Finset.prod_comm (s := (Finset.univ : Finset (Fin 2)))
      (t := (Finset.univ : Finset (Fin 2)))
      (f := fun a k => ∏ x, (C.U k x)⁻¹ ^ n a k x)]
  beta_reduce
  rw [← Finset.prod_mul_distrib]
  refine Finset.prod_congr rfl (fun k _ => ?_)
  rw [Finset.prod_comm (s := (Finset.univ : Finset (Fin 2))) (t := (Finset.univ : Finset _))
      (f := fun a y => C.U k y ^ ∑ x ∈ Finset.univ.filter (fun x => branchSite a x = y),
        n a k x)]
  rw [Finset.prod_comm (s := (Finset.univ : Finset (Fin 2))) (t := (Finset.univ : Finset _))
      (f := fun a x => (C.U k x)⁻¹ ^ n a k x)]
  beta_reduce
  rw [← Finset.prod_mul_distrib]
  refine Finset.prod_congr rfl (fun y _ => ?_)
  rw [hout k y, prod_zpow_eq_zpow_sum', ← zpow_add, netCharge, sub_eq_add_neg]

/-- **Character orthogonality over the transverse links**, for a character `χ : Gp →* ℂ`: the
expectation `E` of every character monomial `χ (∏ U k y ^ e k y)` is `1` if all exponents vanish
and `0` otherwise. For `Gp = U(1)` with the inclusion character this is the Haar-measure property
used in Proposition 11.7.2; it is a hypothesis here, not derived from Mathlib's Haar measure. -/
def CharOrthogonalOnLinks (χ : Gp →* ℂ) (E : ((Fin 2 → GSite p l → Gp) → ℂ) →ₗ[ℂ] ℂ) : Prop :=
  ∀ e : Fin 2 → GSite p l → ℤ,
    E (fun U => χ (∏ k, ∏ y, U k y ^ e k y)) = if e = 0 then 1 else 0

/-- **Integrating out the transverse links (Proposition 11.7.2, mixed-plaquette sector).** For a
character-orthogonal expectation `E` over the transverse links, the expectation of a monomial of
mixed transverse plaquettes is the branch-link factor if the plaquette charges form a conserved
flow on the affine-shift graph in every column (`netCharge n = 0`), and `0` otherwise. -/
theorem integrate_transverse_links (χ : Gp →* ℂ) (E : ((Fin 2 → GSite p l → Gp) → ℂ) →ₗ[ℂ] ℂ)
    (hE : CharOrthogonalOnLinks χ E)
    (W : ZMod (p ^ l) → ZMod (p ^ l) → ZMod (p ^ l) → ZMod (p ^ l) × ZMod (p ^ l) → Gp)
    (V : Fin 2 → GSite p l → Gp) (n : Fin 2 → Fin 2 → GSite p l → ℤ) :
    E (fun U => χ ((⟨U, W, V⟩ : GaugeConfig p l Gp).mixedMonomial n)) =
      if netCharge n = 0 then χ (VpartOf V n) else 0 := by
  have h : (fun U => χ ((⟨U, W, V⟩ : GaugeConfig p l Gp).mixedMonomial n)) =
      χ (VpartOf V n) • (fun U => χ (∏ k, ∏ y, U k y ^ netCharge n k y)) := by
    funext U
    rw [mixedMonomial_factor]
    simp only [map_mul, Pi.smul_apply, smul_eq_mul]
    ring
  rw [h, map_smul, hE (netCharge n), smul_eq_mul]
  split_ifs <;> simp

lemma netCharge_eq_zero_iff (n : Fin 2 → Fin 2 → GSite p l → ℤ) :
    netCharge n = 0 ↔ ∀ k y,
      ∑ a, ∑ x ∈ Finset.univ.filter (fun x => branchSite a x = y), n a k x = ∑ a, n a k y := by
  constructor
  · intro h k y
    have := congrFun (congrFun h k) y
    simp only [netCharge, Pi.zero_apply] at this
    linarith
  · intro h
    funext k y
    simp only [netCharge, Pi.zero_apply, h k y, sub_self]

end GaugeConfig

/-- **Unique branch coincidence at `p = 7` (every level).** The two branches agree at `v` exactly
when `v = -2⁻¹`. So at every level there is exactly one doubled edge per time slice, and the
one-step split channel of Proposition 11.7.3(b) has one site at every level. Longer
split-and-remerge channels are not covered by this lemma. -/
theorem branch_coincidence_seven (l : ℕ) (v : ZMod (7 ^ l)) :
    AffineBranch.even.apply 7 l v = AffineBranch.odd.apply 7 l v ↔
      v = -((2 : ZMod (7 ^ l))⁻¹) := by
  have hu : IsUnit ((2 : ℕ) : ZMod (7 ^ l)) := isUnit_natCast_seven (by decide) l
  have h2 : (2 : ZMod (7 ^ l)) * (2 : ZMod (7 ^ l))⁻¹ = 1 := by
    have := ZMod.mul_inv_of_unit _ hu
    simpa using this
  simp only [AffineBranch.apply, AffineBranch.even, AffineBranch.odd, Int.cast_one, Int.cast_zero,
    Int.cast_ofNat, Nat.cast_ofNat, one_mul, add_zero]
  constructor
  · intro h
    have h' : v = 3 * v + 1 := by
      have := congrArg (fun x => (2 : ZMod (7 ^ l)) * x) h
      simpa only [← mul_assoc, h2, one_mul] using this
    have h2v : 2 * v = -1 := by linear_combination (-1 : ZMod (7 ^ l)) * h'
    calc v = (2 : ZMod (7 ^ l))⁻¹ * (2 * v) := by
          rw [← mul_assoc, mul_comm (2 : ZMod (7 ^ l))⁻¹, h2, one_mul]
      _ = -((2 : ZMod (7 ^ l))⁻¹) := by rw [h2v]; ring
  · intro h
    rw [h]
    congr 1
    linear_combination h2

end AffineShiftGaugeModel

/-! ### Section 13: The Order-λ² Operator at p = 7 (manuscript Proposition 11.7.5)

Manuscript Lemma 11.7.4 and Proposition 11.7.5(a) identify the order-λ² coefficient of the
branch-frozen column correlator with the operator
`G⁽²⁾_l(D) = Σ_{k<D} (Lᵏ R L^{D-1-k} - (3/8) Lᵏ E L^{D-k}) + S Lᴰ + Lᴰ S′`
built from `L = sigmaOne7 l`, the branch maps and their inverses. That identification is a statement
about the Villain flow expansion, which is not formalized; here the operator is a definition
(`lamSqCoeff`). This section proves, for that operator:
(13a) inverse branches at every level and their compatibility with the tower projections;
(13b) the closed form of Proposition 11.7.5(b) for constant insertions:
      `𝔼_l[G⁽²⁾_l(D) 1] = 3/4 + 3D/16 - (3/4 + 9D/16) / 7ˡ` (`lamSqCoeff_const`);
(13c) Proposition 11.7.5(c): the operator `G⁽²⁾_∞` without the `v*`-exclusions commutes with
      inflation, so its smeared values on lifted insertions do not depend on the level
      (`lamSqCoeffInf_lift`), and the `v*`-corrections are bounded by
      `(3/16)(3D + 4) · ‖A‖_∞ ‖B‖_∞ / 7ˡ` (`lamSqCoeff_sub_bound`, `lamSqCoeff_level_uniform`).
Weights: `w₀ = 1/4`, `w₁ = 3/4`, so `w₀w₁ = 3/16`, `2w₀w₁ = 3/8`, `w₀²w₁ = 3/64`, `w₁²w₀ = 9/64`. -/

section LambdaSquareSeven

open Finset BigOperators

/-- Even branch `v ↦ 2⁻¹ v` on `ZMod (7 ^ l)`. -/
def sB0 (l : ℕ) (v : ZMod (7 ^ l)) : ZMod (7 ^ l) := (2 : ZMod (7 ^ l))⁻¹ * v

/-- Odd branch `v ↦ 2⁻¹ (3 v + 1)` on `ZMod (7 ^ l)`. -/
def sB1 (l : ℕ) (v : ZMod (7 ^ l)) : ZMod (7 ^ l) := (2 : ZMod (7 ^ l))⁻¹ * (3 * v + 1)

/-- Inverse of the even branch: `w ↦ 2 w`. -/
def sI0 (l : ℕ) (w : ZMod (7 ^ l)) : ZMod (7 ^ l) := 2 * w

/-- Inverse of the odd branch: `w ↦ 3⁻¹ (2 w - 1)`. -/
def sI1 (l : ℕ) (w : ZMod (7 ^ l)) : ZMod (7 ^ l) := (3 : ZMod (7 ^ l))⁻¹ * (2 * w - 1)

lemma sev_two_mul_inv (l : ℕ) : (2 : ZMod (7 ^ l)) * (2 : ZMod (7 ^ l))⁻¹ = 1 := by
  have := ZMod.mul_inv_of_unit _ (isUnit_natCast_seven (a := 2) (by decide) l)
  simpa using this

lemma sev_three_mul_inv (l : ℕ) : (3 : ZMod (7 ^ l)) * (3 : ZMod (7 ^ l))⁻¹ = 1 := by
  have := ZMod.mul_inv_of_unit _ (isUnit_natCast_seven (a := 3) (by decide) l)
  simpa using this

lemma sB0_sI0 (l : ℕ) (w : ZMod (7 ^ l)) : sB0 l (sI0 l w) = w := by
  unfold sB0 sI0
  linear_combination w * (by rw [mul_comm]; exact sev_two_mul_inv l :
    (2 : ZMod (7 ^ l))⁻¹ * 2 = 1)

lemma sI0_sB0 (l : ℕ) (v : ZMod (7 ^ l)) : sI0 l (sB0 l v) = v := by
  unfold sB0 sI0
  linear_combination v * sev_two_mul_inv l

lemma sB1_sI1 (l : ℕ) (w : ZMod (7 ^ l)) : sB1 l (sI1 l w) = w := by
  unfold sB1 sI1
  linear_combination ((2 : ZMod (7 ^ l))⁻¹ * (2 * w - 1)) * sev_three_mul_inv l +
    w * (by rw [mul_comm]; exact sev_two_mul_inv l : (2 : ZMod (7 ^ l))⁻¹ * 2 = 1)

lemma sI1_sB1 (l : ℕ) (v : ZMod (7 ^ l)) : sI1 l (sB1 l v) = v := by
  unfold sB1 sI1
  linear_combination ((3 : ZMod (7 ^ l))⁻¹ * (3 * v + 1)) * sev_two_mul_inv l +
    v * (by rw [mul_comm]; exact sev_three_mul_inv l : (3 : ZMod (7 ^ l))⁻¹ * 3 = 1)

/-- The even branch as a permutation of `ZMod (7 ^ l)`. -/
def sE0 (l : ℕ) : ZMod (7 ^ l) ≃ ZMod (7 ^ l) := ⟨sB0 l, sI0 l, sI0_sB0 l, sB0_sI0 l⟩

/-- The odd branch as a permutation of `ZMod (7 ^ l)`. -/
def sE1 (l : ℕ) : ZMod (7 ^ l) ≃ ZMod (7 ^ l) := ⟨sB1 l, sI1 l, sI1_sB1 l, sB1_sI1 l⟩

/-- `sigmaOne7` in terms of `sB0`, `sB1`. -/
lemma sigmaOne7_apply' (l : ℕ) (f : ZMod (7 ^ l) → ℂ) (v : ZMod (7 ^ l)) :
    sigmaOne7 l f v = 1 / 4 * f (sB0 l v) + 3 / 4 * f (sB1 l v) := by
  simp [sigmaOne7, affineTransfer_apply, AffineBranch.apply, AffineBranch.even,
    AffineBranch.odd, sB0, sB1]

/-- The coincidence point `v* = -2⁻¹` and its image `h* = B₀ v* = B₁ v*`. -/
def sVstar (l : ℕ) : ZMod (7 ^ l) := -((2 : ZMod (7 ^ l))⁻¹)

def sHstar (l : ℕ) : ZMod (7 ^ l) := sB0 l (sVstar l)

lemma sB1_sVstar (l : ℕ) : sB1 l (sVstar l) = sHstar l := by
  have h := (branch_coincidence_seven l (sVstar l)).mpr rfl
  have e0 : AffineBranch.even.apply 7 l (sVstar l) = sB0 l (sVstar l) := by
    simp [AffineBranch.apply, AffineBranch.even, sB0]
  have e1 : AffineBranch.odd.apply 7 l (sVstar l) = sB1 l (sVstar l) := by
    simp [AffineBranch.apply, AffineBranch.odd, sB1]
  rw [e0, e1] at h
  exact h.symm

/-- The exclusion in `S` of manuscript §11.7, `B_c⁻¹ v ≠ v*`, is `v ≠ h*` for both branches. -/
lemma sI0_eq_sVstar_iff (l : ℕ) (v : ZMod (7 ^ l)) : sI0 l v = sVstar l ↔ v = sHstar l := by
  constructor
  · intro h; unfold sHstar; rw [← h, sB0_sI0]
  · intro h; rw [h, sHstar, sI0_sB0]

lemma sI1_eq_sVstar_iff (l : ℕ) (v : ZMod (7 ^ l)) : sI1 l v = sVstar l ↔ v = sHstar l := by
  constructor
  · intro h; rw [← sB1_sVstar, ← h, sB1_sI1]
  · intro h; rw [h, ← sB1_sVstar, sI1_sB1]

section Projections

variable {j k : ℕ} (hk : k ≤ j)

lemma projPow_sev_two_inv : projPow 7 j k hk ((2 : ZMod (7 ^ j))⁻¹) = (2 : ZMod (7 ^ k))⁻¹ := by
  have := projPow_inv_natCast 7 hk (u := 2) (by decide)
  simpa using this

lemma projPow_sev_three_inv :
    projPow 7 j k hk ((3 : ZMod (7 ^ j))⁻¹) = (3 : ZMod (7 ^ k))⁻¹ := by
  have := projPow_inv_natCast 7 hk (u := 3) (by decide)
  simpa using this

lemma projPow_sB0 (v : ZMod (7 ^ j)) : projPow 7 j k hk (sB0 j v) = sB0 k (projPow 7 j k hk v) := by
  simp only [sB0, map_mul, projPow_sev_two_inv hk]

lemma projPow_sB1 (v : ZMod (7 ^ j)) : projPow 7 j k hk (sB1 j v) = sB1 k (projPow 7 j k hk v) := by
  simp only [sB1, map_mul, map_add, map_one, map_ofNat, projPow_sev_two_inv hk]

lemma projPow_sI0 (v : ZMod (7 ^ j)) : projPow 7 j k hk (sI0 j v) = sI0 k (projPow 7 j k hk v) := by
  simp only [sI0, map_mul, map_ofNat]

lemma projPow_sI1 (v : ZMod (7 ^ j)) : projPow 7 j k hk (sI1 j v) = sI1 k (projPow 7 j k hk v) := by
  simp only [sI1, map_mul, map_sub, map_one, map_ofNat, projPow_sev_three_inv hk]

end Projections

/-- Composition operator `f ↦ f ∘ g`. -/
def sevComp {l : ℕ} (g : ZMod (7 ^ l) → ZMod (7 ^ l)) : Module.End ℂ (ZMod (7 ^ l) → ℂ) where
  toFun f v := f (g v)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- `f ↦ f` off the point `s`, `0` at `s`. -/
def sevOff {l : ℕ} (s : ZMod (7 ^ l)) : Module.End ℂ (ZMod (7 ^ l) → ℂ) where
  toFun f v := if v = s then 0 else f v
  map_add' f g := by
    funext v
    by_cases h : v = s <;> simp [h]
  map_smul' c f := by
    funext v
    by_cases h : v = s <;> simp [h]

/-- `f ↦ f(s) · 1_{s}`. -/
def sevAt {l : ℕ} (s : ZMod (7 ^ l)) : Module.End ℂ (ZMod (7 ^ l) → ℂ) where
  toFun f v := if v = s then f s else 0
  map_add' f g := by
    funext v
    by_cases h : v = s <;> simp [h]
  map_smul' c f := by
    funext v
    by_cases h : v = s <;> simp [h]

lemma sevComp_apply {l : ℕ} (g : ZMod (7 ^ l) → ZMod (7 ^ l)) (f : ZMod (7 ^ l) → ℂ)
    (v : ZMod (7 ^ l)) : sevComp g f v = f (g v) := rfl

lemma sevOff_apply {l : ℕ} (s : ZMod (7 ^ l)) (f : ZMod (7 ^ l) → ℂ) (v : ZMod (7 ^ l)) :
    sevOff s f v = if v = s then 0 else f v := rfl

lemma sevAt_apply {l : ℕ} (s : ZMod (7 ^ l)) (f : ZMod (7 ^ l) → ℂ) (v : ZMod (7 ^ l)) :
    sevAt s f v = if v = s then f s else 0 := rfl

lemma sevOff_eq_sub_sevAt {l : ℕ} (s : ZMod (7 ^ l)) (f : ZMod (7 ^ l) → ℂ) :
    sevOff s f = f - sevAt s f := by
  funext v
  by_cases h : v = s
  · subst h; simp [sevOff_apply, sevAt_apply]
  · simp [sevOff_apply, sevAt_apply, h]

/-- `R₀`: backtrack operator without exclusion, `Σ_a w_a² w_{1-a} f(B_a B_{1-a}⁻¹ B_a y)`. -/
noncomputable def sevR0 (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  (3 / 64 : ℂ) • sevComp (fun y => sB0 l (sI1 l (sB0 l y))) +
    (9 / 64 : ℂ) • sevComp (fun y => sB1 l (sI0 l (sB1 l y)))

/-- `S₀`: backward-start operator without exclusion, `w₀w₁ Σ_c f(B_{1-c} B_c⁻¹ v)`. -/
noncomputable def sevS0 (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  (3 / 16 : ℂ) • (sevComp (fun v => sB1 l (sI0 l v)) + sevComp (fun v => sB0 l (sI1 l v)))

/-- `S′₀`: overshoot operator without exclusion, `w₀w₁ Σ_b f(B_{1-b}⁻¹ B_b x)`. -/
noncomputable def sevT0 (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  (3 / 16 : ℂ) • (sevComp (fun x => sI1 l (sB0 l x)) + sevComp (fun x => sI0 l (sB1 l x)))

/-- `R`, `S`, `S′`, `E` of manuscript §11.7 (with the `v*`-exclusions; see `sI0_eq_sVstar_iff`). -/
noncomputable def sevR (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) := sevOff (sVstar l) * sevR0 l
noncomputable def sevS (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) := sevOff (sHstar l) * sevS0 l
noncomputable def sevT (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) := sevOff (sVstar l) * sevT0 l
noncomputable def sevE (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) := sevAt (sVstar l)

/-- **The order-λ² operator** `G⁽²⁾_l(D)` of Proposition 11.7.5(a) (here a definition). -/
noncomputable def lamSqCoeff (l D : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  (∑ k ∈ range D, (sigmaOne7 l ^ k * sevR l * sigmaOne7 l ^ (D - 1 - k) -
      (3 / 8 : ℂ) • (sigmaOne7 l ^ k * sevE l * sigmaOne7 l ^ (D - k)))) +
    sevS l * sigmaOne7 l ^ D + sigmaOne7 l ^ D * sevT l

/-- The level-independent part `G⁽²⁾_∞(D)`: no exclusions, no `E`-terms. -/
noncomputable def lamSqCoeffInf (l D : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  (∑ k ∈ range D, sigmaOne7 l ^ k * sevR0 l * sigmaOne7 l ^ (D - 1 - k)) +
    sevS0 l * sigmaOne7 l ^ D + sigmaOne7 l ^ D * sevT0 l

/-- The Haar pairing `𝔼_l[A · f]`. -/
noncomputable def sevPair (l : ℕ) (A f : ZMod (7 ^ l) → ℂ) : ℂ :=
  haarExpectation 7 l (fun v => A v * f v)

lemma sevPair_add (l : ℕ) (A f g : ZMod (7 ^ l) → ℂ) :
    sevPair l A (f + g) = sevPair l A f + sevPair l A g := by
  simp only [sevPair, haarExpectation, Pi.add_apply, mul_add, Finset.sum_add_distrib]

lemma sevPair_sub (l : ℕ) (A f g : ZMod (7 ^ l) → ℂ) :
    sevPair l A (f - g) = sevPair l A f - sevPair l A g := by
  simp only [sevPair, haarExpectation, Pi.sub_apply, mul_sub, Finset.sum_sub_distrib]

lemma sevPair_smul (l : ℕ) (A f : ZMod (7 ^ l) → ℂ) (c : ℂ) :
    sevPair l A (c • f) = c * sevPair l A f := by
  simp only [sevPair, haarExpectation, Pi.smul_apply, smul_eq_mul, Finset.mul_sum]
  exact Finset.sum_congr rfl (fun v _ => by ring)

lemma sevPair_sum (l : ℕ) (A : ZMod (7 ^ l) → ℂ) (s : Finset ℕ) (F : ℕ → ZMod (7 ^ l) → ℂ) :
    sevPair l A (∑ i ∈ s, F i) = ∑ i ∈ s, sevPair l A (F i) := by
  simp only [sevPair, haarExpectation, Finset.sum_apply, Finset.mul_sum]
  exact Finset.sum_comm

lemma sevPair_off (l : ℕ) (A f : ZMod (7 ^ l) → ℂ) (s : ZMod (7 ^ l)) :
    sevPair l A (sevOff s f) = sevPair l A f - sevPair l A (sevAt s f) := by
  rw [sevOff_eq_sub_sevAt, sevPair_sub]

/-- Pairing with a function supported at one point. -/
lemma sevPair_at (l : ℕ) (A f : ZMod (7 ^ l) → ℂ) (s : ZMod (7 ^ l)) :
    sevPair l A (sevAt s f) = A s * f s / ((7 : ℕ) : ℂ) ^ l := by
  simp only [sevPair, haarExpectation, sevAt_apply, mul_ite, mul_zero, Finset.sum_ite_eq',
    Finset.mem_univ, if_true]
  ring

lemma sevPair_const_one (l : ℕ) (c : ℂ) : sevPair l (fun _ => 1) (fun _ => c) = c := by
  have hne : ((7 : ℕ) : ℂ) ^ l ≠ 0 := pow_ne_zero _ (by norm_num)
  simp only [sevPair, haarExpectation, one_mul, Finset.sum_const, Finset.card_univ, ZMod.card,
    nsmul_eq_mul]
  push_cast
  field_simp

/-- Adjoint of `sigmaOne7` for the Haar pairing: `f ↦ ¼ f(B₀⁻¹ v) + ¾ f(B₁⁻¹ v)`. -/
noncomputable def sevAdj (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) where
  toFun A v := 1 / 4 * A (sI0 l v) + 3 / 4 * A (sI1 l v)
  map_add' f g := by
    funext v
    simp only [Pi.add_apply]
    ring
  map_smul' c f := by
    funext v
    simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply]
    ring

lemma sevAdj_apply (l : ℕ) (A : ZMod (7 ^ l) → ℂ) (v : ZMod (7 ^ l)) :
    sevAdj l A v = 1 / 4 * A (sI0 l v) + 3 / 4 * A (sI1 l v) := rfl

lemma sum_comp_sB0 (l : ℕ) (F : ZMod (7 ^ l) → ℂ) :
    ∑ v, F (sB0 l v) = ∑ v, F v := Equiv.sum_comp (sE0 l) F

lemma sum_comp_sB1 (l : ℕ) (F : ZMod (7 ^ l) → ℂ) :
    ∑ v, F (sB1 l v) = ∑ v, F v := Equiv.sum_comp (sE1 l) F

lemma sevPair_sigmaOne7 (l : ℕ) (A g : ZMod (7 ^ l) → ℂ) :
    sevPair l A (sigmaOne7 l g) = sevPair l (sevAdj l A) g := by
  have h0 : ∑ v, A v * g (sB0 l v) = ∑ v, A (sI0 l v) * g v := by
    rw [← sum_comp_sB0 l (fun w => A (sI0 l w) * g w)]
    exact Finset.sum_congr rfl (fun v _ => by simp only [sI0_sB0])
  have h1 : ∑ v, A v * g (sB1 l v) = ∑ v, A (sI1 l v) * g v := by
    rw [← sum_comp_sB1 l (fun w => A (sI1 l w) * g w)]
    exact Finset.sum_congr rfl (fun v _ => by simp only [sI1_sB1])
  have e1 : ∑ v, A v * (1 / 4 * g (sB0 l v) + 3 / 4 * g (sB1 l v)) =
      1 / 4 * ∑ v, A v * g (sB0 l v) + 3 / 4 * ∑ v, A v * g (sB1 l v) := by
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl (fun v _ => by ring)
  have e2 : ∑ v, (1 / 4 * A (sI0 l v) + 3 / 4 * A (sI1 l v)) * g v =
      1 / 4 * ∑ v, A (sI0 l v) * g v + 3 / 4 * ∑ v, A (sI1 l v) * g v := by
    rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl (fun v _ => by ring)
  simp only [sevPair, haarExpectation, sigmaOne7_apply', sevAdj_apply]
  rw [e1, e2, h0, h1]

lemma sevPair_pow (l : ℕ) (A g : ZMod (7 ^ l) → ℂ) (n : ℕ) :
    sevPair l A ((sigmaOne7 l ^ n) g) = sevPair l ((sevAdj l ^ n) A) g := by
  induction n generalizing A g with
  | zero => simp only [pow_zero, Module.End.one_apply]
  | succ n ih =>
    rw [pow_succ (sigmaOne7 l) n, Module.End.mul_apply, ih, sevPair_sigmaOne7,
      pow_succ' (sevAdj l) n, Module.End.mul_apply]

lemma sevAdj_const_one (l : ℕ) : sevAdj l (fun _ => 1) = fun _ => 1 := by
  funext v
  simp only [sevAdj_apply]
  norm_num

lemma sevAdj_pow_const_one (l n : ℕ) : (sevAdj l ^ n) (fun _ => 1) = fun _ => 1 :=
  pow_apply_const_one 7 (fun l => sevAdj l) l (sevAdj_const_one l) n

/-- **Proposition 11.7.5(b) for the operator.** For constant insertions,
`𝔼_l[1 · G⁽²⁾_l(D) 1] = 3/4 + 3D/16 - (3/4 + 9D/16) / 7ˡ`. -/
theorem lamSqCoeff_const (l D : ℕ) :
    sevPair l (fun _ => 1) (lamSqCoeff l D (fun _ => 1)) =
      3 / 4 + 3 * (D : ℂ) / 16 - (3 / 4 + 9 * (D : ℂ) / 16) / ((7 : ℕ) : ℂ) ^ l := by
  have hne : ((7 : ℕ) : ℂ) ^ l ≠ 0 := pow_ne_zero _ (by norm_num)
  have hL : ∀ n, (sigmaOne7 l ^ n) (fun _ => (1 : ℂ)) = fun _ => 1 :=
    fun n => pow_apply_const_one 7 sigmaOne7 l (sigmaOne7_const_one l) n
  have hP : ∀ n (g : ZMod (7 ^ l) → ℂ),
      sevPair l (fun _ => 1) ((sigmaOne7 l ^ n) g) = sevPair l (fun _ => 1) g := by
    intro n g
    rw [sevPair_pow, sevAdj_pow_const_one]
  have hR0 : sevR0 l (fun _ => 1) = fun _ => 3 / 16 := by
    funext v
    simp only [sevR0, LinearMap.add_apply, LinearMap.smul_apply, Pi.add_apply, Pi.smul_apply,
      sevComp_apply, smul_eq_mul]
    norm_num
  have hS0 : sevS0 l (fun _ => 1) = fun _ => 3 / 8 := by
    funext v
    simp only [sevS0, LinearMap.add_apply, LinearMap.smul_apply, Pi.add_apply, Pi.smul_apply,
      sevComp_apply, smul_eq_mul]
    norm_num
  have hT0 : sevT0 l (fun _ => 1) = fun _ => 3 / 8 := by
    funext v
    simp only [sevT0, LinearMap.add_apply, LinearMap.smul_apply, Pi.add_apply, Pi.smul_apply,
      sevComp_apply, smul_eq_mul]
    norm_num
  have hoff : ∀ (s : ZMod (7 ^ l)) (c : ℂ),
      sevPair l (fun _ => 1) (sevOff s (fun _ => c)) = c - c / ((7 : ℕ) : ℂ) ^ l := by
    intro s c
    rw [sevPair_off, sevPair_const_one, sevPair_at]
    ring
  have hRterm : sevPair l (fun _ => 1) (sevR l (fun _ => 1)) =
      3 / 16 - 3 / 16 / ((7 : ℕ) : ℂ) ^ l := by
    rw [sevR, Module.End.mul_apply, hR0, hoff]
  have hEterm : sevPair l (fun _ => 1) (sevE l (fun _ => 1)) = 1 / ((7 : ℕ) : ℂ) ^ l := by
    rw [sevE, sevPair_at]
    ring
  have hSterm : sevPair l (fun _ => 1) (sevS l (fun _ => 1)) =
      3 / 8 - 3 / 8 / ((7 : ℕ) : ℂ) ^ l := by
    rw [sevS, Module.End.mul_apply, hS0, hoff]
  have hTterm : sevPair l (fun _ => 1) (sevT l (fun _ => 1)) =
      3 / 8 - 3 / 8 / ((7 : ℕ) : ℂ) ^ l := by
    rw [sevT, Module.End.mul_apply, hT0, hoff]
  have hk : ∀ k ∈ range D,
      sevPair l (fun _ => 1) ((sigmaOne7 l ^ k * sevR l * sigmaOne7 l ^ (D - 1 - k) -
        (3 / 8 : ℂ) • (sigmaOne7 l ^ k * sevE l * sigmaOne7 l ^ (D - k))) (fun _ => 1)) =
      (3 / 16 - 3 / 16 / ((7 : ℕ) : ℂ) ^ l) - 3 / 8 * (1 / ((7 : ℕ) : ℂ) ^ l) := by
    intro k _
    rw [LinearMap.sub_apply, LinearMap.smul_apply, sevPair_sub, sevPair_smul,
      Module.End.mul_apply, Module.End.mul_apply, Module.End.mul_apply, Module.End.mul_apply,
      hL, hL, hP, hP, hRterm, hEterm]
  rw [lamSqCoeff, LinearMap.add_apply, LinearMap.add_apply, LinearMap.sum_apply, sevPair_add,
    sevPair_add, sevPair_sum, Finset.sum_congr rfl hk, Finset.sum_const, Finset.card_range,
    nsmul_eq_mul, Module.End.mul_apply, Module.End.mul_apply, hL, hP, hSterm, hTterm]
  field_simp
  ring

/-- Inflation compatibility of `R₀`, `S₀`, `S′₀`. -/
lemma sevR0_liftPow {j k : ℕ} (hk : k ≤ j) (g : ZMod (7 ^ k) → ℂ) :
    sevR0 j (liftPow 7 j k hk g) = liftPow 7 j k hk (sevR0 k g) := by
  funext v
  simp only [sevR0, LinearMap.add_apply, LinearMap.smul_apply, Pi.add_apply, Pi.smul_apply,
    sevComp_apply, liftPow, LinearMap.coe_mk, AddHom.coe_mk, projPow_sB0 hk, projPow_sB1 hk,
    projPow_sI0 hk, projPow_sI1 hk]

lemma sevS0_liftPow {j k : ℕ} (hk : k ≤ j) (g : ZMod (7 ^ k) → ℂ) :
    sevS0 j (liftPow 7 j k hk g) = liftPow 7 j k hk (sevS0 k g) := by
  funext v
  simp only [sevS0, LinearMap.add_apply, LinearMap.smul_apply, Pi.add_apply, Pi.smul_apply,
    sevComp_apply, liftPow, LinearMap.coe_mk, AddHom.coe_mk, projPow_sB0 hk, projPow_sB1 hk,
    projPow_sI0 hk, projPow_sI1 hk]

lemma sevT0_liftPow {j k : ℕ} (hk : k ≤ j) (g : ZMod (7 ^ k) → ℂ) :
    sevT0 j (liftPow 7 j k hk g) = liftPow 7 j k hk (sevT0 k g) := by
  funext v
  simp only [sevT0, LinearMap.add_apply, LinearMap.smul_apply, Pi.add_apply, Pi.smul_apply,
    sevComp_apply, liftPow, LinearMap.coe_mk, AddHom.coe_mk, projPow_sB0 hk, projPow_sB1 hk,
    projPow_sI0 hk, projPow_sI1 hk]

lemma lamSqCoeffInf_liftPow {j k : ℕ} (hk : k ≤ j) (D : ℕ) (g : ZMod (7 ^ k) → ℂ) :
    lamSqCoeffInf j D (liftPow 7 j k hk g) = liftPow 7 j k hk (lamSqCoeffInf k D g) := by
  simp only [lamSqCoeffInf, LinearMap.add_apply, LinearMap.sum_apply, Module.End.mul_apply,
    map_add, map_sum, pow_liftPow_of_intertwines 7 sigmaOne7 sigmaOne7_intertwines hk,
    sevR0_liftPow hk, sevS0_liftPow hk, sevT0_liftPow hk]

/-- **Proposition 11.7.5(c), level independence.** On insertions lifted from level `k`, the
smeared value of `G⁽²⁾_∞` at any level `j ≥ k` equals its value at level `k`. -/
theorem lamSqCoeffInf_lift {j k : ℕ} (hk : k ≤ j) (D : ℕ) (A B : ZMod (7 ^ k) → ℂ) :
    sevPair j (liftPow 7 j k hk A) (lamSqCoeffInf j D (liftPow 7 j k hk B)) =
      sevPair k A (lamSqCoeffInf k D B) := by
  rw [lamSqCoeffInf_liftPow]
  show haarExpectation 7 j (liftPow 7 j k hk (fun v => A v * lamSqCoeffInf k D B v)) = _
  exact haarExpectation_liftPow 7 hk _

lemma norm_ofReal_nonneg' {x : ℝ} (hx : 0 ≤ x) : ‖(x : ℂ)‖ = x := by
  rw [Complex.norm_real, Real.norm_of_nonneg hx]

lemma sev_norm_const {q : ℝ} (hq : 0 ≤ q) {c : ℂ} (hc : c = (q : ℂ)) : ‖c‖ = q := by
  rw [hc, norm_ofReal_nonneg' hq]

lemma sevAdj_pow_bound (l n : ℕ) (A : ZMod (7 ^ l) → ℂ) (a : ℝ) (hA : ∀ v, ‖A v‖ ≤ a) :
    ∀ v, ‖(sevAdj l ^ n) A v‖ ≤ a := by
  induction n with
  | zero => simpa only [pow_zero, Module.End.one_apply] using hA
  | succ n ih =>
    intro v
    rw [pow_succ', Module.End.mul_apply, sevAdj_apply]
    have h1 := sev_norm_const (q := 1 / 4) (by norm_num) (c := (1 / 4 : ℂ)) (by simp)
    have h3 := sev_norm_const (q := 3 / 4) (by norm_num) (c := (3 / 4 : ℂ)) (by simp)
    have := norm_add_le (1 / 4 * (sevAdj l ^ n) A (sI0 l v)) (3 / 4 * (sevAdj l ^ n) A (sI1 l v))
    rw [norm_mul, norm_mul, h1, h3] at this
    linarith [ih (sI0 l v), ih (sI1 l v)]

lemma sigmaOne7_pow_bound (l n : ℕ) (B : ZMod (7 ^ l) → ℂ) (b : ℝ) (hB : ∀ v, ‖B v‖ ≤ b) :
    ∀ v, ‖(sigmaOne7 l ^ n) B v‖ ≤ b := by
  induction n with
  | zero => simpa only [pow_zero, Module.End.one_apply] using hB
  | succ n ih =>
    intro v
    rw [pow_succ', Module.End.mul_apply, sigmaOne7_apply']
    have h1 := sev_norm_const (q := 1 / 4) (by norm_num) (c := (1 / 4 : ℂ)) (by simp)
    have h3 := sev_norm_const (q := 3 / 4) (by norm_num) (c := (3 / 4 : ℂ)) (by simp)
    have := norm_add_le (1 / 4 * (sigmaOne7 l ^ n) B (sB0 l v))
      (3 / 4 * (sigmaOne7 l ^ n) B (sB1 l v))
    rw [norm_mul, norm_mul, h1, h3] at this
    linarith [ih (sB0 l v), ih (sB1 l v)]

lemma sevR0_bound (l : ℕ) (h : ZMod (7 ^ l) → ℂ) (b : ℝ) (hb : ∀ v, ‖h v‖ ≤ b)
    (v : ZMod (7 ^ l)) : ‖sevR0 l h v‖ ≤ 3 / 16 * b := by
  simp only [sevR0, LinearMap.add_apply, LinearMap.smul_apply, Pi.add_apply, Pi.smul_apply,
    sevComp_apply, smul_eq_mul]
  have c1 := sev_norm_const (q := 3 / 64) (by norm_num) (c := (3 / 64 : ℂ)) (by simp)
  have c2 := sev_norm_const (q := 9 / 64) (by norm_num) (c := (9 / 64 : ℂ)) (by simp)
  have := norm_add_le ((3 / 64 : ℂ) * h (sB0 l (sI1 l (sB0 l v))))
    ((9 / 64 : ℂ) * h (sB1 l (sI0 l (sB1 l v))))
  rw [norm_mul, norm_mul, c1, c2] at this
  linarith [hb (sB0 l (sI1 l (sB0 l v))), hb (sB1 l (sI0 l (sB1 l v)))]

lemma sevS0_bound (l : ℕ) (h : ZMod (7 ^ l) → ℂ) (b : ℝ) (hb : ∀ v, ‖h v‖ ≤ b)
    (v : ZMod (7 ^ l)) : ‖sevS0 l h v‖ ≤ 3 / 8 * b := by
  simp only [sevS0, LinearMap.smul_apply, LinearMap.add_apply, Pi.add_apply, Pi.smul_apply,
    sevComp_apply, smul_eq_mul]
  have c := sev_norm_const (q := 3 / 16) (by norm_num) (c := (3 / 16 : ℂ)) (by simp)
  rw [norm_mul, c]
  have := norm_add_le (h (sB1 l (sI0 l v))) (h (sB0 l (sI1 l v)))
  nlinarith [hb (sB1 l (sI0 l v)), hb (sB0 l (sI1 l v)), norm_nonneg (h (sB1 l (sI0 l v)) +
    h (sB0 l (sI1 l v)))]

lemma sevT0_bound (l : ℕ) (h : ZMod (7 ^ l) → ℂ) (b : ℝ) (hb : ∀ v, ‖h v‖ ≤ b)
    (v : ZMod (7 ^ l)) : ‖sevT0 l h v‖ ≤ 3 / 8 * b := by
  simp only [sevT0, LinearMap.smul_apply, LinearMap.add_apply, Pi.add_apply, Pi.smul_apply,
    sevComp_apply, smul_eq_mul]
  have c := sev_norm_const (q := 3 / 16) (by norm_num) (c := (3 / 16 : ℂ)) (by simp)
  rw [norm_mul, c]
  have := norm_add_le (h (sI1 l (sB0 l v))) (h (sI0 l (sB1 l v)))
  nlinarith [hb (sI1 l (sB0 l v)), hb (sI0 l (sB1 l v)), norm_nonneg (h (sI1 l (sB0 l v)) +
    h (sI0 l (sB1 l v)))]

lemma sevPair_at_le (l : ℕ) (X g : ZMod (7 ^ l) → ℂ) (s : ZMod (7 ^ l)) {a c : ℝ}
    (hX : ‖X s‖ ≤ a) (hg : ‖g s‖ ≤ c) (ha : 0 ≤ a) :
    ‖sevPair l X (sevAt s g)‖ ≤ a * c / (7 : ℝ) ^ l := by
  have hm : ‖((7 : ℕ) : ℂ) ^ l‖ = (7 : ℝ) ^ l := by simp
  rw [sevPair_at, norm_div, norm_mul, hm, div_eq_mul_inv, div_eq_mul_inv]
  exact mul_le_mul_of_nonneg_right (mul_le_mul hX hg (norm_nonneg _) ha)
    (inv_nonneg.mpr (by positivity))

/-- The difference `G⁽²⁾_∞ - G⁽²⁾_l` as a sum of pairings with point-supported functions. -/
lemma lamSqCoeff_diff (l D : ℕ) (A B : ZMod (7 ^ l) → ℂ) :
    sevPair l A (lamSqCoeffInf l D B) - sevPair l A (lamSqCoeff l D B) =
      (∑ k ∈ range D, (sevPair l ((sevAdj l ^ k) A)
          (sevAt (sVstar l) (sevR0 l ((sigmaOne7 l ^ (D - 1 - k)) B))) +
        3 / 8 * sevPair l ((sevAdj l ^ k) A) (sevAt (sVstar l) ((sigmaOne7 l ^ (D - k)) B)))) +
      sevPair l A (sevAt (sHstar l) (sevS0 l ((sigmaOne7 l ^ D) B))) +
      sevPair l ((sevAdj l ^ D) A) (sevAt (sVstar l) (sevT0 l B)) := by
  simp only [lamSqCoeffInf, lamSqCoeff, LinearMap.add_apply, LinearMap.sum_apply,
    LinearMap.sub_apply, LinearMap.smul_apply, Module.End.mul_apply, sevPair_add, sevPair_sum,
    sevPair_sub, sevPair_smul, sevPair_pow, sevR, sevS, sevT, sevE, sevPair_off,
    Finset.sum_sub_distrib, Finset.sum_add_distrib]
  ring

/-- **Proposition 11.7.5(c), the `v*`-bound.** If `‖A v‖ ≤ a` and `‖B v‖ ≤ b` for all `v`, then
`‖𝔼_l[A · G⁽²⁾_∞ B] - 𝔼_l[A · G⁽²⁾_l B]‖ ≤ (3/16)(3D + 4) · a · b / 7ˡ`. -/
theorem lamSqCoeff_sub_bound (l D : ℕ) (A B : ZMod (7 ^ l) → ℂ) (a b : ℝ)
    (hA : ∀ v, ‖A v‖ ≤ a) (hB : ∀ v, ‖B v‖ ≤ b) :
    ‖sevPair l A (lamSqCoeffInf l D B) - sevPair l A (lamSqCoeff l D B)‖ ≤
      3 / 16 * (3 * D + 4) * a * b / (7 : ℝ) ^ l := by
  have ha : 0 ≤ a := le_trans (norm_nonneg _) (hA 0)
  have hb : 0 ≤ b := le_trans (norm_nonneg _) (hB 0)
  have hM : (0 : ℝ) < (7 : ℝ) ^ l := by positivity
  have hAk : ∀ n v, ‖(sevAdj l ^ n) A v‖ ≤ a := fun n => sevAdj_pow_bound l n A a hA
  have hBn : ∀ n v, ‖(sigmaOne7 l ^ n) B v‖ ≤ b := fun n => sigmaOne7_pow_bound l n B b hB
  have c38 := sev_norm_const (q := 3 / 8) (by norm_num) (c := (3 / 8 : ℂ)) (by simp)
  rw [lamSqCoeff_diff]
  have hterm : ∀ k ∈ range D,
      ‖sevPair l ((sevAdj l ^ k) A) (sevAt (sVstar l) (sevR0 l ((sigmaOne7 l ^ (D - 1 - k)) B))) +
        3 / 8 * sevPair l ((sevAdj l ^ k) A) (sevAt (sVstar l) ((sigmaOne7 l ^ (D - k)) B))‖ ≤
      a * (3 / 16 * b) / (7 : ℝ) ^ l + 3 / 8 * (a * b / (7 : ℝ) ^ l) := by
    intro k _
    refine le_trans (norm_add_le _ _) (add_le_add ?_ ?_)
    · exact sevPair_at_le l _ _ _ (hAk k _) (sevR0_bound l _ b (hBn _) _) ha
    · rw [norm_mul, c38]
      exact mul_le_mul_of_nonneg_left (sevPair_at_le l _ _ _ (hAk k _) (hBn _ _) ha)
        (by norm_num)
  have hS := sevPair_at_le l A (sevS0 l ((sigmaOne7 l ^ D) B)) (sHstar l) (hA _)
    (sevS0_bound l _ b (hBn D) _) ha
  have hT := sevPair_at_le l ((sevAdj l ^ D) A) (sevT0 l B) (sVstar l) (hAk D _)
    (sevT0_bound l _ b hB _) ha
  have hsum := le_trans (norm_sum_le _ _) (Finset.sum_le_sum hterm)
  rw [Finset.sum_const, Finset.card_range, nsmul_eq_mul] at hsum
  have htot := le_trans (norm_add_le _ _) (add_le_add (le_trans (norm_add_le _ _)
    (add_le_add hsum hS)) hT)
  refine le_trans htot (le_of_eq ?_)
  field_simp
  ring

/-- **Level uniformity of the order-λ² coefficient (Proposition 11.7.5(c)).** For insertions
`A₀, B₀` at level `k` bounded by `a`, `b`, the smeared order-λ² coefficient at any level `l ≥ k`
lies within `(3/16)(3D + 4) a b / 7ˡ` of the level-independent value `𝔼_k[A₀ · G⁽²⁾_∞ B₀]`. -/
theorem lamSqCoeff_level_uniform {k l : ℕ} (hk : k ≤ l) (D : ℕ) (A₀ B₀ : ZMod (7 ^ k) → ℂ)
    (a b : ℝ) (hA : ∀ v, ‖A₀ v‖ ≤ a) (hB : ∀ v, ‖B₀ v‖ ≤ b) :
    ‖sevPair k A₀ (lamSqCoeffInf k D B₀) -
        sevPair l (liftPow 7 l k hk A₀) (lamSqCoeff l D (liftPow 7 l k hk B₀))‖ ≤
      3 / 16 * (3 * D + 4) * a * b / (7 : ℝ) ^ l := by
  rw [← lamSqCoeffInf_lift hk D A₀ B₀]
  exact lamSqCoeff_sub_bound l D _ _ a b (fun v => hA (projPow 7 l k hk v))
    (fun v => hB (projPow 7 l k hk v))

end LambdaSquareSeven

/-! ### Section 14: The Full-Model Order-λ^{3/2} Operator at p = 7 (manuscript Proposition 11.7.7)

Manuscript Lemma 11.7.6 and Proposition 11.7.7(a) identify the order-λ^{3/2} term of the full-model
plaquette correlator with `κ Σ_{k<D} Lᵏ Π* L^{D-k}`, where `Π*` multiplies by the indicator of
`v* = -2⁻¹` and `κ = 4 w₀w₁(√w₀ + √w₁) = (3/8)(1 + √3)`. That identification uses the cycle-valued
flow expansion of the full model, which is not formalized; here the operator is a definition
(`lamThreeHalfCoeff`). This section proves Proposition 11.7.7(b) for that operator: the exact smeared
formula (`lamThreeHalf_pair`), the bound `κ D a b / 7ˡ` (`lamThreeHalf_bound`, and
`lamThreeHalf_lifted_bound` for insertions lifted from a coarser level), and the value `κ D / 7ˡ` for
constant insertions (`lamThreeHalf_const`). It reuses Section 13. -/

section LambdaThreeHalfSeven

open Finset BigOperators

/-- `κ = (3/8)(1 + √3)` as a real number. -/
noncomputable def sevKappaR : ℝ := 3 / 8 * (1 + Real.sqrt 3)

/-- `κ` as a complex number. -/
noncomputable def sevKappa : ℂ := (sevKappaR : ℂ)

lemma sevKappaR_nonneg : 0 ≤ sevKappaR := by
  unfold sevKappaR
  positivity

/-- `Π*`: multiplication by the indicator of `v*` (equal to `sevAt (sVstar l)`, see
`sevPiStar_apply`). -/
noncomputable def sevPiStar (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) := sevAt (sVstar l)

lemma sevPiStar_apply (l : ℕ) (f : ZMod (7 ^ l) → ℂ) (y : ZMod (7 ^ l)) :
    sevPiStar l f y = if y = sVstar l then f y else 0 := by
  rw [sevPiStar, sevAt_apply]
  split_ifs with h
  · rw [h]
  · rfl

/-- **The order-λ^{3/2} operator** of Proposition 11.7.7(a) (here a definition). -/
noncomputable def lamThreeHalfCoeff (l D : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  sevKappa • ∑ k ∈ range D, sigmaOne7 l ^ k * sevPiStar l * sigmaOne7 l ^ (D - k)

/-- **Proposition 11.7.7(b), exact formula.**
`𝔼_l[A · G B] = κ Σ_{k<D} ((Lᵀ)ᵏ A)(v*) · (L^{D-k} B)(v*) / 7ˡ`. -/
theorem lamThreeHalf_pair (l D : ℕ) (A B : ZMod (7 ^ l) → ℂ) :
    sevPair l A (lamThreeHalfCoeff l D B) =
      sevKappa * ∑ k ∈ range D, (sevAdj l ^ k) A (sVstar l) *
        (sigmaOne7 l ^ (D - k)) B (sVstar l) / ((7 : ℕ) : ℂ) ^ l := by
  simp only [lamThreeHalfCoeff, LinearMap.smul_apply, LinearMap.sum_apply, Module.End.mul_apply,
    sevPair_smul, sevPair_sum, sevPair_pow, sevPiStar, sevPair_at]

/-- **Proposition 11.7.7(b), bound.** If `‖A v‖ ≤ a` and `‖B v‖ ≤ b` for all `v`, then
`‖𝔼_l[A · G B]‖ ≤ κ D a b / 7ˡ`. -/
theorem lamThreeHalf_bound (l D : ℕ) (A B : ZMod (7 ^ l) → ℂ) (a b : ℝ)
    (hA : ∀ v, ‖A v‖ ≤ a) (hB : ∀ v, ‖B v‖ ≤ b) :
    ‖sevPair l A (lamThreeHalfCoeff l D B)‖ ≤ sevKappaR * D * a * b / (7 : ℝ) ^ l := by
  have ha : 0 ≤ a := le_trans (norm_nonneg _) (hA 0)
  have hm : ‖((7 : ℕ) : ℂ) ^ l‖ = (7 : ℝ) ^ l := by simp
  have hterm : ∀ k ∈ range D,
      ‖(sevAdj l ^ k) A (sVstar l) * (sigmaOne7 l ^ (D - k)) B (sVstar l) / ((7 : ℕ) : ℂ) ^ l‖ ≤
        a * b / (7 : ℝ) ^ l := by
    intro k _
    rw [norm_div, norm_mul, hm, div_eq_mul_inv, div_eq_mul_inv]
    exact mul_le_mul_of_nonneg_right
      (mul_le_mul (sevAdj_pow_bound l k A a hA _) (sigmaOne7_pow_bound l (D - k) B b hB _)
        (norm_nonneg _) ha)
      (inv_nonneg.mpr (by positivity))
  have hsum := le_trans (norm_sum_le _ _) (Finset.sum_le_sum hterm)
  rw [Finset.sum_const, Finset.card_range, nsmul_eq_mul] at hsum
  rw [lamThreeHalf_pair, norm_mul, sevKappa, norm_ofReal_nonneg' sevKappaR_nonneg]
  calc sevKappaR * ‖∑ k ∈ range D, (sevAdj l ^ k) A (sVstar l) *
          (sigmaOne7 l ^ (D - k)) B (sVstar l) / ((7 : ℕ) : ℂ) ^ l‖
      ≤ sevKappaR * ((D : ℝ) * (a * b / (7 : ℝ) ^ l)) :=
        mul_le_mul_of_nonneg_left hsum sevKappaR_nonneg
    _ = sevKappaR * D * a * b / (7 : ℝ) ^ l := by ring

/-- **Proposition 11.7.7(b), level decay for lifted insertions.** For insertions lifted from level
`k ≤ l` and bounded by `a`, `b`, the smeared order-λ^{3/2} coefficient is at most `κ D a b / 7ˡ`;
it has no level-independent part. -/
theorem lamThreeHalf_lifted_bound {k l : ℕ} (hk : k ≤ l) (D : ℕ) (A₀ B₀ : ZMod (7 ^ k) → ℂ)
    (a b : ℝ) (hA : ∀ v, ‖A₀ v‖ ≤ a) (hB : ∀ v, ‖B₀ v‖ ≤ b) :
    ‖sevPair l (liftPow 7 l k hk A₀) (lamThreeHalfCoeff l D (liftPow 7 l k hk B₀))‖ ≤
      sevKappaR * D * a * b / (7 : ℝ) ^ l :=
  lamThreeHalf_bound l D _ _ a b (fun v => hA (projPow 7 l k hk v))
    (fun v => hB (projPow 7 l k hk v))

/-- **Proposition 11.7.7(b), constant insertions:** `𝔼_l[1 · G 1] = κ D / 7ˡ`. -/
theorem lamThreeHalf_const (l D : ℕ) :
    sevPair l (fun _ => 1) (lamThreeHalfCoeff l D (fun _ => 1)) =
      sevKappa * D / ((7 : ℕ) : ℂ) ^ l := by
  have hL : ∀ n, (sigmaOne7 l ^ n) (fun _ => (1 : ℂ)) = fun _ => 1 :=
    fun n => pow_apply_const_one 7 sigmaOne7 l (sigmaOne7_const_one l) n
  rw [lamThreeHalf_pair]
  simp only [sevAdj_pow_const_one, hL, one_mul, Finset.sum_const, Finset.card_range, nsmul_eq_mul]
  ring

end LambdaThreeHalfSeven

/-! ### Section 15: A conductor-graded state at `p = 7` (Merged Framework §4.4)

Added in v12. Formalizes the parts of Proposition 4.4 of the Merged Framework that do not need
character theory.
* `unitAct7` (the action `(U_u f) x = f (u x)` of a unit) preserves every shell `Kᵢ`
  (`unitAct7_shell_invariant`).
* `IsShellGraded7 j R w`: `R` acts by `w 0` on the constants and by `w i` on `Kᵢ`. Every such
  operator commutes with `sigmaOne7 j` (`shellGraded7_comm_sigmaOne7`). This is Proposition 4.4(d)
  for `ρ = e^{-sH}/Z` and for the conductor Hamiltonian `H`, both of which are shell-graded.
* `conductor_partition_hasSum`: `∑_c φ(7^c) x^c = (1 - x)/(1 - 7x)` for `0 ≤ x`, `7x < 1`; with
  `x = 7^{-s}` this is `L₇(s - 1)/L₇(s)` (Proposition 4.4(c)), the `φ(7^c)` being the shell
  dimensions of `finrank_shellSubspace7`.
* `character_partition_hasSum`: `∑_{c ≥ a} x^c = x^a (1 - x)⁻¹`; with `x = 7^{-s}` and `7^a` the
  conductor of `χ` this is `f(χ)^{-s} L₇(s)` (the limit in Proposition 4.4(b)).
Not formalized: Proposition 4.4(a) (each `Kᵢ` is the regular representation of `(ℤ/7ⁱℤ)ˣ`, so a
character `χ` occurs in `Kᵢ` exactly when its conductor exponent is at most `i`), the existence of
the conductor Hamiltonian as an explicit operator (it needs the fiber-average projections), and
the identification of `Tr(P_χ e^{-sH})` with the partial sum; these are formalized in Sections 16 and 17.
This section compiled with Lean 4.35.0 and Mathlib v4.35.0 as part of v22.
-/

section ConductorGradedSeven

open Finset BigOperators

/-- The action of a unit by dilation, `(U_u f) x = f (u x)`. -/
def unitAct7 (j : ℕ) (u : ZMod (7 ^ j)) : Module.End ℂ (ZMod (7 ^ j) → ℂ) where
  toFun f x := f (u * x)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

lemma unitAct7_apply (j : ℕ) (u : ZMod (7 ^ j)) (f : ZMod (7 ^ j) → ℂ) (x : ZMod (7 ^ j)) :
    unitAct7 j u f x = f (u * x) :=
  rfl

/-- **Unit dilations preserve the shells.** -/
theorem unitAct7_shell_invariant (j i : ℕ) (hi : 1 ≤ i) (hij : i ≤ j) {u : ZMod (7 ^ j)}
    (hu : IsUnit u) {f : ZMod (7 ^ j) → ℂ} (hf : f ∈ shellSubspace7 j i hi hij) :
    unitAct7 j u f ∈ shellSubspace7 j i hi hij := by
  obtain ⟨g, hg, rfl⟩ := hf
  set a : ZMod (7 ^ i) := projPow 7 j i hij u with ha_def
  have ha : IsUnit a := hu.map (projPow 7 j i hij)
  set b : ZMod (7 ^ (i - 1)) := projPow 7 i (i - 1) (Nat.sub_le i 1) a with hb_def
  have hb : IsUnit b := ha.map (projPow 7 i (i - 1) (Nat.sub_le i 1))
  have hinj : Function.Injective (fun v : ZMod (7 ^ i) => a * v) :=
    fun v w h => ha.mul_left_cancel h
  have hbij : Function.Bijective (fun v : ZMod (7 ^ i) => a * v) :=
    Finite.injective_iff_bijective.mp hinj
  have hψ : Function.Injective (fun r : ZMod (7 ^ (i - 1)) => b * r) :=
    fun r s h => hb.mul_left_cancel h
  have hcomm : ∀ v, projPow 7 i (i - 1) (Nat.sub_le i 1) ((fun v => a * v) v) =
      (fun r => b * r) (projPow 7 i (i - 1) (Nat.sub_le i 1) v) := by
    intro v
    simp only [hb_def, map_mul]
  refine ⟨fun v => g (a * v), fun r => ?_, ?_⟩
  · exact (fiber_sum_comp_bijective i (fun v => a * v) (fun r => b * r) hbij hψ hcomm g r).trans
      (hg _)
  · funext x
    simp only [unitAct7_apply, liftPow, LinearMap.coe_mk, AddHom.coe_mk, map_mul, ha_def]

/-- `R` acts by `w 0` on the constants and by `w i` on the shell `Kᵢ`. -/
def IsShellGraded7 (j : ℕ) (R : Module.End ℂ (ZMod (7 ^ j) → ℂ)) (w : ℕ → ℂ) : Prop :=
  (∀ f ∈ constSubmodule7 j, R f = w 0 • f) ∧
    ∀ (i : ℕ) (hi : 1 ≤ i) (hij : i ≤ j), ∀ f ∈ shellSubspace7 j i hi hij, R f = w i • f

/-- **Shell-graded operators commute with `sigmaOne7`** (Proposition 4.4(d)). The set where
`R ∘ sigmaOne7` and `sigmaOne7 ∘ R` agree is a submodule; it contains the constants and every
shell, and these span (`fullShellSpan7_eq_top`). -/
theorem shellGraded7_comm_sigmaOne7 (j : ℕ) (R : Module.End ℂ (ZMod (7 ^ j) → ℂ)) (w : ℕ → ℂ)
    (hR : IsShellGraded7 j R w) : R ∘ₗ sigmaOne7 j = sigmaOne7 j ∘ₗ R := by
  have hle : fullShellSpan7 j ≤ LinearMap.eqLocus (R ∘ₗ sigmaOne7 j) (sigmaOne7 j ∘ₗ R) := by
    unfold fullShellSpan7
    refine sup_le ?_ (iSup_le fun i => iSup_le fun hi => iSup_le fun hij => ?_)
    · intro f hf
      obtain ⟨c, rfl⟩ := Submodule.mem_span_singleton.mp hf
      have hs : sigmaOne7 j (c • fun _ => (1 : ℂ)) = c • fun _ => (1 : ℂ) := by
        rw [map_smul, sigmaOne7_const_one]
      rw [LinearMap.mem_eqLocus, LinearMap.comp_apply, LinearMap.comp_apply, hs, hR.1 _ hf,
        map_smul, hs]
    · intro f hf
      rw [LinearMap.mem_eqLocus, LinearMap.comp_apply, LinearMap.comp_apply,
        hR.2 i hi hij _ (shellSubspace7_sigmaOne7_invariant j i hi hij hf), hR.2 i hi hij f hf,
        map_smul]
  rw [fullShellSpan7_eq_top] at hle
  exact LinearMap.ext fun f => LinearMap.mem_eqLocus.mp (hle Submodule.mem_top)

/-- `φ(7 ^ c)`: `1` for `c = 0` and `6 · 7 ^ (c - 1)` otherwise (the shell dimensions). -/
def phiSeven (c : ℕ) : ℝ := if c = 0 then 1 else 6 * 7 ^ (c - 1)

/-- **Partition function of the conductor grading** (Proposition 4.4(c)):
`∑_c φ(7^c) x^c = (1 - x)/(1 - 7x)`. With `x = 7^{-s}`, `s > 1`, this is `L₇(s - 1)/L₇(s)`. -/
theorem conductor_partition_hasSum {x : ℝ} (hx0 : 0 ≤ x) (hx : 7 * x < 1) :
    HasSum (fun c : ℕ => phiSeven c * x ^ c) ((1 - x) / (1 - 7 * x)) := by
  have hg := (hasSum_geometric_of_lt_one (by positivity : (0 : ℝ) ≤ 7 * x) hx).mul_left (6 / 7)
  have hd : HasSum (fun c : ℕ => if c = 0 then (1 / 7 : ℝ) else 0) (1 / 7) :=
    hasSum_ite_eq 0 (1 / 7)
  have hterm : (fun c : ℕ => phiSeven c * x ^ c) =
      fun c => 6 / 7 * (7 * x) ^ c + (if c = 0 then (1 / 7 : ℝ) else 0) := by
    funext c
    rcases c with _ | n <;> norm_num [phiSeven] <;> ring
  have hne : (1 : ℝ) - 7 * x ≠ 0 := by linarith
  have hval : (1 - x) / (1 - 7 * x) = 6 / 7 * (1 - 7 * x)⁻¹ + 1 / 7 := by
    rw [div_eq_mul_inv]
    linear_combination (1 / 7 : ℝ) * mul_inv_cancel₀ hne
  rw [hterm, hval]
  exact hg.add hd

/-- **Character sector** (limit in Proposition 4.4(b)): `∑_{c ≥ a} x^c = x^a (1 - x)⁻¹`. With
`x = 7^{-s}` and `7^a = f(χ)` this is `f(χ)^{-s} L₇(s)`. -/
theorem character_partition_hasSum {x : ℝ} (hx0 : 0 ≤ x) (hx1 : x < 1) (a : ℕ) :
    HasSum (fun n : ℕ => x ^ (a + n)) (x ^ a * (1 - x)⁻¹) := by
  have h := (hasSum_geometric_of_lt_one hx0 hx1).mul_left (x ^ a)
  simpa [pow_add] using h

end ConductorGradedSeven

/-! ### Section 16: Conductor Hamiltonian, character multiplicities, and the trace identity at `p = 7`

Added in v13 (Merged Framework Proposition 4.4); compiled with Lean 4.35.0 and Mathlib v4.35.0 as part of v22.

Part A (fiber averages; the shells of Section 11).
* `card_fiber_projPow7`: every fiber of `projPow 7 l m` has `7 ^ (l - m)` points.
* `fibAvg7 hm`: the fiber average `E_m` onto functions of level `m`. It fixes every function
  inflated from a level `i ≤ m` (`fibAvg7_liftPow`) and kills every shell `Kᵢ` with `i > m`
  (`fibAvg7_shell_eq_zero`).
* `shellProj7 l c = E_c - E_{c-1}` (`E_{-1} = 0`) acts as the identity on `K_c` (on the constants
  for `c = 0`) and as zero on the other shells (`shellProj7_shell`, `shellProj7_const`).
* `gradedOp7 l w = ∑_{c ≤ l} w c • shellProj7 l c` is shell-graded with weights `w`
  (`gradedOp7_isShellGraded`); shell-graded operators are determined by their weights
  (`shellGraded7_unique`), so `∑_c shellProj7 l c = 1` (`sum_shellProj7`).
* `condHam7 l = gradedOp7 l (c ↦ log 7 · c)` is the conductor Hamiltonian `H_l`, and
  `condDensity7 l x = gradedOp7 l (c ↦ x ^ c)` is `e^{-sH_l}` for `x = 7^{-s}`; both commute with
  `sigmaOne7` (`condHam7_comm_sigmaOne7`, `condDensity7_comm_sigmaOne7`).

Part B (characters; Proposition 4.4(a) and (b)).
* `ψ7 l` is the standard additive character of `ZMod (7 ^ l)`; `fourierProj7 l S` projects onto
  the span of the additive characters with frequencies in `S`; `fourierShell7 l c` is the set of
  frequencies of exact additive order `7 ^ c`, so `fourierProj7 l (fourierShell7 l c)` projects
  onto the span of the additive characters of exact conductor `7 ^ c` (the definition of `Sh_c`
  in the Merged Framework).
* `charProj7 l χ` is the isotypic projector `φ(7^l)⁻¹ ∑_u χ(u⁻¹) U_u` of a character
  `χ : (ZMod (7 ^ l))ˣ →* ℂ`, and `CondLE7 l χ c` says that `χ` is trivial on the units
  `≡ 1 mod 7 ^ c` (conductor exponent at most `c`; equivalent to `projPow` form by
  `dvd_val_sub_one_iff`).
* `trace_charProj_fourierShell` (Proposition 4.4(a)): `Tr(P_χ ∘ Proj(Sh_c)) = 1` if
  `CondLE7 l χ c` and `0` otherwise, i.e. `χ` occurs in `Sh_c` with multiplicity one exactly when
  its conductor exponent is at most `c`.
* `trace_charProj_fourierDensity` and `trace_charProj_fourierDensity_Icc` (Proposition 4.4(b)):
  `Tr(P_χ ∘ ∑_{c ≤ l} x^c Proj(Sh_c)) = ∑_{c = a(χ)}^{l} x^c`, with `a(χ)` the least `c` such that
  `CondLE7 l χ c` (`condExp7`).

The identity `fourierProj7 l (annSet7 l m) = fibAvg7` that identifies the character shells of
Part B with the fiber-vanishing shells of Part A is proved in Section 17 (`fourierProj7_annSet`,
`fourierShellProj_eq_shellProj`, `trace_charProj_condDensity7`).
Mathlib names most likely to need adjustment: `ZMod.stdAddChar`, `ZMod.isPrimitive_stdAddChar`,
`AddChar.sum_mulShift`, `IsAddCyclic.card_addOrderOf_eq_totient`, `ZMod.card_units_eq_totient`,
`zmodNatCast_eq_zero_iff`, `ZMod.cast_eq_val`, `LinearMap.trace_eq_matrix_trace`,
`Pi.basisFun_repr`, `Finset.sum_nbij'`, `Finset.sum_boole`.
-/

section ConductorTraceSeven

open Finset BigOperators

/-! #### Part A: fiber averages and the conductor Hamiltonian -/

/-- Every fiber of `projPow 7 l m` has `7 ^ (l - m)` points (from `haarExpectation_liftPow`). -/
lemma card_fiber_projPow7 {l m : ℕ} (hm : m ≤ l) (r : ZMod (7 ^ m)) :
    ((univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l m hm y = r)).card : ℂ) =
      (7 : ℂ) ^ (l - m) := by
  have h := haarExpectation_liftPow 7 hm (fun s : ZMod (7 ^ m) => if s = r then (1 : ℂ) else 0)
  simp only [haarExpectation, liftPow, LinearMap.coe_mk, AddHom.coe_mk, Finset.sum_ite_eq',
    Finset.mem_univ, if_true, mul_one, Nat.cast_ofNat] at h
  rw [Finset.sum_boole] at h
  have hl : (7 : ℂ) ^ l ≠ 0 := pow_ne_zero _ (by norm_num)
  have hm0 : (7 : ℂ) ^ m ≠ 0 := pow_ne_zero _ (by norm_num)
  have h7 : (7 : ℂ) ^ l = (7 : ℂ) ^ (l - m) * (7 : ℂ) ^ m := by
    rw [← pow_add, Nat.sub_add_cancel hm]
  calc ((univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l m hm y = r)).card : ℂ)
      = (7 : ℂ) ^ l *
          (1 / (7 : ℂ) ^ l * (univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l m hm y = r)).card) := by
        rw [← mul_assoc, mul_one_div_cancel hl, one_mul]
    _ = (7 : ℂ) ^ l * (1 / (7 : ℂ) ^ m) := by rw [h]
    _ = (7 : ℂ) ^ (l - m) := by rw [h7, mul_assoc, mul_one_div_cancel hm0, mul_one]

/-- Pushing a fiber sum forward along `projPow 7 l n`. -/
lemma sum_fiber_push7 {l n k : ℕ} (hkn : k ≤ n) (hnl : n ≤ l) (F : ZMod (7 ^ n) → ℂ)
    (r : ZMod (7 ^ k)) :
    ∑ y ∈ univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l k (hkn.trans hnl) y = r),
        F (projPow 7 l n hnl y) =
      (7 : ℂ) ^ (l - n) * ∑ w ∈ univ.filter (fun w : ZMod (7 ^ n) => projPow 7 n k hkn w = r),
        F w := by
  rw [← Finset.sum_fiberwise_of_maps_to (g := projPow 7 l n hnl)
    (s := univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l k (hkn.trans hnl) y = r))
    (t := univ.filter (fun w : ZMod (7 ^ n) => projPow 7 n k hkn w = r))
    (fun y hy => by
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hy ⊢
      rw [projPow_trans 7 hkn hnl]
      exact hy)]
  rw [Finset.mul_sum]
  refine Finset.sum_congr rfl (fun w hw => ?_)
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hw
  have hset : (univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l k (hkn.trans hnl) y = r)).filter
      (fun y => projPow 7 l n hnl y = w) =
      univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l n hnl y = w) := by
    ext y
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    constructor
    · exact fun h => h.2
    · intro h
      refine ⟨?_, h⟩
      rw [← projPow_trans 7 hkn hnl, h, hw]
  have hconst : ∀ y ∈ univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l n hnl y = w),
      F (projPow 7 l n hnl y) = F w := fun y hy => by rw [(Finset.mem_filter.mp hy).2]
  rw [hset, Finset.sum_congr rfl hconst, Finset.sum_const, nsmul_eq_mul, card_fiber_projPow7]

/-- The fiber average `E_m` onto functions of level `m`. -/
noncomputable def fibAvg7 {l m : ℕ} (hm : m ≤ l) : Module.End ℂ (ZMod (7 ^ l) → ℂ) where
  toFun f x := ((7 : ℂ) ^ (l - m))⁻¹ *
    ∑ y ∈ univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l m hm y = projPow 7 l m hm x), f y
  map_add' f g := by
    funext x
    simp only [Pi.add_apply, Finset.sum_add_distrib, mul_add]
  map_smul' c f := by
    funext x
    simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply]
    rw [← Finset.mul_sum]
    ring

lemma fibAvg7_apply {l m : ℕ} (hm : m ≤ l) (f : ZMod (7 ^ l) → ℂ) (x : ZMod (7 ^ l)) :
    fibAvg7 hm f x = ((7 : ℂ) ^ (l - m))⁻¹ *
      ∑ y ∈ univ.filter (fun y : ZMod (7 ^ l) => projPow 7 l m hm y = projPow 7 l m hm x), f y :=
  rfl

/-- `E_m` fixes every function inflated from level `m`. -/
theorem fibAvg7_lift_self {l m : ℕ} (hm : m ≤ l) (h : ZMod (7 ^ m) → ℂ) :
    fibAvg7 hm (liftPow 7 l m hm h) = liftPow 7 l m hm h := by
  funext x
  rw [fibAvg7_apply]
  have hpush := sum_fiber_push7 (le_refl m) hm h (projPow 7 l m hm x)
  have hsingle : univ.filter (fun w : ZMod (7 ^ m) =>
      projPow 7 m m (le_refl m) w = projPow 7 l m hm x) = {projPow 7 l m hm x} := by
    ext w
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_singleton, projPow_self]
  rw [hsingle, Finset.sum_singleton] at hpush
  have h7 : ((7 : ℂ) ^ (l - m)) ≠ 0 := pow_ne_zero _ (by norm_num)
  have hlhs : ∑ y ∈ univ.filter (fun y : ZMod (7 ^ l) =>
      projPow 7 l m hm y = projPow 7 l m hm x), liftPow 7 l m hm h y =
      (7 : ℂ) ^ (l - m) * h (projPow 7 l m hm x) := by
    simp only [liftPow, LinearMap.coe_mk, AddHom.coe_mk]
    exact hpush
  rw [hlhs, inv_mul_cancel_left₀ h7]
  simp only [liftPow, LinearMap.coe_mk, AddHom.coe_mk]

/-- `E_m` fixes every function inflated from a level `i ≤ m`. -/
theorem fibAvg7_liftPow {l m i : ℕ} (him : i ≤ m) (hm : m ≤ l) (g : ZMod (7 ^ i) → ℂ) :
    fibAvg7 hm (liftPow 7 l i (him.trans hm) g) = liftPow 7 l i (him.trans hm) g := by
  have hfac : liftPow 7 l i (him.trans hm) g = liftPow 7 l m hm (liftPow 7 m i him g) := by
    funext v
    simp only [liftPow, LinearMap.coe_mk, AddHom.coe_mk, projPow_trans]
  rw [hfac]
  exact fibAvg7_lift_self hm _

/-- `E_m` fixes the constants. -/
lemma fibAvg7_const {l m : ℕ} (hm : m ≤ l) (c : ℂ) :
    fibAvg7 hm (fun _ : ZMod (7 ^ l) => c) = fun _ => c :=
  fibAvg7_lift_self hm (fun _ : ZMod (7 ^ m) => c)

/-- A fiber-vanishing function at level `i` sums to zero over every fiber of `projPow 7 i m`,
`m ≤ i - 1`. -/
lemma fiberVanishing7_sum_coarse {i m : ℕ} (hi : 1 ≤ i) (hmi : m ≤ i - 1)
    {g : ZMod (7 ^ i) → ℂ} (hg : IsFiberVanishing7 i hi g) (r : ZMod (7 ^ m)) :
    ∑ w ∈ univ.filter (fun w : ZMod (7 ^ i) =>
      projPow 7 i m (hmi.trans (Nat.sub_le i 1)) w = r), g w = 0 := by
  rw [← Finset.sum_fiberwise_of_maps_to (g := projPow 7 i (i - 1) (Nat.sub_le i 1))
    (s := univ.filter (fun w : ZMod (7 ^ i) => projPow 7 i m (hmi.trans (Nat.sub_le i 1)) w = r))
    (t := univ.filter (fun s : ZMod (7 ^ (i - 1)) => projPow 7 (i - 1) m hmi s = r))
    (fun w hw => by
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hw ⊢
      rw [projPow_trans 7 hmi (Nat.sub_le i 1)]
      exact hw)]
  refine Finset.sum_eq_zero (fun s hs => ?_)
  simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hs
  have hset : (univ.filter (fun w : ZMod (7 ^ i) =>
      projPow 7 i m (hmi.trans (Nat.sub_le i 1)) w = r)).filter
        (fun w => projPow 7 i (i - 1) (Nat.sub_le i 1) w = s) =
      univ.filter (fun w : ZMod (7 ^ i) => projPow 7 i (i - 1) (Nat.sub_le i 1) w = s) := by
    ext w
    simp only [Finset.mem_filter, Finset.mem_univ, true_and]
    constructor
    · exact fun h => h.2
    · intro h
      refine ⟨?_, h⟩
      rw [← projPow_trans 7 hmi (Nat.sub_le i 1), h, hs]
  rw [hset]
  exact hg s

/-- `E_m` kills every shell `Kᵢ` with `i > m`. -/
theorem fibAvg7_shell_eq_zero {l m i : ℕ} (hm : m ≤ l) (hi : 1 ≤ i) (hil : i ≤ l) (hmi : m < i)
    {f : ZMod (7 ^ l) → ℂ} (hf : f ∈ shellSubspace7 l i hi hil) : fibAvg7 hm f = 0 := by
  obtain ⟨g, hg, rfl⟩ := hf
  funext x
  rw [fibAvg7_apply, Pi.zero_apply]
  have hmi1 : m ≤ i - 1 := by omega
  have hpush := sum_fiber_push7 (hmi1.trans (Nat.sub_le i 1)) hil g (projPow 7 l m hm x)
  have hlhs : ∑ y ∈ univ.filter (fun y : ZMod (7 ^ l) =>
      projPow 7 l m hm y = projPow 7 l m hm x), liftPow 7 l i hil g y =
      (7 : ℂ) ^ (l - i) * ∑ w ∈ univ.filter (fun w : ZMod (7 ^ i) =>
        projPow 7 i m (hmi1.trans (Nat.sub_le i 1)) w = projPow 7 l m hm x), g w := by
    simp only [liftPow, LinearMap.coe_mk, AddHom.coe_mk]
    exact hpush
  rw [hlhs, fiberVanishing7_sum_coarse hi hmi1 hg, mul_zero, mul_zero]

/-- `E_m` on a shell: the identity if `i ≤ m`, zero otherwise. -/
lemma fibAvg7_on_shell {l m i : ℕ} (hm : m ≤ l) (hi : 1 ≤ i) (hil : i ≤ l)
    {f : ZMod (7 ^ l) → ℂ} (hf : f ∈ shellSubspace7 l i hi hil) :
    fibAvg7 hm f = if i ≤ m then f else 0 := by
  split_ifs with h
  · obtain ⟨g, -, rfl⟩ := hf
    exact fibAvg7_liftPow h hm g
  · exact fibAvg7_shell_eq_zero hm hi hil (by omega) hf

/-- The shell projection `Proj(K_c) = E_c - E_{c-1}` (`E_{-1} = 0`); zero for `c > l`. -/
noncomputable def shellProj7 (l c : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  if h : c ≤ l then
    fibAvg7 h - (if h0 : c = 0 then 0 else fibAvg7 (show c - 1 ≤ l by omega))
  else 0

lemma shellProj7_shell {l c i : ℕ} (hc : c ≤ l) (hi : 1 ≤ i) (hil : i ≤ l)
    {f : ZMod (7 ^ l) → ℂ} (hf : f ∈ shellSubspace7 l i hi hil) :
    shellProj7 l c f = if i = c then f else 0 := by
  simp only [shellProj7, dif_pos hc]
  by_cases h0 : c = 0
  · subst h0
    rw [dif_pos rfl, sub_zero, fibAvg7_on_shell hc hi hil hf]
    have : ¬ i ≤ 0 := by omega
    have : ¬ i = 0 := by omega
    simp [*]
  · rw [dif_neg h0, LinearMap.sub_apply, fibAvg7_on_shell hc hi hil hf,
      fibAvg7_on_shell (show c - 1 ≤ l by omega) hi hil hf]
    by_cases hic : i = c
    · subst hic
      have : ¬ i ≤ i - 1 := by omega
      simp [this]
    · by_cases hlt : i ≤ c - 1
      · have : i ≤ c := by omega
        simp [hic, hlt, this]
      · have : ¬ i ≤ c := by omega
        simp [hic, hlt, this]

lemma shellProj7_const {l c : ℕ} (hc : c ≤ l) (a : ℂ) :
    shellProj7 l c (fun _ => a) = if c = 0 then (fun _ => a) else (0 : ZMod (7 ^ l) → ℂ) := by
  simp only [shellProj7, dif_pos hc]
  by_cases h0 : c = 0
  · rw [dif_pos h0, sub_zero, if_pos h0]
    exact fibAvg7_const hc a
  · rw [dif_neg h0, if_neg h0, LinearMap.sub_apply, fibAvg7_const, fibAvg7_const, sub_self]

/-- `∑_{c ≤ l} w c • Proj(K_c)`. -/
noncomputable def gradedOp7 (l : ℕ) (w : ℕ → ℂ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  ∑ c ∈ range (l + 1), w c • shellProj7 l c

theorem gradedOp7_isShellGraded (l : ℕ) (w : ℕ → ℂ) : IsShellGraded7 l (gradedOp7 l w) w := by
  refine ⟨fun f hf => ?_, fun i hi hil f hf => ?_⟩
  · obtain ⟨a, rfl⟩ := Submodule.mem_span_singleton.mp hf
    have hfun : (a • fun _ : ZMod (7 ^ l) => (1 : ℂ)) = fun _ => a := by
      funext x
      simp
    rw [hfun]
    simp only [gradedOp7, LinearMap.sum_apply, Finset.sum_apply, LinearMap.smul_apply]
    rw [Finset.sum_congr rfl (fun c hc => by
      rw [shellProj7_const (Nat.lt_succ_iff.mp (Finset.mem_range.mp hc))])]
    simp only [smul_ite, smul_zero]
    rw [Finset.sum_ite_eq' (range (l + 1)) 0]
    simp
  · simp only [gradedOp7, LinearMap.sum_apply, Finset.sum_apply, LinearMap.smul_apply]
    rw [Finset.sum_congr rfl (fun c hc => by
      rw [shellProj7_shell (Nat.lt_succ_iff.mp (Finset.mem_range.mp hc)) hi hil hf])]
    simp only [smul_ite, smul_zero]
    rw [Finset.sum_ite_eq (range (l + 1)) i]
    simp [Finset.mem_range, Nat.lt_succ_iff.mpr hil]

/-- **Uniqueness:** two shell-graded operators with the same weights are equal. -/
theorem shellGraded7_unique (l : ℕ) {R R' : Module.End ℂ (ZMod (7 ^ l) → ℂ)} {w : ℕ → ℂ}
    (hR : IsShellGraded7 l R w) (hR' : IsShellGraded7 l R' w) : R = R' := by
  have hle : fullShellSpan7 l ≤ LinearMap.eqLocus R R' := by
    unfold fullShellSpan7
    refine sup_le ?_ (iSup_le fun i => iSup_le fun hi => iSup_le fun hil => ?_)
    · intro f hf
      rw [LinearMap.mem_eqLocus, hR.1 f hf, hR'.1 f hf]
    · intro f hf
      rw [LinearMap.mem_eqLocus, hR.2 i hi hil f hf, hR'.2 i hi hil f hf]
  rw [fullShellSpan7_eq_top] at hle
  exact LinearMap.ext fun f => LinearMap.mem_eqLocus.mp (hle Submodule.mem_top)

/-- The shell projections sum to the identity. -/
theorem sum_shellProj7 (l : ℕ) : ∑ c ∈ range (l + 1), shellProj7 l c = 1 := by
  have h1 : IsShellGraded7 l (1 : Module.End ℂ (ZMod (7 ^ l) → ℂ)) (fun _ => 1) :=
    ⟨fun f _ => by simp, fun i _ _ f _ => by simp⟩
  have h := shellGraded7_unique l (gradedOp7_isShellGraded l (fun _ => 1)) h1
  simpa [gradedOp7] using h

/-- The conductor Hamiltonian `H_l = log 7 · ∑_c c · Proj(K_c)`. -/
noncomputable def condHam7 (l : ℕ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  gradedOp7 l (fun c => (Real.log 7 : ℂ) * c)

/-- `e^{-sH_l} = ∑_c x^c Proj(K_c)` with `x = 7^{-s}`. -/
noncomputable def condDensity7 (l : ℕ) (x : ℂ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  gradedOp7 l (fun c => x ^ c)

theorem condHam7_comm_sigmaOne7 (l : ℕ) : condHam7 l ∘ₗ sigmaOne7 l = sigmaOne7 l ∘ₗ condHam7 l :=
  shellGraded7_comm_sigmaOne7 l _ _ (gradedOp7_isShellGraded l _)

theorem condDensity7_comm_sigmaOne7 (l : ℕ) (x : ℂ) :
    condDensity7 l x ∘ₗ sigmaOne7 l = sigmaOne7 l ∘ₗ condDensity7 l x :=
  shellGraded7_comm_sigmaOne7 l _ _ (gradedOp7_isShellGraded l _)

/-! #### Part B: characters, multiplicities and the trace identity -/

/-- The standard additive character of `ZMod (7 ^ l)`. -/
noncomputable abbrev ψ7 (l : ℕ) : AddChar (ZMod (7 ^ l)) ℂ := ZMod.stdAddChar

lemma sum_ψ7_mul (l : ℕ) (b : ZMod (7 ^ l)) :
    ∑ x : ZMod (7 ^ l), ψ7 l (x * b) = if b = 0 then (7 : ℂ) ^ l else 0 := by
  rw [AddChar.sum_mulShift b (ZMod.isPrimitive_stdAddChar (7 ^ l))]
  simp only [ZMod.card, Nat.cast_pow, Nat.cast_ofNat]
  split_ifs <;> simp

/-- Projection onto the span of the additive characters with frequencies in `S`. -/
noncomputable def fourierProj7 (l : ℕ) (S : Finset (ZMod (7 ^ l))) :
    Module.End ℂ (ZMod (7 ^ l) → ℂ) where
  toFun f x := ((7 : ℂ) ^ l)⁻¹ * ∑ k ∈ S, ∑ y : ZMod (7 ^ l), f y * ψ7 l (k * (x - y))
  map_add' f g := by
    funext x
    simp only [Pi.add_apply, add_mul, Finset.sum_add_distrib, mul_add]
  map_smul' c f := by
    funext x
    simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply, mul_assoc]
    simp only [← Finset.mul_sum]
    ring

lemma fourierProj7_apply (l : ℕ) (S : Finset (ZMod (7 ^ l))) (f : ZMod (7 ^ l) → ℂ)
    (x : ZMod (7 ^ l)) :
    fourierProj7 l S f x = ((7 : ℂ) ^ l)⁻¹ * ∑ k ∈ S, ∑ y : ZMod (7 ^ l), f y * ψ7 l (k * (x - y)) :=
  rfl

/-- Frequencies of exact additive order `7 ^ c` (the characters of exact conductor `7 ^ c`). -/
def fourierShell7 (l c : ℕ) : Finset (ZMod (7 ^ l)) :=
  univ.filter (fun k : ZMod (7 ^ l) => addOrderOf k = 7 ^ c)

/-- Trace of an endomorphism of `ZMod (7 ^ l) → ℂ` in the point basis. -/
lemma trace_fun7 (l : ℕ) (T : Module.End ℂ (ZMod (7 ^ l) → ℂ)) :
    LinearMap.trace ℂ _ T = ∑ x : ZMod (7 ^ l), T (Pi.single x 1) x := by
  rw [LinearMap.trace_eq_matrix_trace ℂ (Pi.basisFun ℂ (ZMod (7 ^ l))), Matrix.trace]
  refine Finset.sum_congr rfl (fun x _ => ?_)
  rw [Matrix.diag_apply, LinearMap.toMatrix_apply, Pi.basisFun_apply, Pi.basisFun_repr]

/-- `∑_x (F_S δ_x)(u x) = #{k ∈ S : k (u - 1) = 0}`. -/
lemma trace_unit_fourier (l : ℕ) (u : ZMod (7 ^ l)) (S : Finset (ZMod (7 ^ l))) :
    ∑ x : ZMod (7 ^ l), fourierProj7 l S (Pi.single x 1) (u * x) =
      ((S.filter (fun k => k * (u - 1) = 0)).card : ℂ) := by
  have h1 : ∀ x : ZMod (7 ^ l), fourierProj7 l S (Pi.single x 1) (u * x) =
      ((7 : ℂ) ^ l)⁻¹ * ∑ k ∈ S, ψ7 l (x * (k * (u - 1))) := by
    intro x
    rw [fourierProj7_apply]
    congr 1
    refine Finset.sum_congr rfl (fun k _ => ?_)
    rw [Finset.sum_eq_single x]
    · rw [Pi.single_eq_same, one_mul]
      congr 1
      ring
    · intro y _ hy
      rw [Pi.single_eq_of_ne hy, zero_mul]
    · intro hx
      exact absurd (Finset.mem_univ x) hx
  simp only [h1]
  rw [← Finset.mul_sum, Finset.sum_comm]
  simp only [sum_ψ7_mul]
  rw [Finset.sum_ite, Finset.sum_const_zero, add_zero, Finset.sum_const, nsmul_eq_mul]
  have h7 : ((7 : ℂ) ^ l) ≠ 0 := pow_ne_zero _ (by norm_num)
  rw [mul_comm (((S.filter (fun k => k * (u - 1) = 0)).card : ℂ)), ← mul_assoc,
    inv_mul_cancel₀ h7, one_mul]

/-- For a frequency of exact order `7 ^ c`, `k (u - 1) = 0` iff `7 ^ c ∣ (u - 1).val`. -/
lemma mul_sub_one_eq_zero_iff7 {l c : ℕ} {k : ZMod (7 ^ l)} (hk : addOrderOf k = 7 ^ c)
    (u : ZMod (7 ^ l)) : k * (u - 1) = 0 ↔ 7 ^ c ∣ (u - 1).val := by
  have e1 : k * (u - 1) = (u - 1).val • k := by
    rw [nsmul_eq_mul, ZMod.natCast_zmod_val, mul_comm]
  rw [e1, ← hk, addOrderOf_dvd_iff_nsmul_eq_zero]

/-- The divisibility condition is `projPow 7 l c u = 1`. -/
lemma dvd_val_sub_one_iff {l c : ℕ} (hc : c ≤ l) (x : ZMod (7 ^ l)) :
    7 ^ c ∣ (x - 1).val ↔ projPow 7 l c hc x = 1 := by
  have e2 : projPow 7 l c hc x = 1 ↔ (((x - 1).val : ℕ) : ZMod (7 ^ c)) = 0 := by
    rw [← sub_eq_zero, ← map_one (projPow 7 l c hc), ← map_sub]
    simp only [projPow, ZMod.castHom_apply, ZMod.cast_eq_val]
  rw [e2, zmodNatCast_eq_zero_iff]

/-- Conductor exponent at most `c`: `χ` is trivial on the units `≡ 1 mod 7 ^ c`. Equivalent
(via `dvd_val_sub_one_iff`) to `χ u = 1` whenever `projPow 7 l c hc u = 1`, i.e. to `χ`
factoring through `(ZMod (7 ^ c))ˣ`. -/
def CondLE7 (l : ℕ) (χ : (ZMod (7 ^ l))ˣ →* ℂ) (c : ℕ) : Prop :=
  ∀ u : (ZMod (7 ^ l))ˣ, 7 ^ c ∣ ((u : ZMod (7 ^ l)) - 1).val → χ u = 1

lemma CondLE7.mono {l : ℕ} {χ : (ZMod (7 ^ l))ˣ →* ℂ} {c d : ℕ} (hcd : c ≤ d)
    (h : CondLE7 l χ c) : CondLE7 l χ d :=
  fun u hu => h u ((pow_dvd_pow 7 hcd).trans hu)

lemma condLE7_top (l : ℕ) (χ : (ZMod (7 ^ l))ˣ →* ℂ) : CondLE7 l χ l := by
  intro u hu
  have hlt : ((u : ZMod (7 ^ l)) - 1).val < 7 ^ l := ZMod.val_lt _
  have h0 : ((u : ZMod (7 ^ l)) - 1).val = 0 := Nat.eq_zero_of_dvd_of_lt hu hlt
  have hu1 : (u : ZMod (7 ^ l)) = 1 := by
    rw [ZMod.val_eq_zero, sub_eq_zero] at h0
    exact h0
  have : u = 1 := Units.ext hu1
  rw [this, map_one]

/-- The units `≡ 1 mod 7 ^ c`. -/
def kerUnits7 (l c : ℕ) : Finset (ZMod (7 ^ l))ˣ :=
  univ.filter (fun u : (ZMod (7 ^ l))ˣ => 7 ^ c ∣ ((u : ZMod (7 ^ l)) - 1).val)

lemma kerUnits7_mul {l c : ℕ} (hc : c ≤ l) {s u : (ZMod (7 ^ l))ˣ} (hs : s ∈ kerUnits7 l c)
    (hu : u ∈ kerUnits7 l c) : s * u ∈ kerUnits7 l c := by
  simp only [kerUnits7, Finset.mem_filter, Finset.mem_univ, true_and,
    dvd_val_sub_one_iff hc] at hs hu ⊢
  rw [Units.val_mul, map_mul, hs, hu, one_mul]

lemma kerUnits7_inv {l c : ℕ} (hc : c ≤ l) {s : (ZMod (7 ^ l))ˣ} (hs : s ∈ kerUnits7 l c) :
    s⁻¹ ∈ kerUnits7 l c := by
  simp only [kerUnits7, Finset.mem_filter, Finset.mem_univ, true_and,
    dvd_val_sub_one_iff hc] at hs ⊢
  have h := congrArg (projPow 7 l c hc) (Units.inv_mul s)
  rw [map_mul, hs, mul_one, map_one] at h
  exact h

open Classical in
/-- **Character sum over the kernel.** -/
lemma char_sum_kerUnits7 {l c : ℕ} (hc : c ≤ l) (χ : (ZMod (7 ^ l))ˣ →* ℂ) :
    ∑ u ∈ kerUnits7 l c, χ u⁻¹ = if CondLE7 l χ c then ((kerUnits7 l c).card : ℂ) else 0 := by
  split_ifs with h
  · have hone : ∀ u ∈ kerUnits7 l c, χ u⁻¹ = 1 := by
      intro u hu
      have hu' := kerUnits7_inv hc hu
      simp only [kerUnits7, Finset.mem_filter, Finset.mem_univ, true_and] at hu'
      exact h _ hu'
    rw [Finset.sum_congr rfl hone, Finset.sum_const, nsmul_eq_mul, mul_one]
  · simp only [CondLE7, not_forall, not_imp] at h
    obtain ⟨s, hsdvd, hχs⟩ := h
    have hs : s ∈ kerUnits7 l c := by
      simp only [kerUnits7, Finset.mem_filter, Finset.mem_univ, true_and]
      exact hsdvd
    have hre : ∑ u ∈ kerUnits7 l c, χ u⁻¹ = ∑ u ∈ kerUnits7 l c, χ (s * u)⁻¹ :=
      Finset.sum_nbij' (fun u => s⁻¹ * u) (fun u => s * u)
        (fun u hu => kerUnits7_mul hc (kerUnits7_inv hc hs) hu)
        (fun u hu => kerUnits7_mul hc hs hu)
        (fun u _ => by simp only [mul_inv_cancel_left])
        (fun u _ => by simp only [inv_mul_cancel_left])
        (fun u _ => by simp only [mul_inv_cancel_left])
    have hfac : ∑ u ∈ kerUnits7 l c, χ (s * u)⁻¹ = χ s⁻¹ * ∑ u ∈ kerUnits7 l c, χ u⁻¹ := by
      rw [Finset.mul_sum]
      refine Finset.sum_congr rfl (fun u _ => ?_)
      rw [mul_inv_rev, map_mul, mul_comm]
    have hne : χ s⁻¹ ≠ 1 := by
      intro h1
      apply hχs
      have := map_mul χ s s⁻¹
      rw [mul_inv_cancel, map_one, h1, mul_one] at this
      exact this.symm
    have hzero : (1 - χ s⁻¹) * ∑ u ∈ kerUnits7 l c, χ u⁻¹ = 0 := by
      rw [sub_mul, one_mul, ← hfac, ← hre, sub_self]
    rcases mul_eq_zero.mp hzero with h0 | h0
    · exact absurd (sub_eq_zero.mp h0).symm hne
    · exact h0

/-- An element `≡ 1 mod 7 ^ c` with `c ≥ 1` is a unit. -/
lemma isUnit_of_projPow7_eq_one {l c : ℕ} (hc1 : 1 ≤ c) (hc : c ≤ l) {x : ZMod (7 ^ l)}
    (hx : projPow 7 l c hc x = 1) : IsUnit x := by
  have h1 : projPow 7 l 1 (hc1.trans hc) x = 1 := by
    rw [← projPow_trans 7 hc1 hc, hx, map_one]
  rw [← ZMod.natCast_zmod_val x, ZMod.isUnit_iff_coprime]
  apply Nat.Coprime.pow_right
  rw [Nat.coprime_comm, Nat.Prime.coprime_iff_not_dvd (by norm_num : Nat.Prime 7)]
  intro hdvd
  have h0 : projPow 7 l 1 (hc1.trans hc) x = 0 := by
    simp only [projPow, ZMod.castHom_apply, ZMod.cast_eq_val]
    exact (zmodNatCast_eq_zero_iff _ _).mpr (by simpa using hdvd)
  rw [h0] at h1
  exact absurd h1 (by decide)

/-- `|K_c| · |Sh_c| = φ(7 ^ l)`. -/
lemma card_kerUnits7_mul_card_shell {l c : ℕ} (hc : c ≤ l) :
    ((kerUnits7 l c).card : ℂ) * ((fourierShell7 l c).card : ℂ) =
      (Fintype.card (ZMod (7 ^ l))ˣ : ℂ) := by
  classical
  have hT : (fourierShell7 l c).card = Nat.totient (7 ^ c) := by
    unfold fourierShell7
    exact IsAddCyclic.card_addOrderOf_eq_totient (by rw [ZMod.card]; exact pow_dvd_pow 7 hc)
  have hU : Fintype.card (ZMod (7 ^ l))ˣ = Nat.totient (7 ^ l) := ZMod.card_units_eq_totient _
  rw [hT, hU]
  rcases Nat.eq_zero_or_pos c with rfl | hc1
  · have hK : kerUnits7 l 0 = univ := by
      ext u
      simp [kerUnits7]
    rw [hK, Finset.card_univ, hU, pow_zero, Nat.totient_one, Nat.cast_one, mul_one]
  · have hK : ((kerUnits7 l c).card : ℂ) =
        ((univ.filter (fun x : ZMod (7 ^ l) => projPow 7 l c hc x = 1)).card : ℂ) := by
      congr 1
      refine Finset.card_bij (fun u _ => (u : ZMod (7 ^ l))) ?_ ?_ ?_
      · intro u hu
        simp only [kerUnits7, Finset.mem_filter, Finset.mem_univ, true_and,
          dvd_val_sub_one_iff hc] at hu ⊢
        exact hu
      · intro u _ v _ h
        exact Units.ext h
      · intro x hx
        simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hx
        have hxu : IsUnit x := isUnit_of_projPow7_eq_one hc1 hc hx
        refine ⟨hxu.unit, ?_, hxu.unit_spec⟩
        simp only [kerUnits7, Finset.mem_filter, Finset.mem_univ, true_and, IsUnit.unit_spec,
          dvd_val_sub_one_iff hc]
        exact hx
    rw [hK, card_fiber_projPow7]
    have hp : Nat.Prime 7 := by norm_num
    rw [Nat.totient_prime_pow hp hc1, Nat.totient_prime_pow hp (show 0 < l by omega)]
    rw [show (7 : ℕ) - 1 = 6 from rfl]
    push_cast
    have h7 : (7 : ℂ) ^ (l - 1) = (7 : ℂ) ^ (l - c) * (7 : ℂ) ^ (c - 1) := by
      rw [← pow_add]
      congr 1
      omega
    rw [h7]
    ring

/-- The isotypic projector `P_χ = φ(7^l)⁻¹ ∑_u χ(u⁻¹) U_u`. -/
noncomputable def charProj7 (l : ℕ) (χ : (ZMod (7 ^ l))ˣ →* ℂ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  ((Fintype.card (ZMod (7 ^ l))ˣ : ℂ))⁻¹ •
    ∑ u : (ZMod (7 ^ l))ˣ, χ u⁻¹ • unitAct7 l (u : ZMod (7 ^ l))

lemma charProj7_apply (l : ℕ) (χ : (ZMod (7 ^ l))ˣ →* ℂ) (f : ZMod (7 ^ l) → ℂ)
    (x : ZMod (7 ^ l)) :
    charProj7 l χ f x = ((Fintype.card (ZMod (7 ^ l))ˣ : ℂ))⁻¹ *
      ∑ u : (ZMod (7 ^ l))ˣ, χ u⁻¹ * f ((u : ZMod (7 ^ l)) * x) := by
  simp only [charProj7, LinearMap.smul_apply, LinearMap.sum_apply, Finset.sum_apply,
    Pi.smul_apply, smul_eq_mul, unitAct7_apply]

open Classical in
/-- **Proposition 4.4(a): multiplicity of `χ` in `Sh_c`.** -/
theorem trace_charProj_fourierShell {l c : ℕ} (hc : c ≤ l) (χ : (ZMod (7 ^ l))ˣ →* ℂ) :
    LinearMap.trace ℂ _ (charProj7 l χ ∘ₗ fourierProj7 l (fourierShell7 l c)) =
      if CondLE7 l χ c then 1 else 0 := by
  rw [trace_fun7]
  simp only [LinearMap.comp_apply, charProj7_apply]
  rw [← Finset.mul_sum, Finset.sum_comm]
  simp only [← Finset.mul_sum, trace_unit_fourier]
  have hcard : ∀ u : (ZMod (7 ^ l))ˣ,
      (((fourierShell7 l c).filter (fun k => k * ((u : ZMod (7 ^ l)) - 1) = 0)).card : ℂ) =
        if u ∈ kerUnits7 l c then ((fourierShell7 l c).card : ℂ) else 0 := by
    intro u
    by_cases hu : u ∈ kerUnits7 l c
    · rw [if_pos hu, Finset.filter_true_of_mem]
      intro k hk
      have hku := (Finset.mem_filter.mp hk).2
      simp only [kerUnits7, Finset.mem_filter, Finset.mem_univ, true_and] at hu
      exact (mul_sub_one_eq_zero_iff7 hku _).mpr hu
    · rw [if_neg hu, Finset.filter_false_of_mem, Finset.card_empty, Nat.cast_zero]
      intro k hk h
      apply hu
      have hku := (Finset.mem_filter.mp hk).2
      simp only [kerUnits7, Finset.mem_filter, Finset.mem_univ, true_and]
      exact (mul_sub_one_eq_zero_iff7 hku _).mp h
  simp only [hcard, mul_ite, mul_zero]
  rw [← Finset.sum_filter]
  have hfilt : univ.filter (fun u : (ZMod (7 ^ l))ˣ => u ∈ kerUnits7 l c) = kerUnits7 l c := by
    ext u
    simp
  rw [hfilt, ← Finset.sum_mul, char_sum_kerUnits7 hc]
  have hU : (Fintype.card (ZMod (7 ^ l))ˣ : ℂ) ≠ 0 := by
    have : 0 < Fintype.card (ZMod (7 ^ l))ˣ := Fintype.card_pos
    exact_mod_cast this.ne'
  split_ifs
  · rw [card_kerUnits7_mul_card_shell hc, inv_mul_cancel₀ hU]
  · rw [zero_mul, mul_zero]

/-- `∑_{c ≤ l} x^c Proj(Sh_c)`, the density `e^{-sH_l}` for `x = 7^{-s}`. -/
noncomputable def fourierDensity7 (l : ℕ) (x : ℂ) : Module.End ℂ (ZMod (7 ^ l) → ℂ) :=
  ∑ c ∈ range (l + 1), x ^ c • fourierProj7 l (fourierShell7 l c)

open Classical in
/-- **Proposition 4.4(b), trace identity.** -/
theorem trace_charProj_fourierDensity (l : ℕ) (χ : (ZMod (7 ^ l))ˣ →* ℂ) (x : ℂ) :
    LinearMap.trace ℂ _ (charProj7 l χ ∘ₗ fourierDensity7 l x) =
      ∑ c ∈ (range (l + 1)).filter (fun c => CondLE7 l χ c), x ^ c := by
  have hcomp : charProj7 l χ ∘ₗ fourierDensity7 l x =
      ∑ c ∈ range (l + 1), x ^ c • (charProj7 l χ ∘ₗ fourierProj7 l (fourierShell7 l c)) := by
    refine LinearMap.ext fun f => ?_
    simp only [fourierDensity7, LinearMap.comp_apply, LinearMap.sum_apply, Finset.sum_apply,
      LinearMap.smul_apply, map_sum, map_smul]
  rw [hcomp, map_sum, Finset.sum_filter]
  refine Finset.sum_congr rfl (fun c hc => ?_)
  rw [map_smul, trace_charProj_fourierShell (Nat.lt_succ_iff.mp (Finset.mem_range.mp hc)),
    smul_eq_mul, mul_ite, mul_one, mul_zero]

open Classical in
/-- The conductor exponent `a(χ)`: the least `c` with `CondLE7 l χ c` (at most `l`). -/
noncomputable def condExp7 (l : ℕ) (χ : (ZMod (7 ^ l))ˣ →* ℂ) : ℕ :=
  Nat.find (⟨l, condLE7_top l χ⟩ : ∃ c, CondLE7 l χ c)

open Classical in
/-- **Proposition 4.4(b):** `Tr(P_χ e^{-sH_l}) = ∑_{c = a(χ)}^{l} x^c`. -/
theorem trace_charProj_fourierDensity_Icc (l : ℕ) (χ : (ZMod (7 ^ l))ˣ →* ℂ) (x : ℂ) :
    LinearMap.trace ℂ _ (charProj7 l χ ∘ₗ fourierDensity7 l x) =
      ∑ c ∈ Finset.Icc (condExp7 l χ) l, x ^ c := by
  rw [trace_charProj_fourierDensity]
  congr 1
  ext c
  simp only [Finset.mem_filter, Finset.mem_range, Finset.mem_Icc, condExp7]
  constructor
  · rintro ⟨hcl, hc⟩
    exact ⟨Nat.find_min' _ hc, by omega⟩
  · rintro ⟨hac, hcl⟩
    exact ⟨by omega, CondLE7.mono hac (Nat.find_spec _)⟩

end ConductorTraceSeven

/-! ### Section 17: The character shells are the fiber-vanishing shells

Added in v14. Closes the link left open in Section 16 (compiled with Lean 4.35.0 and Mathlib v4.35.0 as part of v22).
* `annSet7 l m`: the frequencies `k` with `projPow 7 l (l - m) k = 0`, i.e. `7 ^ (l - m) ∣ k`;
  equivalently `7 ^ m • k = 0` (`mem_annSet7_iff`) or `addOrderOf k ∣ 7 ^ m`
  (`mem_annSet7_iff_addOrderOf`). It has `7 ^ m` elements (`card_annSet7`).
* `sum_ann_ψ7`: `∑_{k ∈ annSet7 l m} ψ(k z) = 7 ^ m` if `projPow 7 l m z = 0` and `0` otherwise.
* **`fourierProj7_annSet`**: `fourierProj7 l (annSet7 l m) = fibAvg7 hm`.
* `fourierShell7_zero`, `fourierShell7_eq_sdiff`: `Sh_0 = annSet7 l 0` and
  `Sh_c = annSet7 l c \ annSet7 l (c - 1)` for `c ≥ 1`; with `fourierProj7_sdiff` this gives
  **`fourierShellProj_eq_shellProj`**: `fourierProj7 l (fourierShell7 l c) = shellProj7 l c`.
* **`fourierDensity7_eq_condDensity7`** and **`trace_charProj_condDensity7`**: the trace identity
  of Section 16 holds for the conductor density `condDensity7 l x` built from fiber averages:
  `Tr(P_χ ∘ condDensity7 l x) = ∑_{c = a(χ)}^{l} x ^ c`.
-/

section ShellUnificationSeven

open Finset BigOperators

/-- Frequencies divisible by `7 ^ (l - m)`. -/
def annSet7 (l m : ℕ) : Finset (ZMod (7 ^ l)) :=
  univ.filter (fun k : ZMod (7 ^ l) => projPow 7 l (l - m) (Nat.sub_le l m) k = 0)

lemma mem_annSet7 {l m : ℕ} (k : ZMod (7 ^ l)) :
    k ∈ annSet7 l m ↔ projPow 7 l (l - m) (Nat.sub_le l m) k = 0 := by
  simp only [annSet7, Finset.mem_filter, Finset.mem_univ, true_and]

lemma projPow7_eq_zero_iff {l a : ℕ} (ha : a ≤ l) (x : ZMod (7 ^ l)) :
    projPow 7 l a ha x = 0 ↔ 7 ^ a ∣ x.val := by
  simp only [projPow, ZMod.castHom_apply, ZMod.cast_eq_val]
  exact zmodNatCast_eq_zero_iff _ _

lemma pow_dvd_pow_mul_iff7 {l m : ℕ} (hm : m ≤ l) (n : ℕ) :
    7 ^ l ∣ 7 ^ m * n ↔ 7 ^ (l - m) ∣ n := by
  have h7 : 7 ^ l = 7 ^ m * 7 ^ (l - m) := by
    rw [← pow_add, Nat.add_sub_of_le hm]
  rw [h7, Nat.mul_dvd_mul_iff_left (by positivity)]

lemma mem_annSet7_iff {l m : ℕ} (hm : m ≤ l) (k : ZMod (7 ^ l)) :
    k ∈ annSet7 l m ↔ (7 ^ m : ℕ) • k = 0 := by
  rw [mem_annSet7, projPow7_eq_zero_iff]
  have hcast : ((7 ^ m : ℕ) • k : ZMod (7 ^ l)) = ((7 ^ m * k.val : ℕ) : ZMod (7 ^ l)) := by
    rw [Nat.cast_mul, ZMod.natCast_zmod_val, nsmul_eq_mul]
  rw [hcast, zmodNatCast_eq_zero_iff, pow_dvd_pow_mul_iff7 hm]

lemma mem_annSet7_iff_addOrderOf {l m : ℕ} (hm : m ≤ l) (k : ZMod (7 ^ l)) :
    k ∈ annSet7 l m ↔ addOrderOf k ∣ 7 ^ m := by
  rw [mem_annSet7_iff hm, addOrderOf_dvd_iff_nsmul_eq_zero]

lemma card_annSet7 {l m : ℕ} (hm : m ≤ l) : ((annSet7 l m).card : ℂ) = (7 : ℂ) ^ m := by
  unfold annSet7
  rw [card_fiber_projPow7, Nat.sub_sub_self hm]

lemma annSet7_mono {l a b : ℕ} (hab : a ≤ b) (hb : b ≤ l) : annSet7 l a ⊆ annSet7 l b := by
  intro k hk
  rw [mem_annSet7_iff_addOrderOf (hab.trans hb)] at hk
  rw [mem_annSet7_iff_addOrderOf hb]
  exact hk.trans (pow_dvd_pow 7 hab)

/-- `k ∈ annSet7 l m` and `projPow 7 l m z = 0` give `k z = 0`. -/
lemma mul_eq_zero_of_ann {l m : ℕ} (hm : m ≤ l) {k z : ZMod (7 ^ l)} (hk : k ∈ annSet7 l m)
    (hz : projPow 7 l m hm z = 0) : k * z = 0 := by
  rw [mem_annSet7, projPow7_eq_zero_iff] at hk
  rw [projPow7_eq_zero_iff] at hz
  have hprod : k * z = ((k.val * z.val : ℕ) : ZMod (7 ^ l)) := by
    rw [Nat.cast_mul, ZMod.natCast_zmod_val, ZMod.natCast_zmod_val]
  rw [hprod, zmodNatCast_eq_zero_iff]
  calc 7 ^ l = 7 ^ (l - m) * 7 ^ m := by rw [← pow_add, Nat.sub_add_cancel hm]
    _ ∣ k.val * z.val := mul_dvd_mul hk hz

/-- If `projPow 7 l m z ≠ 0` then `7 ^ (l - m) z ≠ 0`. -/
lemma ann_mul_ne_zero {l m : ℕ} (hm : m ≤ l) {z : ZMod (7 ^ l)} (hz : projPow 7 l m hm z ≠ 0) :
    (7 : ZMod (7 ^ l)) ^ (l - m) * z ≠ 0 := by
  intro h
  apply hz
  rw [projPow7_eq_zero_iff]
  have hcast : (7 : ZMod (7 ^ l)) ^ (l - m) * z = ((7 ^ (l - m) * z.val : ℕ) : ZMod (7 ^ l)) := by
    rw [Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat, ZMod.natCast_zmod_val]
  rw [hcast, zmodNatCast_eq_zero_iff] at h
  have h' := (pow_dvd_pow_mul_iff7 (Nat.sub_le l m) z.val).mp h
  rwa [Nat.sub_sub_self hm] at h'

/-- A nonzero `b` is detected by the primitive character. -/
lemma exists_ψ7_ne_one {l : ℕ} {b : ZMod (7 ^ l)} (hb : b ≠ 0) : ∃ x, ψ7 l (x * b) ≠ 1 := by
  by_contra h
  push_neg at h
  have hs := sum_ψ7_mul l b
  rw [if_neg hb] at hs
  simp only [h, Finset.sum_const, Finset.card_univ, ZMod.card, nsmul_eq_mul, mul_one] at hs
  have h7 : (7 : ℂ) ^ l = 0 := by exact_mod_cast hs
  exact pow_ne_zero l (by norm_num : (7 : ℂ) ≠ 0) h7

/-- **The character sum over `annSet7 l m`.** -/
theorem sum_ann_ψ7 {l m : ℕ} (hm : m ≤ l) (z : ZMod (7 ^ l)) :
    ∑ k ∈ annSet7 l m, ψ7 l (k * z) = if projPow 7 l m hm z = 0 then (7 : ℂ) ^ m else 0 := by
  split_ifs with hz
  · have hone : ∀ k ∈ annSet7 l m, ψ7 l (k * z) = 1 := by
      intro k hk
      rw [mul_eq_zero_of_ann hm hk hz, AddChar.map_zero_eq_one]
    rw [Finset.sum_congr rfl hone, Finset.sum_const, nsmul_eq_mul, mul_one, card_annSet7 hm]
  · obtain ⟨x, hx⟩ := exists_ψ7_ne_one (ann_mul_ne_zero hm hz)
    have h0 : ((7 : ZMod (7 ^ (l - m))) ^ (l - m)) = 0 := by
      have h := ZMod.natCast_self (7 ^ (l - m))
      push_cast at h
      exact h
    have hs : x * (7 : ZMod (7 ^ l)) ^ (l - m) ∈ annSet7 l m := by
      rw [mem_annSet7, map_mul, map_pow, map_ofNat, h0, mul_zero]
    have hsz : x * (7 : ZMod (7 ^ l)) ^ (l - m) * z = x * ((7 : ZMod (7 ^ l)) ^ (l - m) * z) := by
      ring
    have hne : ψ7 l (x * (7 : ZMod (7 ^ l)) ^ (l - m) * z) ≠ 1 := by
      rw [hsz]
      exact hx
    have hshift : ∑ k ∈ annSet7 l m, ψ7 l (k * z) =
        ψ7 l (x * (7 : ZMod (7 ^ l)) ^ (l - m) * z) * ∑ k ∈ annSet7 l m, ψ7 l (k * z) := by
      rw [Finset.mul_sum]
      refine Finset.sum_nbij' (fun k => k - x * (7 : ZMod (7 ^ l)) ^ (l - m))
        (fun k => k + x * (7 : ZMod (7 ^ l)) ^ (l - m)) ?_ ?_ ?_ ?_ ?_
      · intro k hk
        rw [mem_annSet7] at hk hs ⊢
        rw [map_sub, hk, hs, sub_zero]
      · intro k hk
        rw [mem_annSet7] at hk hs ⊢
        rw [map_add, hk, hs, add_zero]
      · intro k _
        exact sub_add_cancel k _
      · intro k _
        exact add_sub_cancel_right k _
      · intro k _
        rw [← AddChar.map_add_eq_mul]
        congr 1
        ring
    have hzero : (1 - ψ7 l (x * (7 : ZMod (7 ^ l)) ^ (l - m) * z)) *
        ∑ k ∈ annSet7 l m, ψ7 l (k * z) = 0 := by
      rw [sub_mul, one_mul, ← hshift, sub_self]
    rcases mul_eq_zero.mp hzero with h1 | h1
    · exact absurd (sub_eq_zero.mp h1).symm hne
    · exact h1

/-- **The link:** the Fourier projector onto `annSet7 l m` is the fiber average `E_m`. -/
theorem fourierProj7_annSet {l m : ℕ} (hm : m ≤ l) :
    fourierProj7 l (annSet7 l m) = fibAvg7 hm := by
  refine LinearMap.ext fun f => funext fun x => ?_
  rw [fourierProj7_apply, fibAvg7_apply, Finset.sum_comm]
  have hinner : ∀ y : ZMod (7 ^ l), ∑ k ∈ annSet7 l m, f y * ψ7 l (k * (x - y)) =
      if projPow 7 l m hm y = projPow 7 l m hm x then f y * (7 : ℂ) ^ m else 0 := by
    intro y
    have hiff : projPow 7 l m hm (x - y) = 0 ↔ projPow 7 l m hm y = projPow 7 l m hm x := by
      rw [map_sub, sub_eq_zero, eq_comm]
    rw [← Finset.mul_sum, sum_ann_ψ7 hm]
    by_cases hxy : projPow 7 l m hm y = projPow 7 l m hm x
    · rw [if_pos (hiff.mpr hxy), if_pos hxy]
    · rw [if_neg (fun h => hxy (hiff.mp h)), if_neg hxy, mul_zero]
  simp only [hinner]
  rw [← Finset.sum_filter, ← Finset.sum_mul]
  have hA : (7 : ℂ) ^ (l - m) ≠ 0 := pow_ne_zero _ (by norm_num)
  have hB : (7 : ℂ) ^ m ≠ 0 := pow_ne_zero _ (by norm_num)
  have h7 : (7 : ℂ) ^ l = (7 : ℂ) ^ (l - m) * (7 : ℂ) ^ m := by
    rw [← pow_add, Nat.sub_add_cancel hm]
  rw [h7, mul_inv, mul_assoc, mul_comm _ ((7 : ℂ) ^ m), inv_mul_cancel_left₀ hB]

lemma fourierShell7_zero (l : ℕ) : fourierShell7 l 0 = annSet7 l 0 := by
  ext k
  rw [mem_annSet7_iff_addOrderOf (Nat.zero_le l)]
  simp only [fourierShell7, Finset.mem_filter, Finset.mem_univ, true_and, pow_zero,
    Nat.dvd_one]

lemma fourierShell7_eq_sdiff {l c : ℕ} (hc1 : 1 ≤ c) (hc : c ≤ l) :
    fourierShell7 l c = annSet7 l c \ annSet7 l (c - 1) := by
  ext k
  rw [Finset.mem_sdiff, mem_annSet7_iff_addOrderOf hc,
    mem_annSet7_iff_addOrderOf (show c - 1 ≤ l by omega)]
  simp only [fourierShell7, Finset.mem_filter, Finset.mem_univ, true_and]
  constructor
  · intro h
    rw [h]
    refine ⟨dvd_refl _, fun hd => ?_⟩
    have := (Nat.pow_dvd_pow_iff_le_right (by norm_num : 1 < 7)).mp hd
    omega
  · rintro ⟨hd, hnd⟩
    obtain ⟨i, hi, hik⟩ := (Nat.dvd_prime_pow (by norm_num : Nat.Prime 7)).mp hd
    rw [hik] at hnd ⊢
    rcases Nat.lt_or_ge i c with hlt | hge
    · exact absurd (pow_dvd_pow 7 (show i ≤ c - 1 by omega)) hnd
    · rw [show i = c by omega]

lemma fourierProj7_sdiff (l : ℕ) {A B : Finset (ZMod (7 ^ l))} (hBA : B ⊆ A) :
    fourierProj7 l (A \ B) = fourierProj7 l A - fourierProj7 l B := by
  refine LinearMap.ext fun f => funext fun x => ?_
  simp only [LinearMap.sub_apply, Pi.sub_apply, fourierProj7_apply]
  rw [← mul_sub]
  congr 1
  rw [← Finset.sum_sdiff hBA]
  ring

/-- **Part B's shell projections are Part A's.** -/
theorem fourierShellProj_eq_shellProj {l c : ℕ} (hc : c ≤ l) :
    fourierProj7 l (fourierShell7 l c) = shellProj7 l c := by
  simp only [shellProj7, dif_pos hc]
  by_cases h0 : c = 0
  · subst h0
    rw [dif_pos rfl, sub_zero, fourierShell7_zero, fourierProj7_annSet hc]
  · rw [dif_neg h0, fourierShell7_eq_sdiff (by omega) hc,
      fourierProj7_sdiff l (annSet7_mono (Nat.sub_le c 1) hc), fourierProj7_annSet hc,
      fourierProj7_annSet (show c - 1 ≤ l by omega)]

theorem fourierDensity7_eq_condDensity7 (l : ℕ) (x : ℂ) :
    fourierDensity7 l x = condDensity7 l x := by
  unfold fourierDensity7 condDensity7 gradedOp7
  refine Finset.sum_congr rfl (fun c hc => ?_)
  rw [fourierShellProj_eq_shellProj (Nat.lt_succ_iff.mp (Finset.mem_range.mp hc))]

/-- **Proposition 4.4(b) for the conductor density built from fiber averages.** -/
theorem trace_charProj_condDensity7 (l : ℕ) (χ : (ZMod (7 ^ l))ˣ →* ℂ) (x : ℂ) :
    LinearMap.trace ℂ _ (charProj7 l χ ∘ₗ condDensity7 l x) =
      ∑ c ∈ Finset.Icc (condExp7 l χ) l, x ^ c := by
  rw [← fourierDensity7_eq_condDensity7]
  exact trace_charProj_fourierDensity_Icc l χ x

end ShellUnificationSeven

end PadicWilsonBridge

/-! ### Exact Glue Lemmas: `CollatzTransferV117` (ℝ) ↔ `PadicWilsonBridge` (ℂ)

Requires `import CollatzTransferV117` (added at the top of this file in v8; adjust to the local
module path of the file declaring `namespace CollatzTransferV117`). Real observables are
complexified pointwise by `Complex.ofReal`. -/

namespace PadicWilsonBridge

section GlueV117

open CollatzTransferV117

/-- Lift a real-valued observable `ZMod (3 ^ j) → ℝ` to `ZMod (3 ^ j) → ℂ`. -/
def ofRealObs (j : ℕ) (f : ZMod (3 ^ j) → ℝ) : ZMod (3 ^ j) → ℂ :=
  fun v => (f v : ℂ)

/-- 1. `projMod3 j hj` in `CollatzTransferV117` equals `projPow 3 j 1 hj` in `PadicWilsonBridge`. -/
lemma projMod3_eq_projPow (j : ℕ) (hj : 1 ≤ j) :
    projMod3 j hj = projPow 3 j 1 hj := by
  ext v
  simp [projMod3, projPow, ZMod.castHom_apply]

/-- 2. `P_collatz 1` agrees with `P_mod3` under `ℝ → ℂ` coercion. -/
lemma P_collatz_one_ofReal (g : ZMod 3 → ℝ) (v : ZMod 3) :
    P_collatz 1 (ofRealObs 1 g) v = (P_mod3 g v : ℂ) := by
  simp only [P_collatz, P_mod3, ofRealObs, pow_one]
  push_cast
  try rfl

/-- 3. `P_collatz j` agrees with `P_level j` under `ℝ → ℂ` coercion for all `j : ℕ`. -/
lemma P_collatz_ofReal (j : ℕ) (f : ZMod (3 ^ j) → ℝ) (v : ZMod (3 ^ j)) :
    P_collatz j (ofRealObs j f) v = (P_level j f v : ℂ) := by
  simp only [P_collatz, P_level, ofRealObs]
  push_cast
  try rfl

/-- 4. `gWitnessC` in `PadicWilsonBridge` is the `ℝ → ℂ` coercion of `g_witness`. -/
lemma gWitnessC_eq_ofReal_g_witness :
    gWitnessC = ofRealObs 1 g_witness := by
  funext v
  fin_cases v <;> simp [gWitnessC, g_witness, ofRealObs]

/-- 5. `liftPow 3 j 1 hj gWitnessC` equals the `ℝ → ℂ` coercion of `f_lifted j hj`. -/
lemma liftPow_gWitnessC_eq_ofReal_f_lifted (j : ℕ) (hj : 1 ≤ j) :
    liftPow 3 j 1 hj gWitnessC = ofRealObs j (f_lifted j hj) := by
  funext v
  simp only [liftPow, LinearMap.coe_mk, AddHom.coe_mk, gWitnessC_eq_ofReal_g_witness,
    ofRealObs, f_lifted, projMod3_eq_projPow j hj]

/-- 6. Direct transport of `CollatzTransferV117.f_lifted_is_eigenfunction` into `PadicWilsonBridge`:
derives `gWitnessC_lift_is_minus_half_eigenfunction` directly from the `ℝ`-valued theorem. -/
theorem gWitnessC_lift_eigenfunction_from_V117 (j : ℕ) (hj : 1 ≤ j) (v : ZMod (3 ^ j)) :
    P_collatz j (liftPow 3 j 1 hj gWitnessC) v =
      (-1 / 2 : ℂ) * liftPow 3 j 1 hj gWitnessC v := by
  rw [liftPow_gWitnessC_eq_ofReal_f_lifted j hj, P_collatz_ofReal]
  have hR := congr_arg Complex.ofReal (f_lifted_is_eigenfunction j hj v)
  simp only [ofRealObs]
  push_cast at hR ⊢
  exact hR

/-- Complexification of a real observable preserves non-vanishing. -/
lemma ofRealObs_ne_zero {j : ℕ} {f : ZMod (3 ^ j) → ℝ} (hf : f ≠ 0) :
    ofRealObs j f ≠ 0 := by
  intro h0
  apply hf
  funext v
  have hv := congrFun h0 v
  simp only [ofRealObs, Pi.zero_apply, Complex.ofReal_eq_zero] at hv
  exact hv

/-- A real eigenpair `(lam, f)` of `CollatzTransferV117.P_level j` lifts to a complex
eigenpair `((lam : ℂ), ofRealObs j f)` of `P_collatz j`. -/
lemma P_collatz_ofReal_eigenfunction {j : ℕ} {lam : ℝ} {f : ZMod (3 ^ j) → ℝ}
    (hP : P_level j f = lam • f) :
    P_collatz j (ofRealObs j f) = (lam : ℂ) • ofRealObs j f := by
  funext v
  rw [P_collatz_ofReal]
  have hv := congrFun hP v
  simp only [Pi.smul_apply, smul_eq_mul] at hv
  simp only [ofRealObs, Pi.smul_apply, smul_eq_mul, hv, Complex.ofReal_mul]

/--
**Real-Spectrum Classification for `CollatzTransferV117.P_level` (all `j ≥ 1`):**
Every real eigenvalue `lam : ℝ` of `P_level j` (`j ≥ 1`) is `1`, `1 / 2`, or `-1 / 2`.
In particular, all non-stationary real eigenvalues satisfy `|lam| = 1 / 2 < 1`
(no relevant real RG directions across the entire `3 ^ j` tower).
-/
theorem P_level_real_spectrum_classification {j : ℕ} (hj : 1 ≤ j) {lam : ℝ}
    {f : ZMod (3 ^ j) → ℝ} (hP : P_level j f = lam • f) (hf : f ≠ 0) :
    lam = 1 ∨ lam = 1 / 2 ∨ lam = -1 / 2 := by
  by_cases h1 : lam = 1
  · exact Or.inl h1
  · right
    have h1C : (lam : ℂ) ≠ 1 := by
      intro hC
      exact h1 (Complex.ofReal_injective hC)
    have hnormC : ‖(lam : ℂ)‖ = 1 / 2 :=
      no_relevant_directions hj (P_collatz_ofReal_eigenfunction hP) (ofRealObs_ne_zero hf) h1C
    rw [Complex.norm_real, Real.norm_eq_abs] at hnormC
    rcases abs_eq (by norm_num : (0 : ℝ) ≤ 1 / 2) |>.mp hnormC with hpos | hneg
    · exact Or.inl hpos
    · exact Or.inr (by linarith)

end GlueV117

end PadicWilsonBridge

/-! # Part 3 of 3: `CollatzTransfer` (from CollatzTransferTower.lean v123, unchanged apart from its imports) -/

namespace CollatzTransfer
 
open Finset BigOperators
 
/-- For any `j : ℕ`, `3 ^ j` is nonzero, providing `NeZero (3 ^ j)` for `ZMod (3 ^ j)`. -/
instance instNeZeroThreePow (j : ℕ) : NeZero (3 ^ j) :=
  ⟨pow_ne_zero j (by decide)⟩

/-- A sum over `ZMod 3` written out term by term. -/
theorem sum_zmod3 {R : Type*} [AddCommMonoid R] (f : ZMod 3 → R) :
    ∑ v : ZMod 3, f v = f 0 + f 1 + f 2 := by
  rw [show (Finset.univ : Finset (ZMod 3)) = {0, 1, 2} from by decide]
  rw [Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_singleton]
  simp only [add_assoc]

/-- A sum over `ZMod 9` written out term by term. -/
theorem sum_zmod9 {R : Type*} [AddCommMonoid R] (f : ZMod 9 → R) :
    ∑ v : ZMod 9, f v = f 0 + f 1 + f 2 + f 3 + f 4 + f 5 + f 6 + f 7 + f 8 := by
  rw [show (Finset.univ : Finset (ZMod 9)) = {0, 1, 2, 3, 4, 5, 6, 7, 8} from by decide]
  rw [Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_insert (by decide), Finset.sum_singleton]
  simp only [add_assoc]

/-- `2` is a unit in `ZMod (3 ^ j)` (so `2 * 2⁻¹ = 1` there; `ZMod (3 ^ j)` is not a field). -/
theorem isUnit_two_three_pow (j : ℕ) : IsUnit (2 : ZMod (3 ^ j)) := by
  rw [show (2 : ZMod (3 ^ j)) = ((2 : ℕ) : ZMod (3 ^ j)) by norm_num, ZMod.isUnit_iff_coprime]
  exact Nat.Coprime.pow_right j (by decide : Nat.Coprime 2 3)

theorem two_mul_inv_two_pow (j : ℕ) : (2 : ZMod (3 ^ j)) * (2 : ZMod (3 ^ j))⁻¹ = 1 :=
  ZMod.mul_inv_of_unit _ (isUnit_two_three_pow j)

theorem inv_two_mul_two_pow (j : ℕ) : (2 : ZMod (3 ^ j))⁻¹ * (2 : ZMod (3 ^ j)) = 1 :=
  ZMod.inv_mul_of_unit _ (isUnit_two_three_pow j)

/-- The two branches `2⁻¹ * v` and `2⁻¹ * (3 * v + 1)` evaluated at every `v : ZMod 3`
(`2⁻¹ = 2` in `ZMod 3`); used as a simp set by the finite-level proofs below. -/
theorem inv2_table3 :
    (2 : ZMod 3)⁻¹ * 0 = 0 ∧ (2 : ZMod 3)⁻¹ * (3 * 0 + 1) = 2 ∧
    (2 : ZMod 3)⁻¹ * 1 = 2 ∧ (2 : ZMod 3)⁻¹ * (3 * 1 + 1) = 2 ∧
    (2 : ZMod 3)⁻¹ * 2 = 1 ∧ (2 : ZMod 3)⁻¹ * (3 * 2 + 1) = 2 := by
  rw [ZMod.inv_eq_of_mul_eq_one 3 2 2 (by decide)]
  decide

/-- The two branches `2⁻¹ * v` and `2⁻¹ * (3 * v + 1)` evaluated at every `v : ZMod 9`
(`2⁻¹ = 5` in `ZMod 9`); used as a simp set by the finite-level proofs below. -/
theorem inv2_table9 :
    (2 : ZMod 9)⁻¹ * 0 = 0 ∧ (2 : ZMod 9)⁻¹ * (3 * 0 + 1) = 5 ∧
    (2 : ZMod 9)⁻¹ * 1 = 5 ∧ (2 : ZMod 9)⁻¹ * (3 * 1 + 1) = 2 ∧
    (2 : ZMod 9)⁻¹ * 2 = 1 ∧ (2 : ZMod 9)⁻¹ * (3 * 2 + 1) = 8 ∧
    (2 : ZMod 9)⁻¹ * 3 = 6 ∧ (2 : ZMod 9)⁻¹ * (3 * 3 + 1) = 5 ∧
    (2 : ZMod 9)⁻¹ * 4 = 2 ∧ (2 : ZMod 9)⁻¹ * (3 * 4 + 1) = 2 ∧
    (2 : ZMod 9)⁻¹ * 5 = 7 ∧ (2 : ZMod 9)⁻¹ * (3 * 5 + 1) = 8 ∧
    (2 : ZMod 9)⁻¹ * 6 = 3 ∧ (2 : ZMod 9)⁻¹ * (3 * 6 + 1) = 5 ∧
    (2 : ZMod 9)⁻¹ * 7 = 8 ∧ (2 : ZMod 9)⁻¹ * (3 * 7 + 1) = 2 ∧
    (2 : ZMod 9)⁻¹ * 8 = 4 ∧ (2 : ZMod 9)⁻¹ * (3 * 8 + 1) = 8 := by
  rw [ZMod.inv_eq_of_mul_eq_one 9 2 5 (by decide)]
  decide

/-- The two branches `2⁻¹ * v` and `2⁻¹ * (3 * v + 1)` evaluated at every `v : ZMod 27`
(`2⁻¹ = 14` in `ZMod 27`); used as a simp set by the finite-level proofs below. -/
theorem inv2_table27 :
    (2 : ZMod 27)⁻¹ * 0 = 0 ∧ (2 : ZMod 27)⁻¹ * (3 * 0 + 1) = 14 ∧
    (2 : ZMod 27)⁻¹ * 1 = 14 ∧ (2 : ZMod 27)⁻¹ * (3 * 1 + 1) = 2 ∧
    (2 : ZMod 27)⁻¹ * 2 = 1 ∧ (2 : ZMod 27)⁻¹ * (3 * 2 + 1) = 17 ∧
    (2 : ZMod 27)⁻¹ * 3 = 15 ∧ (2 : ZMod 27)⁻¹ * (3 * 3 + 1) = 5 ∧
    (2 : ZMod 27)⁻¹ * 4 = 2 ∧ (2 : ZMod 27)⁻¹ * (3 * 4 + 1) = 20 ∧
    (2 : ZMod 27)⁻¹ * 5 = 16 ∧ (2 : ZMod 27)⁻¹ * (3 * 5 + 1) = 8 ∧
    (2 : ZMod 27)⁻¹ * 6 = 3 ∧ (2 : ZMod 27)⁻¹ * (3 * 6 + 1) = 23 ∧
    (2 : ZMod 27)⁻¹ * 7 = 17 ∧ (2 : ZMod 27)⁻¹ * (3 * 7 + 1) = 11 ∧
    (2 : ZMod 27)⁻¹ * 8 = 4 ∧ (2 : ZMod 27)⁻¹ * (3 * 8 + 1) = 26 ∧
    (2 : ZMod 27)⁻¹ * 9 = 18 ∧ (2 : ZMod 27)⁻¹ * (3 * 9 + 1) = 14 ∧
    (2 : ZMod 27)⁻¹ * 10 = 5 ∧ (2 : ZMod 27)⁻¹ * (3 * 10 + 1) = 2 ∧
    (2 : ZMod 27)⁻¹ * 11 = 19 ∧ (2 : ZMod 27)⁻¹ * (3 * 11 + 1) = 17 ∧
    (2 : ZMod 27)⁻¹ * 12 = 6 ∧ (2 : ZMod 27)⁻¹ * (3 * 12 + 1) = 5 ∧
    (2 : ZMod 27)⁻¹ * 13 = 20 ∧ (2 : ZMod 27)⁻¹ * (3 * 13 + 1) = 20 ∧
    (2 : ZMod 27)⁻¹ * 14 = 7 ∧ (2 : ZMod 27)⁻¹ * (3 * 14 + 1) = 8 ∧
    (2 : ZMod 27)⁻¹ * 15 = 21 ∧ (2 : ZMod 27)⁻¹ * (3 * 15 + 1) = 23 ∧
    (2 : ZMod 27)⁻¹ * 16 = 8 ∧ (2 : ZMod 27)⁻¹ * (3 * 16 + 1) = 11 ∧
    (2 : ZMod 27)⁻¹ * 17 = 22 ∧ (2 : ZMod 27)⁻¹ * (3 * 17 + 1) = 26 ∧
    (2 : ZMod 27)⁻¹ * 18 = 9 ∧ (2 : ZMod 27)⁻¹ * (3 * 18 + 1) = 14 ∧
    (2 : ZMod 27)⁻¹ * 19 = 23 ∧ (2 : ZMod 27)⁻¹ * (3 * 19 + 1) = 2 ∧
    (2 : ZMod 27)⁻¹ * 20 = 10 ∧ (2 : ZMod 27)⁻¹ * (3 * 20 + 1) = 17 ∧
    (2 : ZMod 27)⁻¹ * 21 = 24 ∧ (2 : ZMod 27)⁻¹ * (3 * 21 + 1) = 5 ∧
    (2 : ZMod 27)⁻¹ * 22 = 11 ∧ (2 : ZMod 27)⁻¹ * (3 * 22 + 1) = 20 ∧
    (2 : ZMod 27)⁻¹ * 23 = 25 ∧ (2 : ZMod 27)⁻¹ * (3 * 23 + 1) = 8 ∧
    (2 : ZMod 27)⁻¹ * 24 = 12 ∧ (2 : ZMod 27)⁻¹ * (3 * 24 + 1) = 23 ∧
    (2 : ZMod 27)⁻¹ * 25 = 26 ∧ (2 : ZMod 27)⁻¹ * (3 * 25 + 1) = 11 ∧
    (2 : ZMod 27)⁻¹ * 26 = 13 ∧ (2 : ZMod 27)⁻¹ * (3 * 26 + 1) = 26 := by
  rw [ZMod.inv_eq_of_mul_eq_one 27 2 14 (by decide)]
  decide
 
/-- Level-`j` coin-flip transfer operator `P_j` acting on `f : ZMod (3 ^ j) → ℝ`. -/
def P_level (j : ℕ) (f : ZMod (3 ^ j) → ℝ) (v : ZMod (3 ^ j)) : ℝ :=
  (1 / 2 : ℝ) * f ((2 : ZMod (3 ^ j))⁻¹ * v) +
  (1 / 2 : ℝ) * f ((2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1))
 
/-! ### Section 1: Level `j = 1` (`ZMod 3`) Base Case & Lifts to `j ≥ 1` -/
 
/-- Mod-3 coin-flip transfer operator `P₁` acting on `f : ZMod 3 → ℝ`. -/
def P_mod3 (f : ZMod 3 → ℝ) (v : ZMod 3) : ℝ :=
  (1 / 2 : ℝ) * f ((2 : ZMod 3)⁻¹ * v) +
  (1 / 2 : ℝ) * f ((2 : ZMod 3)⁻¹ * (3 * v + 1))
 
/-- Exact witness function `g : ZMod 3 → ℝ` for eigenvalue `-1/2`. -/
def g_witness : ZMod 3 → ℝ
  | 0 => 1 / 2
  | 1 => 2
  | 2 => -1
 
/-- Base case (`j = 1`): `P_mod3 g_witness = (-1/2) * g_witness` on `ZMod 3`. -/
theorem g_witness_is_eigenfunction (v : ZMod 3) :
    P_mod3 g_witness v = (-1 / 2 : ℝ) * g_witness v := by
  have h2inv : (2 : ZMod 3)⁻¹ = 2 := ZMod.inv_eq_of_mul_eq_one _ 2 2 (by decide)
  have key : ∀ w : ZMod 3, w = 0 ∨ w = 1 ∨ w = 2 := by decide
  rcases key v with rfl | rfl | rfl
  · unfold P_mod3
    rw [h2inv]
    show (1 / 2 : ℝ) * g_witness 0 + (1 / 2 : ℝ) * g_witness 2 = (-1 / 2 : ℝ) * g_witness 0
    norm_num [g_witness]
  · unfold P_mod3
    rw [h2inv]
    show (1 / 2 : ℝ) * g_witness 2 + (1 / 2 : ℝ) * g_witness 2 = (-1 / 2 : ℝ) * g_witness 1
    norm_num [g_witness]
  · unfold P_mod3
    rw [h2inv]
    show (1 / 2 : ℝ) * g_witness 1 + (1 / 2 : ℝ) * g_witness 2 = (-1 / 2 : ℝ) * g_witness 2
    norm_num [g_witness]
 
/-- Canonical projection `ZMod (3 ^ j) →+* ZMod 3` for `j ≥ 1`. -/
def projMod3 (j : ℕ) (hj : 1 ≤ j) : ZMod (3 ^ j) →+* ZMod 3 :=
  ZMod.castHom (dvd_pow_self 3 (Nat.pos_iff_ne_zero.mp hj)) (ZMod 3)
 
/-- `projMod3` commutes with `2⁻¹` in `ZMod (3 ^ j)` for all `j ≥ 1`. -/
lemma projMod3_inv_two (j : ℕ) (hj : 1 ≤ j) :
    projMod3 j hj ((2 : ZMod (3 ^ j))⁻¹) = (2 : ZMod 3)⁻¹ := by
  have h2j : 2 < 3 ^ j := by
    have h3 : (3 : ℕ) ≤ 3 ^ j :=
      Nat.le_self_pow (Nat.pos_iff_ne_zero.mp hj) 3
    omega
  have h2_j_unit : IsUnit (2 : ZMod (3 ^ j)) := by
    rw [← ZMod.natCast_zmod_val (2 : ZMod (3 ^ j)), ZMod.isUnit_iff_coprime]
    have hval : ((2 : ZMod (3 ^ j)).val) = 2 := by
      rw [show (2 : ZMod (3 ^ j)) = ((2 : ℕ) : ZMod (3 ^ j)) by norm_num, ZMod.val_natCast,
        Nat.mod_eq_of_lt h2j]
    rw [hval]
    exact Nat.Coprime.pow_right j (by decide : Nat.Coprime 2 3)
  have key : projMod3 j hj ((2 : ZMod (3 ^ j))⁻¹) * (2 : ZMod 3) = 1 := by
    rw [← map_ofNat (projMod3 j hj) 2, ← map_mul,
      ZMod.inv_mul_of_unit _ h2_j_unit, map_one]
  exact Eq.symm (ZMod.inv_eq_of_mul_eq_one _ _ _ (by rw [mul_comm]; exact key))
 
/-- `P_level j` intertwines with `P_mod3` on lifted functions (`P_j (g ∘ π_j) = (P_mod3 g) ∘ π_j`). -/
lemma P_level_intertwines_projMod3 (j : ℕ) (hj : 1 ≤ j) (g : ZMod 3 → ℝ) (v : ZMod (3 ^ j)) :
    P_level j (fun x => g (projMod3 j hj x)) v = P_mod3 g (projMod3 j hj v) := by
  unfold P_level P_mod3
  dsimp only
  simp only [map_mul, map_add, map_ofNat, map_one, projMod3_inv_two j hj]
 
/-- Lifted observable `f_j(v) = g_witness (v mod 3)` on `ZMod (3 ^ j)`. -/
def f_lifted (j : ℕ) (hj : 1 ≤ j) (v : ZMod (3 ^ j)) : ℝ :=
  g_witness (projMod3 j hj v)
 
/--
**Lower Bound Across All Finite Levels (`j ≥ 1`):**
For every `j ≥ 1` and every `v ∈ ZMod (3 ^ j)`, `P_j f_lifted = (-1/2) * f_lifted`,
establishing `|λ₂(P_j)| ≥ 1/2` across the entire tower `j ≥ 1`.
-/
theorem f_lifted_is_eigenfunction (j : ℕ) (hj : 1 ≤ j) (v : ZMod (3 ^ j)) :
    P_level j (f_lifted j hj) v = (-1 / 2 : ℝ) * f_lifted j hj v := by
  unfold f_lifted
  rw [P_level_intertwines_projMod3 j hj g_witness v]
  exact g_witness_is_eigenfunction (projMod3 j hj v)
 
/-! ### Section 2: Spectral Separation & Stationary Orthogonality (`j ≥ 1`) -/
 
/--
**Non-triviality & Linear Independence from `1`:**
`f_lifted j hj` takes distinct values (`2` vs `-1`) on `ZMod (3 ^ j)`, proving it is
non-constant and hence linearly independent from the stationary constant eigenfunction `1` (`λ₁ = 1`).
-/
theorem f_lifted_nonconstant (j : ℕ) (hj : 1 ≤ j) :
    ∃ u w : ZMod (3 ^ j), f_lifted j hj u ≠ f_lifted j hj w := by
  refine ⟨1, 2, ?_⟩
  simp only [f_lifted, map_one, map_ofNat, g_witness]
  norm_num
 
/--
**Orthogonality to Any True Stationary Measure (`⟨μ_j, f_j⟩ = 0`):**
By duality, `f_lifted j hj` has zero expectation against any left-invariant functional `μ`
satisfying `μ P_j = μ` at any level `j ≥ 1`.
-/
theorem f_lifted_orthogonal_to_any_invariant (j : ℕ) (hj : 1 ≤ j)
    (μ : ZMod (3 ^ j) → ℝ)
    (hμ : ∀ f : ZMod (3 ^ j) → ℝ,
      ∑ v : ZMod (3 ^ j), μ v * P_level j f v = ∑ v : ZMod (3 ^ j), μ v * f v) :
    ∑ v : ZMod (3 ^ j), μ v * f_lifted j hj v = 0 := by
  have h1 : ∑ v : ZMod (3 ^ j), μ v * P_level j (f_lifted j hj) v =
      ∑ v : ZMod (3 ^ j), μ v * f_lifted j hj v := hμ (f_lifted j hj)
  have h2 : ∑ v : ZMod (3 ^ j), μ v * P_level j (f_lifted j hj) v =
      (-1 / 2 : ℝ) * ∑ v : ZMod (3 ^ j), μ v * f_lifted j hj v := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro v _
    rw [f_lifted_is_eigenfunction j hj v]
    ring
  linarith
 
/-- Exact stationary invariant measure `π₁` on `ZMod 3` (`π₁ P_mod3 = π₁`). -/
def stationaryMod3 : ZMod 3 → ℝ
  | 0 => 0
  | 1 => 1 / 3
  | 2 => 2 / 3
 
lemma stationaryMod3_sum_one : ∑ v : ZMod 3, stationaryMod3 v = 1 := by
  rw [sum_zmod3]
  norm_num [stationaryMod3]
 
lemma stationaryMod3_is_invariant (f : ZMod 3 → ℝ) :
    ∑ v : ZMod 3, stationaryMod3 v * P_mod3 f v = ∑ v : ZMod 3, stationaryMod3 v * f v := by
  rw [sum_zmod3, sum_zmod3]
  simp only [P_mod3, inv2_table3, stationaryMod3] <;> ring
 
/--
Auxiliary fiber-uniform lift `ν_j(v) = 3^{-(j-1)} * π₁(v mod 3)` on `ZMod (3 ^ j)`.
Note: This equals the true stationary measure only at `j = 1`; for `j ≥ 2` it is
strictly an auxiliary fiber-averaged weight, not an invariant measure of `P_j`.
-/
def fiberUniformLift (j : ℕ) (hj : 1 ≤ j) (v : ZMod (3 ^ j)) : ℝ :=
  (1 / (3 : ℝ) ^ (j - 1)) * stationaryMod3 (projMod3 j hj v)
 
/-- Each fiber `{v : ZMod (3 ^ j) | projMod3 j hj v = r}` has cardinality `3 ^ (j - 1)`. -/
lemma card_fiber_projMod3 (j : ℕ) (hj : 1 ≤ j) (r : ZMod 3) :
    (Finset.univ.filter (fun v : ZMod (3 ^ j) => projMod3 j hj v = r)).card = 3 ^ (j - 1) := by
  have h_surj : Function.Surjective (projMod3 j hj) :=
    ZMod.castHom_surjective (dvd_pow_self 3 (Nat.pos_iff_ne_zero.mp hj))
  have h_card : ∀ a b : ZMod 3,
      (Finset.univ.filter (fun v : ZMod (3 ^ j) => projMod3 j hj v = a)).card =
      (Finset.univ.filter (fun v : ZMod (3 ^ j) => projMod3 j hj v = b)).card := by
    intro a b
    obtain ⟨v₀, hv₀⟩ := h_surj (b - a)
    refine Finset.card_bij (fun v _ => v + v₀) ?_ ?_ ?_
    · intro v hv
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv ⊢
      rw [map_add, hv, hv₀]
      exact add_sub_cancel a b
    · intro v₁ _ v₂ _ h
      exact add_right_cancel h
    · intro w hw
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hw
      refine ⟨w - v₀, ?_, sub_add_cancel w v₀⟩
      simp only [Finset.mem_filter, Finset.mem_univ, true_and, map_sub, hw, hv₀]
      exact sub_sub_self b a
  have h_sum : ∑ a : ZMod 3,
      (Finset.univ.filter (fun v : ZMod (3 ^ j) => projMod3 j hj v = a)).card = 3 ^ j := by
    rw [← Finset.card_eq_sum_card_fiberwise (f := projMod3 j hj)
      (t := Finset.univ) (fun _ _ => Finset.mem_univ _),
      Finset.card_univ, ZMod.card]
  rw [sum_zmod3, h_card 0 r, h_card 1 r, h_card 2 r] at h_sum
  have hj_pow : 3 ^ j = 3 * 3 ^ (j - 1) := by
    conv_lhs => rw [← Nat.sub_add_cancel hj, pow_succ']
  omega
 
/-- Orthogonality of `f_lifted j hj` against the fiber-uniform lift `ν_j` at every level `j ≥ 1`. -/
theorem f_lifted_orthogonal_to_fiberUniformLift (j : ℕ) (hj : 1 ≤ j) :
    ∑ v : ZMod (3 ^ j), fiberUniformLift j hj v * f_lifted j hj v = 0 := by
  unfold fiberUniformLift f_lifted
  rw [← Finset.sum_fiberwise_of_maps_to (g := projMod3 j hj) (t := Finset.univ)
    (fun _ _ => Finset.mem_univ _)]
  have h_eval : ∀ r : ZMod 3,
      (∑ v ∈ Finset.univ.filter (fun v : ZMod (3 ^ j) => projMod3 j hj v = r),
        (1 / (3 : ℝ) ^ (j - 1)) * stationaryMod3 (projMod3 j hj v) * g_witness (projMod3 j hj v)) =
      stationaryMod3 r * g_witness r := by
    intro r
    have h_const : ∀ v ∈ Finset.univ.filter (fun v : ZMod (3 ^ j) => projMod3 j hj v = r),
        (1 / (3 : ℝ) ^ (j - 1)) * stationaryMod3 (projMod3 j hj v) * g_witness (projMod3 j hj v) =
        (1 / (3 : ℝ) ^ (j - 1)) * (stationaryMod3 r * g_witness r) := by
      intro v hv
      simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hv
      rw [hv]
      ring
    rw [Finset.sum_congr rfl h_const, Finset.sum_const, card_fiber_projMod3 j hj r, nsmul_eq_mul]
    have hpow_ne : ((3 : ℝ) ^ (j - 1)) ≠ 0 := pow_ne_zero _ (by norm_num)
    push_cast
    field_simp [hpow_ne]
  rw [Finset.sum_congr rfl (fun r _ => h_eval r), sum_zmod3]
  norm_num [stationaryMod3, g_witness]
 
/-! ### Section 3: Level `j = 2` (`ZMod 9`) Witnesses, Stationary Measure & Lifts to `j ≥ 2` -/
 
/-- Level-2 (`ZMod 9`) coin-flip transfer operator over `ℝ`. -/
def P_mod9 (f : ZMod 9 → ℝ) (v : ZMod 9) : ℝ :=
  (1 / 2 : ℝ) * f ((2 : ZMod 9)⁻¹ * v) +
  (1 / 2 : ℝ) * f ((2 : ZMod 9)⁻¹ * (3 * v + 1))
 
/-- Level-2 (`ZMod 9`) coin-flip transfer operator over `ℂ` for complex spectral bounds. -/
def P_mod9C (f : ZMod 9 → ℂ) (v : ZMod 9) : ℂ :=
  (1 / 2 : ℂ) * f ((2 : ZMod 9)⁻¹ * v) +
  (1 / 2 : ℂ) * f ((2 : ZMod 9)⁻¹ * (3 * v + 1))
 
/-- Witness `ψ₀ = 1_{v = 0}` on `ZMod 9` with eigenvalue `+1/2`. -/
def witness9_zero : ZMod 9 → ℝ
  | 0 => 1
  | 1 => 0
  | 2 => 0
  | 3 => 0
  | 4 => 0
  | 5 => 0
  | 6 => 0
  | 7 => 0
  | 8 => 0

/-- Witness `ψ₊ = 1_{v = 3} + 1_{v = 6}` on `ZMod 9` with eigenvalue `+1/2`. -/
def witness9_plus : ZMod 9 → ℝ
  | 0 => 0
  | 1 => 0
  | 2 => 0
  | 3 => 1
  | 4 => 0
  | 5 => 0
  | 6 => 1
  | 7 => 0
  | 8 => 0

/-- Witness `ψ₋ = -1_{v = 3} + 1_{v = 6}` on `ZMod 9` with eigenvalue `-1/2`. -/
def witness9_minus : ZMod 9 → ℝ
  | 0 => 0
  | 1 => 0
  | 2 => 0
  | 3 => -1
  | 4 => 0
  | 5 => 0
  | 6 => 1
  | 7 => 0
  | 8 => 0

theorem witness9_zero_is_eigenfunction (v : ZMod 9) :
    P_mod9 witness9_zero v = (1 / 2 : ℝ) * witness9_zero v := by
  have key : ∀ w : ZMod 9, w = 0 ∨ w = 1 ∨ w = 2 ∨ w = 3 ∨ w = 4 ∨ w = 5 ∨ w = 6 ∨ w = 7 ∨ w = 8 := by decide
  rcases key v with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp only [P_mod9, inv2_table9, witness9_zero] <;> norm_num

theorem witness9_plus_is_eigenfunction (v : ZMod 9) :
    P_mod9 witness9_plus v = (1 / 2 : ℝ) * witness9_plus v := by
  have key : ∀ w : ZMod 9, w = 0 ∨ w = 1 ∨ w = 2 ∨ w = 3 ∨ w = 4 ∨ w = 5 ∨ w = 6 ∨ w = 7 ∨ w = 8 := by decide
  rcases key v with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp only [P_mod9, inv2_table9, witness9_plus] <;> norm_num

theorem witness9_minus_is_eigenfunction (v : ZMod 9) :
    P_mod9 witness9_minus v = (-1 / 2 : ℝ) * witness9_minus v := by
  have key : ∀ w : ZMod 9, w = 0 ∨ w = 1 ∨ w = 2 ∨ w = 3 ∨ w = 4 ∨ w = 5 ∨ w = 6 ∨ w = 7 ∨ w = 8 := by decide
  rcases key v with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp only [P_mod9, inv2_table9, witness9_minus] <;> norm_num

/-- Canonical projection `ZMod (3 ^ j) →+* ZMod 9` for `j ≥ 2`. -/
def projMod9 (j : ℕ) (hj : 2 ≤ j) : ZMod (3 ^ j) →+* ZMod 9 :=
  ZMod.castHom (by
    have hdiv : 3 ^ 2 ∣ 3 ^ j := pow_dvd_pow 3 hj
    simpa using hdiv) (ZMod 9)
 
lemma projMod9_inv_two (j : ℕ) (hj : 2 ≤ j) :
    projMod9 j hj ((2 : ZMod (3 ^ j))⁻¹) = (2 : ZMod 9)⁻¹ := by
  have h2j : 2 < 3 ^ j := by
    have h9 : 9 ≤ 3 ^ j := by
      calc 9 = 3 ^ 2 := by norm_num
      _ ≤ 3 ^ j := Nat.pow_le_pow_right (by decide) hj
    omega
  have h2_j_unit : IsUnit (2 : ZMod (3 ^ j)) := by
    rw [← ZMod.natCast_zmod_val (2 : ZMod (3 ^ j)), ZMod.isUnit_iff_coprime]
    have hval : ((2 : ZMod (3 ^ j)).val) = 2 := by
      rw [show (2 : ZMod (3 ^ j)) = ((2 : ℕ) : ZMod (3 ^ j)) by norm_num, ZMod.val_natCast,
        Nat.mod_eq_of_lt h2j]
    rw [hval]
    exact Nat.Coprime.pow_right j (by decide : Nat.Coprime 2 3)
  have key : projMod9 j hj ((2 : ZMod (3 ^ j))⁻¹) * (2 : ZMod 9) = 1 := by
    rw [← map_ofNat (projMod9 j hj) 2, ← map_mul,
      ZMod.inv_mul_of_unit _ h2_j_unit, map_one]
  exact Eq.symm (ZMod.inv_eq_of_mul_eq_one _ _ _ (by rw [mul_comm]; exact key))
 
lemma P_level_intertwines_projMod9 (j : ℕ) (hj : 2 ≤ j) (g : ZMod 9 → ℝ) (v : ZMod (3 ^ j)) :
    P_level j (fun x => g (projMod9 j hj x)) v = P_mod9 g (projMod9 j hj v) := by
  unfold P_level P_mod9
  dsimp only
  simp only [map_mul, map_add, map_ofNat, map_one, projMod9_inv_two j hj]
 
def lifted9 (j : ℕ) (hj : 2 ≤ j) (g : ZMod 9 → ℝ) (v : ZMod (3 ^ j)) : ℝ :=
  g (projMod9 j hj v)
 
theorem lifted9_zero_is_eigenfunction (j : ℕ) (hj : 2 ≤ j) (v : ZMod (3 ^ j)) :
    P_level j (lifted9 j hj witness9_zero) v = (1 / 2 : ℝ) * lifted9 j hj witness9_zero v := by
  unfold lifted9
  rw [P_level_intertwines_projMod9 j hj witness9_zero v]
  exact witness9_zero_is_eigenfunction (projMod9 j hj v)
 
theorem lifted9_plus_is_eigenfunction (j : ℕ) (hj : 2 ≤ j) (v : ZMod (3 ^ j)) :
    P_level j (lifted9 j hj witness9_plus) v = (1 / 2 : ℝ) * lifted9 j hj witness9_plus v := by
  unfold lifted9
  rw [P_level_intertwines_projMod9 j hj witness9_plus v]
  exact witness9_plus_is_eigenfunction (projMod9 j hj v)
 
theorem lifted9_minus_is_eigenfunction (j : ℕ) (hj : 2 ≤ j) (v : ZMod (3 ^ j)) :
    P_level j (lifted9 j hj witness9_minus) v = (-1 / 2 : ℝ) * lifted9 j hj witness9_minus v := by
  unfold lifted9
  rw [P_level_intertwines_projMod9 j hj witness9_minus v]
  exact witness9_minus_is_eigenfunction (projMod9 j hj v)
 
/-! ### Linear Independence of the 2-Dimensional `λ = +1/2` and `λ = -1/2` Witness Families (`j ≥ 2`) -/
 
/-- Helper evaluating `projMod9 j hj` on small natural literals `0, 3`. -/
lemma projMod9_zero (j : ℕ) (hj : 2 ≤ j) : projMod9 j hj 0 = 0 :=
  map_zero (projMod9 j hj)
 
lemma projMod9_three (j : ℕ) (hj : 2 ≤ j) : projMod9 j hj 3 = 3 :=
  map_ofNat (projMod9 j hj) 3
 
/-- Helper evaluating `projMod3 j hj` on small natural literals `0, 3`. -/
lemma projMod3_zero (j : ℕ) (hj : 1 ≤ j) : projMod3 j hj 0 = 0 :=
  map_zero (projMod3 j hj)
 
lemma projMod3_three (j : ℕ) (hj : 1 ≤ j) : projMod3 j hj 3 = 0 := by
  rw [map_ofNat (projMod3 j hj) 3]
  decide
 
/--
**2D Linear Independence for `λ = +1/2` (`j ≥ 2`):**
At every level `j ≥ 2`, the lifted witnesses `lifted9 j hj witness9_zero` and
`lifted9 j hj witness9_plus` are linearly independent in `ZMod (3 ^ j) → ℝ`
(both in elementary scalar form and as `LinearIndependent ℝ ![...]`).
-/
theorem plus_half_witnesses_linear_independent_scalars (j : ℕ) (hj : 2 ≤ j) (a b : ℝ)
    (h : ∀ v : ZMod (3 ^ j),
      a * lifted9 j hj witness9_zero v + b * lifted9 j hj witness9_plus v = 0) :
    a = 0 ∧ b = 0 := by
  have h0 := h 0
  have h3 := h 3
  have d30 : (3 : ZMod 9) ≠ 0 := by decide
  have d03 : (0 : ZMod 9) ≠ 3 := by decide
  have d06 : (0 : ZMod 9) ≠ 6 := by decide
  simp only [lifted9, projMod9_zero j hj, projMod9_three j hj,
    witness9_zero, witness9_plus, d30, d03, d06] at h0 h3
  norm_num at h0 h3
  exact ⟨h0, h3⟩
 
theorem plus_half_witnesses_linearIndependent (j : ℕ) (hj : 2 ≤ j) :
    LinearIndependent ℝ ![lifted9 j hj witness9_zero, lifted9 j hj witness9_plus] := by
  rw [Fintype.linearIndependent_iff]
  intro c hc
  have h_pt : ∀ v : ZMod (3 ^ j),
      c 0 * lifted9 j hj witness9_zero v + c 1 * lifted9 j hj witness9_plus v = 0 := by
    intro v
    have hv := congrFun hc v
    simpa [Fin.sum_univ_two] using hv
  obtain ⟨hc0, hc1⟩ := plus_half_witnesses_linear_independent_scalars j hj (c 0) (c 1) h_pt
  intro i
  fin_cases i <;> assumption
 
/--
**2D Linear Independence for `λ = -1/2` (`j ≥ 2`):**
At every level `j ≥ 2`, the mod-3 lifted witness `f_lifted j (by omega)` and the
mod-9 lifted witness `lifted9 j hj witness9_minus` are linearly independent in `ZMod (3 ^ j) → ℝ`.
-/
theorem minus_half_witnesses_linear_independent_scalars (j : ℕ) (hj : 2 ≤ j) (a b : ℝ)
    (h : ∀ v : ZMod (3 ^ j),
      a * f_lifted j (by omega) v + b * lifted9 j hj witness9_minus v = 0) :
    a = 0 ∧ b = 0 := by
  have h0 := h 0
  have h3 := h 3
  have d03 : (0 : ZMod 9) ≠ 3 := by decide
  have d06 : (0 : ZMod 9) ≠ 6 := by decide
  simp only [f_lifted, lifted9, projMod3_zero j (by omega), projMod3_three j (by omega),
    projMod9_zero j hj, projMod9_three j hj, g_witness, witness9_minus, d03, d06] at h0 h3
  norm_num at h0 h3
  have ha : a = 0 := by linarith
  have hb : b = 0 := by linarith
  exact ⟨ha, hb⟩
 
theorem minus_half_witnesses_linearIndependent (j : ℕ) (hj : 2 ≤ j) :
    LinearIndependent ℝ ![f_lifted j (by omega), lifted9 j hj witness9_minus] := by
  rw [Fintype.linearIndependent_iff]
  intro c hc
  have h_pt : ∀ v : ZMod (3 ^ j),
      c 0 * f_lifted j (by omega) v + c 1 * lifted9 j hj witness9_minus v = 0 := by
    intro v
    have hv := congrFun hc v
    simpa [Fin.sum_univ_two] using hv
  obtain ⟨hc0, hc1⟩ := minus_half_witnesses_linear_independent_scalars j hj (c 0) (c 1) h_pt
  intro i
  fin_cases i <;> assumption
 
/-- Exact stationary probability distribution `π₂` on `ZMod 9` (`π₂ P_mod9 = π₂`). -/
def stationaryMod9 : ZMod 9 → ℝ
  | 0 => 0
  | 1 => 8 / 63
  | 2 => 16 / 63
  | 3 => 0
  | 4 => 11 / 63
  | 5 => 4 / 63
  | 6 => 0
  | 7 => 2 / 63
  | 8 => 22 / 63
 
lemma stationaryMod9_sum_one : ∑ v : ZMod 9, stationaryMod9 v = 1 := by
  rw [sum_zmod9]
  norm_num [stationaryMod9]
 
lemma stationaryMod9_is_invariant (f : ZMod 9 → ℝ) :
    ∑ v : ZMod 9, stationaryMod9 v * P_mod9 f v = ∑ v : ZMod 9, stationaryMod9 v * f v := by
  rw [sum_zmod9, sum_zmod9]
  simp only [P_mod9, inv2_table9, stationaryMod9] <;> ring
 
/-! ### Section 4: Exact Upper Bound `|λ₂(P₂)| = 1/2` over `ℂ` and `ℝ` -/
 
/-- Helper evaluating `P_mod9C` cleanly on all 9 residues of `ZMod 9`. -/
lemma P_mod9C_eq (f : ZMod 9 → ℂ) :
    P_mod9C f 0 = (1 / 2) * f 0 + (1 / 2) * f 5 ∧
    P_mod9C f 1 = (1 / 2) * f 5 + (1 / 2) * f 2 ∧
    P_mod9C f 2 = (1 / 2) * f 1 + (1 / 2) * f 8 ∧
    P_mod9C f 3 = (1 / 2) * f 6 + (1 / 2) * f 5 ∧
    P_mod9C f 4 = (1 / 2) * f 2 + (1 / 2) * f 2 ∧
    P_mod9C f 5 = (1 / 2) * f 7 + (1 / 2) * f 8 ∧
    P_mod9C f 6 = (1 / 2) * f 3 + (1 / 2) * f 5 ∧
    P_mod9C f 7 = (1 / 2) * f 8 + (1 / 2) * f 2 ∧
    P_mod9C f 8 = (1 / 2) * f 4 + (1 / 2) * f 8 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> simp only [P_mod9C, inv2_table9]
 
/--
Annihilating Polynomial Identity at Level `j = 2`:
The separable polynomial `(X - 1)(64 X⁶ - 1) = 64 X⁷ - 64 X⁶ - X + 1` annihilates
`P_mod9C` identically on `ZMod 9 → ℂ`. (The iterates are unfolded to nested applications, which
are definitionally equal, and each application is evaluated pointwise with `inv2_table9`.)
-/
theorem P_mod9C_annihilating_poly (f : ZMod 9 → ℂ) (v : ZMod 9) :
    64 * (P_mod9C^[7] f v) - 64 * (P_mod9C^[6] f v) - P_mod9C f v + f v = 0 := by
  show 64 * P_mod9C (P_mod9C (P_mod9C (P_mod9C (P_mod9C (P_mod9C (P_mod9C f)))))) v - 64 * P_mod9C (P_mod9C (P_mod9C (P_mod9C (P_mod9C (P_mod9C f))))) v -
    P_mod9C f v + f v = 0
  have key : ∀ w : ZMod 9, w = 0 ∨ w = 1 ∨ w = 2 ∨ w = 3 ∨ w = 4 ∨ w = 5 ∨ w = 6 ∨ w = 7 ∨ w = 8 := by decide
  rcases key v with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp only [P_mod9C, inv2_table9] <;> ring
 
/-- Iteration of `P_mod9C` on an eigenfunction `P_mod9C f = lam • f`. -/
lemma P_mod9C_iterate_eigenfunction (f : ZMod 9 → ℂ) (lam : ℂ)
    (heig : ∀ v : ZMod 9, P_mod9C f v = lam * f v) (k : ℕ) (v : ZMod 9) :
    P_mod9C^[k] f v = lam ^ k * f v := by
  induction k generalizing v with
  | zero => simp
  | succ k ih =>
    rw [Function.iterate_succ_apply']
    have hP : P_mod9C (P_mod9C^[k] f) v = lam * (P_mod9C^[k] f v) := by
      simp only [P_mod9C, ih]
      have h := heig v
      simp only [P_mod9C] at h
      linear_combination (lam ^ k) * h
    rw [hP, ih]
    ring
 
/--
Complex Eigenvalue Modulus Bound at Level `j = 2` (`|λ₂(P_mod9C)| = 1/2`):
Every complex eigenvalue `lam : ℂ` of `P_mod9C` satisfies either `lam = 1` or `‖lam‖ = 1 / 2`.
-/
theorem mod9C_spectrum_exact_modulus (f : ZMod 9 → ℂ) (lam : ℂ)
    (heig : ∀ v : ZMod 9, P_mod9C f v = lam * f v)
    (hnz : ∃ v : ZMod 9, f v ≠ 0) :
    lam = 1 ∨ ‖lam‖ = 1 / 2 := by
  obtain ⟨v₀, hv₀⟩ := hnz
  have hpoly := P_mod9C_annihilating_poly f v₀
  rw [P_mod9C_iterate_eigenfunction f lam heig 7 v₀,
    P_mod9C_iterate_eigenfunction f lam heig 6 v₀,
    heig v₀] at hpoly
  have hfac : ((lam - 1) * (64 * lam ^ 6 - 1)) * f v₀ = 0 := by
    linear_combination hpoly
  have hroot : (lam - 1) * (64 * lam ^ 6 - 1) = 0 :=
    (mul_eq_zero.mp hfac).resolve_right hv₀
  rcases mul_eq_zero.mp hroot with h1 | h6
  · left
    exact sub_eq_zero.mp h1
  · right
    have hpow : (2 * lam) ^ 6 = 1 := by
      linear_combination h6
    have hnorm : ‖(2 * lam) ^ 6‖ = ‖(1 : ℂ)‖ := congrArg norm hpow
    simp only [norm_pow, norm_mul, norm_one] at hnorm
    have h2 : ‖(2 : ℂ)‖ = 2 := by norm_num
    rw [h2] at hnorm
    have hnonneg : 0 ≤ 2 * ‖lam‖ := by positivity
    have hpos_eq : 2 * ‖lam‖ = 1 := by
      have h1' : (2 * ‖lam‖) ^ 6 = (1 : ℝ) ^ 6 := by
        rw [hnorm]; norm_num
      exact (pow_left_inj₀ hnonneg (by norm_num) (by norm_num)).mp h1'
    linarith
 
/-- `P_mod9C` commutes with the canonical embedding `ℝ →+* ℂ` (`Complex.ofReal`). -/
lemma P_mod9C_ofReal (f : ZMod 9 → ℝ) (v : ZMod 9) :
    P_mod9C (fun x => (f x : ℂ)) v = (P_mod9 f v : ℂ) := by
  simp only [P_mod9C, P_mod9]
  push_cast
  rfl
 
/--
Real Eigenvalue Modulus Bound at Level `j = 2` (`|λ₂(P_mod9)| = 1/2`):
Every real eigenvalue `lam : ℝ` of `P_mod9` satisfies either `lam = 1` or `|lam| = 1 / 2`.
-/
theorem mod9_spectrum_exact_modulus (f : ZMod 9 → ℝ) (lam : ℝ)
    (heig : ∀ v : ZMod 9, P_mod9 f v = lam * f v)
    (hnz : ∃ v : ZMod 9, f v ≠ 0) :
    lam = 1 ∨ |lam| = 1 / 2 := by
  have heigC : ∀ v : ZMod 9, P_mod9C (fun x => (f x : ℂ)) v = (lam : ℂ) * (f v : ℂ) := by
    intro v
    rw [P_mod9C_ofReal, heig v]
    push_cast
    rfl
  have hnzC : ∃ v : ZMod 9, (f v : ℂ) ≠ 0 := by
    obtain ⟨v, hv⟩ := hnz
    exact ⟨v, Complex.ofReal_ne_zero.mpr hv⟩
  rcases mod9C_spectrum_exact_modulus (fun x => (f x : ℂ)) (lam : ℂ) heigC hnzC with h1 | hnorm
  · left
    exact_mod_cast h1
  · right
    simpa [Complex.norm_real] using hnorm
 
 
/-! ### Section 5: Level `j = 3` (`ZMod 27`) Witnesses & Exact Bound `|λ₂(P₃)| = 1/2` -/
 
/-- Level-3 (`ZMod 27`) coin-flip transfer operator over `ℝ`. -/
def P_mod27 (f : ZMod 27 → ℝ) (v : ZMod 27) : ℝ :=
  (1 / 2 : ℝ) * f ((2 : ZMod 27)⁻¹ * v) +
  (1 / 2 : ℝ) * f ((2 : ZMod 27)⁻¹ * (3 * v + 1))
 
/-- Level-3 (`ZMod 27`) coin-flip transfer operator over `ℂ`. -/
def P_mod27C (f : ZMod 27 → ℂ) (v : ZMod 27) : ℂ :=
  (1 / 2 : ℂ) * f ((2 : ZMod 27)⁻¹ * v) +
  (1 / 2 : ℂ) * f ((2 : ZMod 27)⁻¹ * (3 * v + 1))
 
/-- New `λ = +1/2` witness `φ₂₇,₊ = 1_{3, 6, 12, 15, 21, 24}` on `ZMod 27`. -/
def witness27_plus (v : ZMod 27) : ℝ :=
  match v.val with
  | 3 => 1
  | 6 => 1
  | 12 => 1
  | 15 => 1
  | 21 => 1
  | 24 => 1
  | _ => 0

/-- The 27 values of `witness27_plus` (by evaluation). -/
theorem witness27_plus_vals :
    witness27_plus 0 = 0 ∧
    witness27_plus 1 = 0 ∧
    witness27_plus 2 = 0 ∧
    witness27_plus 3 = 1 ∧
    witness27_plus 4 = 0 ∧
    witness27_plus 5 = 0 ∧
    witness27_plus 6 = 1 ∧
    witness27_plus 7 = 0 ∧
    witness27_plus 8 = 0 ∧
    witness27_plus 9 = 0 ∧
    witness27_plus 10 = 0 ∧
    witness27_plus 11 = 0 ∧
    witness27_plus 12 = 1 ∧
    witness27_plus 13 = 0 ∧
    witness27_plus 14 = 0 ∧
    witness27_plus 15 = 1 ∧
    witness27_plus 16 = 0 ∧
    witness27_plus 17 = 0 ∧
    witness27_plus 18 = 0 ∧
    witness27_plus 19 = 0 ∧
    witness27_plus 20 = 0 ∧
    witness27_plus 21 = 1 ∧
    witness27_plus 22 = 0 ∧
    witness27_plus 23 = 0 ∧
    witness27_plus 24 = 1 ∧
    witness27_plus 25 = 0 ∧
    witness27_plus 26 = 0 :=
  ⟨rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl⟩

/-- New `λ = -1/2` witness `φ₂₇,₋` alternating along `3 ↦ 15 ↦ 21 ↦ 24 ↦ 12 ↦ 6 ↦ 3`. -/
def witness27_minus (v : ZMod 27) : ℝ :=
  match v.val with
  | 3 => -1
  | 6 => 1
  | 12 => -1
  | 15 => 1
  | 21 => -1
  | 24 => 1
  | _ => 0

/-- The 27 values of `witness27_minus` (by evaluation). -/
theorem witness27_minus_vals :
    witness27_minus 0 = 0 ∧
    witness27_minus 1 = 0 ∧
    witness27_minus 2 = 0 ∧
    witness27_minus 3 = -1 ∧
    witness27_minus 4 = 0 ∧
    witness27_minus 5 = 0 ∧
    witness27_minus 6 = 1 ∧
    witness27_minus 7 = 0 ∧
    witness27_minus 8 = 0 ∧
    witness27_minus 9 = 0 ∧
    witness27_minus 10 = 0 ∧
    witness27_minus 11 = 0 ∧
    witness27_minus 12 = -1 ∧
    witness27_minus 13 = 0 ∧
    witness27_minus 14 = 0 ∧
    witness27_minus 15 = 1 ∧
    witness27_minus 16 = 0 ∧
    witness27_minus 17 = 0 ∧
    witness27_minus 18 = 0 ∧
    witness27_minus 19 = 0 ∧
    witness27_minus 20 = 0 ∧
    witness27_minus 21 = -1 ∧
    witness27_minus 22 = 0 ∧
    witness27_minus 23 = 0 ∧
    witness27_minus 24 = 1 ∧
    witness27_minus 25 = 0 ∧
    witness27_minus 26 = 0 :=
  ⟨rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl, rfl⟩

theorem witness27_plus_is_eigenfunction (v : ZMod 27) :
    P_mod27 witness27_plus v = (1 / 2 : ℝ) * witness27_plus v := by
  have key : ∀ w : ZMod 27, w = 0 ∨ w = 1 ∨ w = 2 ∨ w = 3 ∨ w = 4 ∨ w = 5 ∨ w = 6 ∨ w = 7 ∨ w = 8 ∨ w = 9 ∨ w = 10 ∨ w = 11 ∨ w = 12 ∨ w = 13 ∨ w = 14 ∨ w = 15 ∨ w = 16 ∨ w = 17 ∨ w = 18 ∨ w = 19 ∨ w = 20 ∨ w = 21 ∨ w = 22 ∨ w = 23 ∨ w = 24 ∨ w = 25 ∨ w = 26 := by decide
  rcases key v with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp only [P_mod27, inv2_table27, witness27_plus_vals] <;> norm_num

theorem witness27_minus_is_eigenfunction (v : ZMod 27) :
    P_mod27 witness27_minus v = (-1 / 2 : ℝ) * witness27_minus v := by
  have key : ∀ w : ZMod 27, w = 0 ∨ w = 1 ∨ w = 2 ∨ w = 3 ∨ w = 4 ∨ w = 5 ∨ w = 6 ∨ w = 7 ∨ w = 8 ∨ w = 9 ∨ w = 10 ∨ w = 11 ∨ w = 12 ∨ w = 13 ∨ w = 14 ∨ w = 15 ∨ w = 16 ∨ w = 17 ∨ w = 18 ∨ w = 19 ∨ w = 20 ∨ w = 21 ∨ w = 22 ∨ w = 23 ∨ w = 24 ∨ w = 25 ∨ w = 26 := by decide
  rcases key v with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    simp only [P_mod27, inv2_table27, witness27_minus_vals] <;> norm_num

/-- Canonical projection `ZMod (3 ^ j) →+* ZMod 27` for `j ≥ 3`. -/
def projMod27 (j : ℕ) (hj : 3 ≤ j) : ZMod (3 ^ j) →+* ZMod 27 :=
  ZMod.castHom (by
    have hdiv : 3 ^ 3 ∣ 3 ^ j := pow_dvd_pow 3 hj
    simpa using hdiv) (ZMod 27)
 
lemma projMod27_inv_two (j : ℕ) (hj : 3 ≤ j) :
    projMod27 j hj ((2 : ZMod (3 ^ j))⁻¹) = (2 : ZMod 27)⁻¹ := by
  have h2j : 2 < 3 ^ j := by
    have h27 : 27 ≤ 3 ^ j := by
      calc 27 = 3 ^ 3 := by norm_num
        _ ≤ 3 ^ j := Nat.pow_le_pow_right (by decide) hj
    omega
  have h2_j_unit : IsUnit (2 : ZMod (3 ^ j)) := by
    rw [← ZMod.natCast_zmod_val (2 : ZMod (3 ^ j)), ZMod.isUnit_iff_coprime]
    have hval : ((2 : ZMod (3 ^ j)).val) = 2 := by
      rw [show (2 : ZMod (3 ^ j)) = ((2 : ℕ) : ZMod (3 ^ j)) by norm_num, ZMod.val_natCast,
        Nat.mod_eq_of_lt h2j]
    rw [hval]
    exact Nat.Coprime.pow_right j (by decide : Nat.Coprime 2 3)
  have key : projMod27 j hj ((2 : ZMod (3 ^ j))⁻¹) * (2 : ZMod 27) = 1 := by
    rw [← map_ofNat (projMod27 j hj) 2, ← map_mul,
      ZMod.inv_mul_of_unit _ h2_j_unit, map_one]
  exact Eq.symm (ZMod.inv_eq_of_mul_eq_one _ _ _ (by rw [mul_comm]; exact key))
 
lemma P_level_intertwines_projMod27 (j : ℕ) (hj : 3 ≤ j) (g : ZMod 27 → ℝ) (v : ZMod (3 ^ j)) :
    P_level j (fun x => g (projMod27 j hj x)) v = P_mod27 g (projMod27 j hj v) := by
  unfold P_level P_mod27
  dsimp only
  simp only [map_mul, map_add, map_ofNat, map_one, projMod27_inv_two j hj]
 
/-- Lifted observable `f_j(v) = g (v mod 27)` on `ZMod (3 ^ j)` for `j ≥ 3`. -/
def lifted27 (j : ℕ) (hj : 3 ≤ j) (g : ZMod 27 → ℝ) (v : ZMod (3 ^ j)) : ℝ :=
  g (projMod27 j hj v)
 
theorem lifted27_plus_is_eigenfunction (j : ℕ) (hj : 3 ≤ j) (v : ZMod (3 ^ j)) :
    P_level j (lifted27 j hj witness27_plus) v = (1 / 2 : ℝ) * lifted27 j hj witness27_plus v := by
  unfold lifted27
  rw [P_level_intertwines_projMod27 j hj witness27_plus v]
  exact witness27_plus_is_eigenfunction (projMod27 j hj v)
 
theorem lifted27_minus_is_eigenfunction (j : ℕ) (hj : 3 ≤ j) (v : ZMod (3 ^ j)) :
    P_level j (lifted27 j hj witness27_minus) v = (-1 / 2 : ℝ) * lifted27 j hj witness27_minus v := by
  unfold lifted27
  rw [P_level_intertwines_projMod27 j hj witness27_minus v]
  exact witness27_minus_is_eigenfunction (projMod27 j hj v)
 
/-!
**No 3D linear independence at level 3 (correction to an earlier draft):**
`φ₂₇,₊` is exactly the lift of `ψ₊` from mod 9, and `φ₂₇,₋` is exactly the lift of
`ψ₋`, so the triples `(ψ₀, ψ₊, φ₂₇,₊)` and `(f_mod3, ψ₋, φ₂₇,₋)` are dependent.
The new content at level 3 is the exact spectral bound below.
-/
 
/-! #### Minimal Polynomial Annihilation `(X - 1)((2X)¹⁸ - 1)` & Exact Bound `|λ₂(P₃)| = 1/2` -/
 
/-- Explicit 27-point evaluation of `P_mod27C` (`2⁻¹ ≡ 14 mod 27`). -/
lemma P_mod27C_eq (f : ZMod 27 → ℂ) :
    P_mod27C f 0 = (1 / 2) * f 0 + (1 / 2) * f 14 ∧
    P_mod27C f 1 = (1 / 2) * f 14 + (1 / 2) * f 2 ∧
    P_mod27C f 2 = (1 / 2) * f 1 + (1 / 2) * f 17 ∧
    P_mod27C f 3 = (1 / 2) * f 15 + (1 / 2) * f 5 ∧
    P_mod27C f 4 = (1 / 2) * f 2 + (1 / 2) * f 20 ∧
    P_mod27C f 5 = (1 / 2) * f 16 + (1 / 2) * f 8 ∧
    P_mod27C f 6 = (1 / 2) * f 3 + (1 / 2) * f 23 ∧
    P_mod27C f 7 = (1 / 2) * f 17 + (1 / 2) * f 11 ∧
    P_mod27C f 8 = (1 / 2) * f 4 + (1 / 2) * f 26 ∧
    P_mod27C f 9 = (1 / 2) * f 18 + (1 / 2) * f 14 ∧
    P_mod27C f 10 = (1 / 2) * f 5 + (1 / 2) * f 2 ∧
    P_mod27C f 11 = (1 / 2) * f 19 + (1 / 2) * f 17 ∧
    P_mod27C f 12 = (1 / 2) * f 6 + (1 / 2) * f 5 ∧
    P_mod27C f 13 = (1 / 2) * f 20 + (1 / 2) * f 20 ∧
    P_mod27C f 14 = (1 / 2) * f 7 + (1 / 2) * f 8 ∧
    P_mod27C f 15 = (1 / 2) * f 21 + (1 / 2) * f 23 ∧
    P_mod27C f 16 = (1 / 2) * f 8 + (1 / 2) * f 11 ∧
    P_mod27C f 17 = (1 / 2) * f 22 + (1 / 2) * f 26 ∧
    P_mod27C f 18 = (1 / 2) * f 9 + (1 / 2) * f 14 ∧
    P_mod27C f 19 = (1 / 2) * f 23 + (1 / 2) * f 2 ∧
    P_mod27C f 20 = (1 / 2) * f 10 + (1 / 2) * f 17 ∧
    P_mod27C f 21 = (1 / 2) * f 24 + (1 / 2) * f 5 ∧
    P_mod27C f 22 = (1 / 2) * f 11 + (1 / 2) * f 20 ∧
    P_mod27C f 23 = (1 / 2) * f 25 + (1 / 2) * f 8 ∧
    P_mod27C f 24 = (1 / 2) * f 12 + (1 / 2) * f 23 ∧
    P_mod27C f 25 = (1 / 2) * f 26 + (1 / 2) * f 11 ∧
    P_mod27C f 26 = (1 / 2) * f 13 + (1 / 2) * f 26 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> simp only [P_mod27C, inv2_table27]
 
/-! The annihilation identity at level 3 is proved pointwise. Write `x_k(u) = P_mod27C^[k] f u`.
The lemmas `P27_step_u` are the 27 one-step relations `x_(k+1)(u) = ½ x_k(2⁻¹u) + ½ x_k(2⁻¹(3u+1))`;
for each `v`, `P27_annih_at_v` is an explicit linear combination of them (the coefficients come from
eliminating `x_19, …, x_1` in turn; their sum leaves no residual, which `linear_combination` checks).
This replaces the earlier proof, which unfolded the 19 iterates into a tree with 2^19 leaves. -/
 
lemma P27_step_0 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 0 = (1 / 2) * P_mod27C^[k] f 0 + (1 / 2) * P_mod27C^[k] f 14 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_1 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 1 = (1 / 2) * P_mod27C^[k] f 14 + (1 / 2) * P_mod27C^[k] f 2 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_2 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 2 = (1 / 2) * P_mod27C^[k] f 1 + (1 / 2) * P_mod27C^[k] f 17 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_3 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 3 = (1 / 2) * P_mod27C^[k] f 15 + (1 / 2) * P_mod27C^[k] f 5 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_4 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 4 = (1 / 2) * P_mod27C^[k] f 2 + (1 / 2) * P_mod27C^[k] f 20 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_5 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 5 = (1 / 2) * P_mod27C^[k] f 16 + (1 / 2) * P_mod27C^[k] f 8 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_6 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 6 = (1 / 2) * P_mod27C^[k] f 3 + (1 / 2) * P_mod27C^[k] f 23 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_7 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 7 = (1 / 2) * P_mod27C^[k] f 17 + (1 / 2) * P_mod27C^[k] f 11 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_8 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 8 = (1 / 2) * P_mod27C^[k] f 4 + (1 / 2) * P_mod27C^[k] f 26 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_9 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 9 = (1 / 2) * P_mod27C^[k] f 18 + (1 / 2) * P_mod27C^[k] f 14 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_10 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 10 = (1 / 2) * P_mod27C^[k] f 5 + (1 / 2) * P_mod27C^[k] f 2 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_11 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 11 = (1 / 2) * P_mod27C^[k] f 19 + (1 / 2) * P_mod27C^[k] f 17 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_12 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 12 = (1 / 2) * P_mod27C^[k] f 6 + (1 / 2) * P_mod27C^[k] f 5 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_13 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 13 = (1 / 2) * P_mod27C^[k] f 20 + (1 / 2) * P_mod27C^[k] f 20 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_14 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 14 = (1 / 2) * P_mod27C^[k] f 7 + (1 / 2) * P_mod27C^[k] f 8 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_15 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 15 = (1 / 2) * P_mod27C^[k] f 21 + (1 / 2) * P_mod27C^[k] f 23 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_16 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 16 = (1 / 2) * P_mod27C^[k] f 8 + (1 / 2) * P_mod27C^[k] f 11 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_17 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 17 = (1 / 2) * P_mod27C^[k] f 22 + (1 / 2) * P_mod27C^[k] f 26 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_18 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 18 = (1 / 2) * P_mod27C^[k] f 9 + (1 / 2) * P_mod27C^[k] f 14 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_19 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 19 = (1 / 2) * P_mod27C^[k] f 23 + (1 / 2) * P_mod27C^[k] f 2 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_20 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 20 = (1 / 2) * P_mod27C^[k] f 10 + (1 / 2) * P_mod27C^[k] f 17 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_21 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 21 = (1 / 2) * P_mod27C^[k] f 24 + (1 / 2) * P_mod27C^[k] f 5 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_22 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 22 = (1 / 2) * P_mod27C^[k] f 11 + (1 / 2) * P_mod27C^[k] f 20 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_23 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 23 = (1 / 2) * P_mod27C^[k] f 25 + (1 / 2) * P_mod27C^[k] f 8 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_24 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 24 = (1 / 2) * P_mod27C^[k] f 12 + (1 / 2) * P_mod27C^[k] f 23 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_25 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 25 = (1 / 2) * P_mod27C^[k] f 26 + (1 / 2) * P_mod27C^[k] f 11 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

lemma P27_step_26 (f : ZMod 27 → ℂ) (k n : ℕ) (hn : n = k + 1) :
    P_mod27C^[n] f 26 = (1 / 2) * P_mod27C^[k] f 13 + (1 / 2) * P_mod27C^[k] f 26 := by
  subst hn
  rw [Function.iterate_succ_apply']
  simp only [P_mod27C, inv2_table27]

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_0 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 0 - 262144 * P_mod27C^[18] f 0 - P_mod27C^[1] f 0 +
      P_mod27C^[0] f 0 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_0 f 18 19 rfl +
      (-131072 : ℂ) * P27_step_0 f 17 18 rfl +
      (131072 : ℂ) * P27_step_14 f 17 18 rfl +
      (-65536 : ℂ) * P27_step_0 f 16 17 rfl +
      (65536 : ℂ) * P27_step_7 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_14 f 16 17 rfl +
      (-32768 : ℂ) * P27_step_0 f 15 16 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_7 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_14 f 15 16 rfl +
      (32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (-16384 : ℂ) * P27_step_0 f 14 15 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_7 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_14 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (-8192 : ℂ) * P27_step_0 f 13 14 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_7 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_8 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (-4096 : ℂ) * P27_step_0 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_4 f 12 13 rfl +
      (4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (-2048 : ℂ) * P27_step_0 f 11 12 rfl +
      (2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (4096 : ℂ) * P27_step_5 f 11 12 rfl +
      (2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_20 f 11 12 rfl +
      (2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_0 f 10 11 rfl +
      (1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (1024 : ℂ) * P27_step_5 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (2048 : ℂ) * P27_step_8 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_10 f 10 11 rfl +
      (1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (2048 : ℂ) * P27_step_16 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_20 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (-512 : ℂ) * P27_step_0 f 9 10 rfl +
      (1024 : ℂ) * P27_step_4 f 9 10 rfl +
      (-512 : ℂ) * P27_step_5 f 9 10 rfl +
      (-512 : ℂ) * P27_step_7 f 9 10 rfl +
      (512 : ℂ) * P27_step_8 f 9 10 rfl +
      (-512 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_13 f 9 10 rfl +
      (512 : ℂ) * P27_step_16 f 9 10 rfl +
      (-512 : ℂ) * P27_step_17 f 9 10 rfl +
      (512 : ℂ) * P27_step_19 f 9 10 rfl +
      (512 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (-256 : ℂ) * P27_step_0 f 8 9 rfl +
      (512 : ℂ) * P27_step_2 f 8 9 rfl +
      (256 : ℂ) * P27_step_4 f 8 9 rfl +
      (-256 : ℂ) * P27_step_5 f 8 9 rfl +
      (256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-256 : ℂ) * P27_step_11 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (-256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-256 : ℂ) * P27_step_16 f 8 9 rfl +
      (-256 : ℂ) * P27_step_22 f 8 9 rfl +
      (256 : ℂ) * P27_step_23 f 8 9 rfl +
      (-128 : ℂ) * P27_step_0 f 7 8 rfl +
      (256 : ℂ) * P27_step_1 f 7 8 rfl +
      (256 : ℂ) * P27_step_2 f 7 8 rfl +
      (128 : ℂ) * P27_step_5 f 7 8 rfl +
      (-128 : ℂ) * P27_step_7 f 7 8 rfl +
      (-256 : ℂ) * P27_step_8 f 7 8 rfl +
      (-256 : ℂ) * P27_step_11 f 7 8 rfl +
      (-128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-128 : ℂ) * P27_step_16 f 7 8 rfl +
      (128 : ℂ) * P27_step_17 f 7 8 rfl +
      (-128 : ℂ) * P27_step_19 f 7 8 rfl +
      (256 : ℂ) * P27_step_20 f 7 8 rfl +
      (128 : ℂ) * P27_step_25 f 7 8 rfl +
      (-64 : ℂ) * P27_step_0 f 6 7 rfl +
      (128 : ℂ) * P27_step_1 f 6 7 rfl +
      (64 : ℂ) * P27_step_2 f 6 7 rfl +
      (-128 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-64 : ℂ) * P27_step_8 f 6 7 rfl +
      (128 : ℂ) * P27_step_10 f 6 7 rfl +
      (-64 : ℂ) * P27_step_11 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (64 : ℂ) * P27_step_16 f 6 7 rfl +
      (64 : ℂ) * P27_step_17 f 6 7 rfl +
      (-128 : ℂ) * P27_step_19 f 6 7 rfl +
      (64 : ℂ) * P27_step_22 f 6 7 rfl +
      (-64 : ℂ) * P27_step_23 f 6 7 rfl +
      (-32 : ℂ) * P27_step_0 f 5 6 rfl +
      (32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-32 : ℂ) * P27_step_4 f 5 6 rfl +
      (64 : ℂ) * P27_step_5 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (32 : ℂ) * P27_step_8 f 5 6 rfl +
      (32 : ℂ) * P27_step_11 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_17 f 5 6 rfl +
      (-32 : ℂ) * P27_step_19 f 5 6 rfl +
      (-32 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_22 f 5 6 rfl +
      (-64 : ℂ) * P27_step_23 f 5 6 rfl +
      (-32 : ℂ) * P27_step_25 f 5 6 rfl +
      (-16 : ℂ) * P27_step_0 f 4 5 rfl +
      (-16 : ℂ) * P27_step_2 f 4 5 rfl +
      (16 : ℂ) * P27_step_4 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (16 : ℂ) * P27_step_8 f 4 5 rfl +
      (-16 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (32 : ℂ) * P27_step_16 f 4 5 rfl +
      (16 : ℂ) * P27_step_17 f 4 5 rfl +
      (16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-16 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-32 : ℂ) * P27_step_25 f 4 5 rfl +
      (-16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-8 : ℂ) * P27_step_0 f 3 4 rfl +
      (-8 : ℂ) * P27_step_1 f 3 4 rfl +
      (8 : ℂ) * P27_step_2 f 3 4 rfl +
      (8 : ℂ) * P27_step_4 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (8 : ℂ) * P27_step_8 f 3 4 rfl +
      (-8 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (8 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (8 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-4 : ℂ) * P27_step_0 f 2 3 rfl +
      (4 : ℂ) * P27_step_1 f 2 3 rfl +
      (4 : ℂ) * P27_step_2 f 2 3 rfl +
      (4 : ℂ) * P27_step_4 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_17 f 2 3 rfl +
      (4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-2 : ℂ) * P27_step_0 f 1 2 rfl +
      (2 : ℂ) * P27_step_1 f 1 2 rfl +
      (4 : ℂ) * P27_step_2 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_0 f 0 1 rfl +
      (2 : ℂ) * P27_step_1 f 0 1 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_1 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 1 - 262144 * P_mod27C^[18] f 1 - P_mod27C^[1] f 1 +
      P_mod27C^[0] f 1 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_1 f 18 19 rfl +
      (-262144 : ℂ) * P27_step_1 f 17 18 rfl +
      (131072 : ℂ) * P27_step_2 f 17 18 rfl +
      (131072 : ℂ) * P27_step_14 f 17 18 rfl +
      (65536 : ℂ) * P27_step_1 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_2 f 16 17 rfl +
      (65536 : ℂ) * P27_step_7 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_14 f 16 17 rfl +
      (65536 : ℂ) * P27_step_17 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_1 f 15 16 rfl +
      (32768 : ℂ) * P27_step_2 f 15 16 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_7 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_14 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_22 f 15 16 rfl +
      (65536 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_1 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_4 f 14 15 rfl +
      (16384 : ℂ) * P27_step_7 f 14 15 rfl +
      (16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (32768 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_14 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (-8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_7 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (8192 : ℂ) * P27_step_20 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (8192 : ℂ) * P27_step_8 f 12 13 rfl +
      (4096 : ℂ) * P27_step_10 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_11 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (4096 : ℂ) * P27_step_4 f 11 12 rfl +
      (2048 : ℂ) * P27_step_5 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (6144 : ℂ) * P27_step_11 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_19 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_20 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_5 f 10 11 rfl +
      (3072 : ℂ) * P27_step_8 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_10 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (1024 : ℂ) * P27_step_16 f 10 11 rfl +
      (3072 : ℂ) * P27_step_19 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_20 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (512 : ℂ) * P27_step_2 f 9 10 rfl +
      (1536 : ℂ) * P27_step_4 f 9 10 rfl +
      (-512 : ℂ) * P27_step_5 f 9 10 rfl +
      (512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-512 : ℂ) * P27_step_8 f 9 10 rfl +
      (-512 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_13 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (-512 : ℂ) * P27_step_16 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_17 f 9 10 rfl +
      (-512 : ℂ) * P27_step_19 f 9 10 rfl +
      (512 : ℂ) * P27_step_20 f 9 10 rfl +
      (1536 : ℂ) * P27_step_23 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_25 f 9 10 rfl +
      (1024 : ℂ) * P27_step_26 f 9 10 rfl +
      (256 : ℂ) * P27_step_1 f 8 9 rfl +
      (256 : ℂ) * P27_step_2 f 8 9 rfl +
      (-256 : ℂ) * P27_step_4 f 8 9 rfl +
      (-256 : ℂ) * P27_step_5 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_11 f 8 9 rfl +
      (512 : ℂ) * P27_step_13 f 8 9 rfl +
      (-256 : ℂ) * P27_step_16 f 8 9 rfl +
      (768 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_20 f 8 9 rfl +
      (-512 : ℂ) * P27_step_22 f 8 9 rfl +
      (-256 : ℂ) * P27_step_23 f 8 9 rfl +
      (768 : ℂ) * P27_step_25 f 8 9 rfl +
      (-768 : ℂ) * P27_step_26 f 8 9 rfl +
      (128 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (128 : ℂ) * P27_step_5 f 7 8 rfl +
      (-384 : ℂ) * P27_step_8 f 7 8 rfl +
      (128 : ℂ) * P27_step_10 f 7 8 rfl +
      (-128 : ℂ) * P27_step_11 f 7 8 rfl +
      (-384 : ℂ) * P27_step_13 f 7 8 rfl +
      (128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-128 : ℂ) * P27_step_16 f 7 8 rfl +
      (-128 : ℂ) * P27_step_17 f 7 8 rfl +
      (-256 : ℂ) * P27_step_19 f 7 8 rfl +
      (128 : ℂ) * P27_step_20 f 7 8 rfl +
      (384 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_25 f 7 8 rfl +
      (384 : ℂ) * P27_step_26 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-192 : ℂ) * P27_step_4 f 6 7 rfl +
      (64 : ℂ) * P27_step_5 f 6 7 rfl +
      (64 : ℂ) * P27_step_7 f 6 7 rfl +
      (64 : ℂ) * P27_step_8 f 6 7 rfl +
      (64 : ℂ) * P27_step_10 f 6 7 rfl +
      (64 : ℂ) * P27_step_11 f 6 7 rfl +
      (192 : ℂ) * P27_step_13 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (64 : ℂ) * P27_step_16 f 6 7 rfl +
      (64 : ℂ) * P27_step_17 f 6 7 rfl +
      (-64 : ℂ) * P27_step_19 f 6 7 rfl +
      (-192 : ℂ) * P27_step_20 f 6 7 rfl +
      (-64 : ℂ) * P27_step_22 f 6 7 rfl +
      (-128 : ℂ) * P27_step_23 f 6 7 rfl +
      (-128 : ℂ) * P27_step_26 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 5 6 rfl +
      (32 : ℂ) * P27_step_4 f 5 6 rfl +
      (32 : ℂ) * P27_step_5 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (32 : ℂ) * P27_step_8 f 5 6 rfl +
      (-96 : ℂ) * P27_step_10 f 5 6 rfl +
      (32 : ℂ) * P27_step_11 f 5 6 rfl +
      (-64 : ℂ) * P27_step_13 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (32 : ℂ) * P27_step_16 f 5 6 rfl +
      (-32 : ℂ) * P27_step_17 f 5 6 rfl +
      (32 : ℂ) * P27_step_19 f 5 6 rfl +
      (64 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_22 f 5 6 rfl +
      (-32 : ℂ) * P27_step_23 f 5 6 rfl +
      (-64 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_1 f 4 5 rfl +
      (-16 : ℂ) * P27_step_2 f 4 5 rfl +
      (16 : ℂ) * P27_step_4 f 4 5 rfl +
      (-48 : ℂ) * P27_step_5 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (32 : ℂ) * P27_step_8 f 4 5 rfl +
      (32 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (16 : ℂ) * P27_step_16 f 4 5 rfl +
      (32 : ℂ) * P27_step_17 f 4 5 rfl +
      (16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-32 : ℂ) * P27_step_20 f 4 5 rfl +
      (-16 : ℂ) * P27_step_22 f 4 5 rfl +
      (16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-16 : ℂ) * P27_step_25 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (-8 : ℂ) * P27_step_1 f 3 4 rfl +
      (16 : ℂ) * P27_step_2 f 3 4 rfl +
      (16 : ℂ) * P27_step_4 f 3 4 rfl +
      (16 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_8 f 3 4 rfl +
      (-16 : ℂ) * P27_step_10 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (-16 : ℂ) * P27_step_14 f 3 4 rfl +
      (-24 : ℂ) * P27_step_16 f 3 4 rfl +
      (-8 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (8 : ℂ) * P27_step_25 f 3 4 rfl +
      (8 : ℂ) * P27_step_26 f 3 4 rfl +
      (8 : ℂ) * P27_step_1 f 2 3 rfl +
      (-4 : ℂ) * P27_step_4 f 2 3 rfl +
      (-8 : ℂ) * P27_step_5 f 2 3 rfl +
      (-8 : ℂ) * P27_step_7 f 2 3 rfl +
      (-8 : ℂ) * P27_step_8 f 2 3 rfl +
      (4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-4 : ℂ) * P27_step_14 f 2 3 rfl +
      (8 : ℂ) * P27_step_16 f 2 3 rfl +
      (8 : ℂ) * P27_step_17 f 2 3 rfl +
      (-4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (2 : ℂ) * P27_step_2 f 1 2 rfl +
      (-4 : ℂ) * P27_step_4 f 1 2 rfl +
      (-2 : ℂ) * P27_step_7 f 1 2 rfl +
      (4 : ℂ) * P27_step_14 f 1 2 rfl +
      (-4 : ℂ) * P27_step_16 f 1 2 rfl +
      (-4 : ℂ) * P27_step_17 f 1 2 rfl +
      (4 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_2 f 0 1 rfl +
      (2 : ℂ) * P27_step_7 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_2 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 2 - 262144 * P_mod27C^[18] f 2 - P_mod27C^[1] f 2 +
      P_mod27C^[0] f 2 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_2 f 18 19 rfl +
      (131072 : ℂ) * P27_step_1 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_2 f 17 18 rfl +
      (131072 : ℂ) * P27_step_17 f 17 18 rfl +
      (-131072 : ℂ) * P27_step_1 f 16 17 rfl +
      (65536 : ℂ) * P27_step_2 f 16 17 rfl +
      (65536 : ℂ) * P27_step_14 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_17 f 16 17 rfl +
      (65536 : ℂ) * P27_step_22 f 16 17 rfl +
      (65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_1 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_2 f 15 16 rfl +
      (32768 : ℂ) * P27_step_7 f 15 16 rfl +
      (32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_14 f 15 16 rfl +
      (32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_20 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_22 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_1 f 14 15 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_7 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_8 f 14 15 rfl +
      (16384 : ℂ) * P27_step_10 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (16384 : ℂ) * P27_step_14 f 14 15 rfl +
      (16384 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_2 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_4 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (8192 : ℂ) * P27_step_7 f 13 14 rfl +
      (8192 : ℂ) * P27_step_8 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_14 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (8192 : ℂ) * P27_step_22 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (4096 : ℂ) * P27_step_1 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_2 f 12 13 rfl +
      (4096 : ℂ) * P27_step_4 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_7 f 12 13 rfl +
      (8192 : ℂ) * P27_step_11 f 12 13 rfl +
      (4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_22 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_1 f 11 12 rfl +
      (2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (2048 : ℂ) * P27_step_8 f 11 12 rfl +
      (2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_11 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (4096 : ℂ) * P27_step_19 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_20 f 11 12 rfl +
      (2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 10 11 rfl +
      (1024 : ℂ) * P27_step_4 f 10 11 rfl +
      (1024 : ℂ) * P27_step_5 f 10 11 rfl +
      (1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_10 f 10 11 rfl +
      (1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_14 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_19 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_20 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (2048 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (512 : ℂ) * P27_step_1 f 9 10 rfl +
      (-512 : ℂ) * P27_step_2 f 9 10 rfl +
      (-512 : ℂ) * P27_step_5 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_7 f 9 10 rfl +
      (512 : ℂ) * P27_step_8 f 9 10 rfl +
      (-512 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_11 f 9 10 rfl +
      (512 : ℂ) * P27_step_14 f 9 10 rfl +
      (512 : ℂ) * P27_step_16 f 9 10 rfl +
      (1024 : ℂ) * P27_step_17 f 9 10 rfl +
      (512 : ℂ) * P27_step_19 f 9 10 rfl +
      (1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_22 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_23 f 9 10 rfl +
      (1024 : ℂ) * P27_step_25 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_26 f 9 10 rfl +
      (-256 : ℂ) * P27_step_1 f 8 9 rfl +
      (256 : ℂ) * P27_step_2 f 8 9 rfl +
      (256 : ℂ) * P27_step_4 f 8 9 rfl +
      (-256 : ℂ) * P27_step_5 f 8 9 rfl +
      (256 : ℂ) * P27_step_7 f 8 9 rfl +
      (-256 : ℂ) * P27_step_8 f 8 9 rfl +
      (512 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_13 f 8 9 rfl +
      (256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-256 : ℂ) * P27_step_16 f 8 9 rfl +
      (-512 : ℂ) * P27_step_17 f 8 9 rfl +
      (-256 : ℂ) * P27_step_19 f 8 9 rfl +
      (-256 : ℂ) * P27_step_20 f 8 9 rfl +
      (512 : ℂ) * P27_step_22 f 8 9 rfl +
      (256 : ℂ) * P27_step_23 f 8 9 rfl +
      (-512 : ℂ) * P27_step_25 f 8 9 rfl +
      (768 : ℂ) * P27_step_26 f 8 9 rfl +
      (128 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (-128 : ℂ) * P27_step_4 f 7 8 rfl +
      (256 : ℂ) * P27_step_5 f 7 8 rfl +
      (128 : ℂ) * P27_step_7 f 7 8 rfl +
      (-128 : ℂ) * P27_step_10 f 7 8 rfl +
      (384 : ℂ) * P27_step_13 f 7 8 rfl +
      (-128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-128 : ℂ) * P27_step_16 f 7 8 rfl +
      (128 : ℂ) * P27_step_17 f 7 8 rfl +
      (-128 : ℂ) * P27_step_20 f 7 8 rfl +
      (-256 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_23 f 7 8 rfl +
      (128 : ℂ) * P27_step_25 f 7 8 rfl +
      (-256 : ℂ) * P27_step_26 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 6 7 rfl +
      (-64 : ℂ) * P27_step_5 f 6 7 rfl +
      (-64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-64 : ℂ) * P27_step_8 f 6 7 rfl +
      (-64 : ℂ) * P27_step_10 f 6 7 rfl +
      (-64 : ℂ) * P27_step_11 f 6 7 rfl +
      (-128 : ℂ) * P27_step_13 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (128 : ℂ) * P27_step_16 f 6 7 rfl +
      (64 : ℂ) * P27_step_17 f 6 7 rfl +
      (192 : ℂ) * P27_step_20 f 6 7 rfl +
      (64 : ℂ) * P27_step_22 f 6 7 rfl +
      (-64 : ℂ) * P27_step_25 f 6 7 rfl +
      (-32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-32 : ℂ) * P27_step_4 f 5 6 rfl +
      (-32 : ℂ) * P27_step_5 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (64 : ℂ) * P27_step_8 f 5 6 rfl +
      (96 : ℂ) * P27_step_10 f 5 6 rfl +
      (32 : ℂ) * P27_step_11 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_16 f 5 6 rfl +
      (-32 : ℂ) * P27_step_19 f 5 6 rfl +
      (-96 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_22 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (32 : ℂ) * P27_step_4 f 4 5 rfl +
      (48 : ℂ) * P27_step_5 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (-16 : ℂ) * P27_step_8 f 4 5 rfl +
      (-48 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (-16 : ℂ) * P27_step_14 f 4 5 rfl +
      (-16 : ℂ) * P27_step_16 f 4 5 rfl +
      (-16 : ℂ) * P27_step_17 f 4 5 rfl +
      (16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-8 : ℂ) * P27_step_4 f 3 4 rfl +
      (-24 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_7 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (24 : ℂ) * P27_step_16 f 3 4 rfl +
      (16 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (-8 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (4 : ℂ) * P27_step_8 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-12 : ℂ) * P27_step_16 f 2 3 rfl +
      (-4 : ℂ) * P27_step_17 f 2 3 rfl +
      (8 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (2 : ℂ) * P27_step_4 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (-2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_3 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 3 - 262144 * P_mod27C^[18] f 3 - P_mod27C^[1] f 3 +
      P_mod27C^[0] f 3 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_3 f 18 19 rfl +
      (-262144 : ℂ) * P27_step_3 f 17 18 rfl +
      (131072 : ℂ) * P27_step_5 f 17 18 rfl +
      (131072 : ℂ) * P27_step_15 f 17 18 rfl +
      (-131072 : ℂ) * P27_step_5 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_15 f 16 17 rfl +
      (65536 : ℂ) * P27_step_16 f 16 17 rfl +
      (65536 : ℂ) * P27_step_21 f 16 17 rfl +
      (65536 : ℂ) * P27_step_23 f 16 17 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (32768 : ℂ) * P27_step_5 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_16 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_21 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_23 f 15 16 rfl +
      (32768 : ℂ) * P27_step_24 f 15 16 rfl +
      (32768 : ℂ) * P27_step_25 f 15 16 rfl +
      (32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_5 f 14 15 rfl +
      (-49152 : ℂ) * P27_step_8 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (16384 : ℂ) * P27_step_12 f 14 15 rfl +
      (16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (16384 : ℂ) * P27_step_16 f 14 15 rfl +
      (16384 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (16384 : ℂ) * P27_step_23 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_24 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_25 f 14 15 rfl +
      (32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_2 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_4 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (8192 : ℂ) * P27_step_6 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_12 f 13 14 rfl +
      (16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_16 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (8192 : ℂ) * P27_step_22 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (8192 : ℂ) * P27_step_25 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_26 f 13 14 rfl +
      (4096 : ℂ) * P27_step_1 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_2 f 12 13 rfl +
      (4096 : ℂ) * P27_step_3 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_6 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_8 f 12 13 rfl +
      (8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_13 f 12 13 rfl +
      (4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (8192 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_1 f 11 12 rfl +
      (4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_3 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_4 f 11 12 rfl +
      (6144 : ℂ) * P27_step_5 f 11 12 rfl +
      (2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (2048 : ℂ) * P27_step_8 f 11 12 rfl +
      (4096 : ℂ) * P27_step_10 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (2048 : ℂ) * P27_step_15 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_20 f 11 12 rfl +
      (4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_23 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_2 f 10 11 rfl +
      (1024 : ℂ) * P27_step_4 f 10 11 rfl +
      (1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_10 f 10 11 rfl +
      (2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_14 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_15 f 10 11 rfl +
      (3072 : ℂ) * P27_step_16 f 10 11 rfl +
      (1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (1024 : ℂ) * P27_step_21 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_25 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_1 f 9 10 rfl +
      (512 : ℂ) * P27_step_2 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_7 f 9 10 rfl +
      (1024 : ℂ) * P27_step_8 f 9 10 rfl +
      (512 : ℂ) * P27_step_11 f 9 10 rfl +
      (1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (512 : ℂ) * P27_step_17 f 9 10 rfl +
      (1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (-512 : ℂ) * P27_step_20 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_21 f 9 10 rfl +
      (512 : ℂ) * P27_step_22 f 9 10 rfl +
      (-512 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_24 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_26 f 9 10 rfl +
      (256 : ℂ) * P27_step_1 f 8 9 rfl +
      (512 : ℂ) * P27_step_4 f 8 9 rfl +
      (-512 : ℂ) * P27_step_5 f 8 9 rfl +
      (512 : ℂ) * P27_step_7 f 8 9 rfl +
      (-256 : ℂ) * P27_step_8 f 8 9 rfl +
      (-256 : ℂ) * P27_step_10 f 8 9 rfl +
      (256 : ℂ) * P27_step_12 f 8 9 rfl +
      (-512 : ℂ) * P27_step_13 f 8 9 rfl +
      (-512 : ℂ) * P27_step_14 f 8 9 rfl +
      (-512 : ℂ) * P27_step_16 f 8 9 rfl +
      (-256 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_19 f 8 9 rfl +
      (256 : ℂ) * P27_step_20 f 8 9 rfl +
      (256 : ℂ) * P27_step_22 f 8 9 rfl +
      (768 : ℂ) * P27_step_23 f 8 9 rfl +
      (-512 : ℂ) * P27_step_24 f 8 9 rfl +
      (-256 : ℂ) * P27_step_25 f 8 9 rfl +
      (512 : ℂ) * P27_step_26 f 8 9 rfl +
      (384 : ℂ) * P27_step_2 f 7 8 rfl +
      (-128 : ℂ) * P27_step_4 f 7 8 rfl +
      (128 : ℂ) * P27_step_6 f 7 8 rfl +
      (-256 : ℂ) * P27_step_7 f 7 8 rfl +
      (-384 : ℂ) * P27_step_8 f 7 8 rfl +
      (128 : ℂ) * P27_step_10 f 7 8 rfl +
      (-256 : ℂ) * P27_step_12 f 7 8 rfl +
      (256 : ℂ) * P27_step_13 f 7 8 rfl +
      (128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-256 : ℂ) * P27_step_16 f 7 8 rfl +
      (384 : ℂ) * P27_step_17 f 7 8 rfl +
      (-128 : ℂ) * P27_step_20 f 7 8 rfl +
      (-128 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_23 f 7 8 rfl +
      (384 : ℂ) * P27_step_25 f 7 8 rfl +
      (-128 : ℂ) * P27_step_26 f 7 8 rfl +
      (192 : ℂ) * P27_step_1 f 6 7 rfl +
      (64 : ℂ) * P27_step_3 f 6 7 rfl +
      (-192 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_5 f 6 7 rfl +
      (-128 : ℂ) * P27_step_6 f 6 7 rfl +
      (64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-128 : ℂ) * P27_step_8 f 6 7 rfl +
      (-64 : ℂ) * P27_step_10 f 6 7 rfl +
      (-128 : ℂ) * P27_step_11 f 6 7 rfl +
      (-64 : ℂ) * P27_step_13 f 6 7 rfl +
      (128 : ℂ) * P27_step_20 f 6 7 rfl +
      (192 : ℂ) * P27_step_22 f 6 7 rfl +
      (64 : ℂ) * P27_step_23 f 6 7 rfl +
      (-64 : ℂ) * P27_step_25 f 6 7 rfl +
      (128 : ℂ) * P27_step_26 f 6 7 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (-64 : ℂ) * P27_step_3 f 5 6 rfl +
      (-64 : ℂ) * P27_step_4 f 5 6 rfl +
      (64 : ℂ) * P27_step_10 f 5 6 rfl +
      (96 : ℂ) * P27_step_11 f 5 6 rfl +
      (64 : ℂ) * P27_step_13 f 5 6 rfl +
      (96 : ℂ) * P27_step_14 f 5 6 rfl +
      (32 : ℂ) * P27_step_15 f 5 6 rfl +
      (-32 : ℂ) * P27_step_16 f 5 6 rfl +
      (32 : ℂ) * P27_step_17 f 5 6 rfl +
      (-64 : ℂ) * P27_step_19 f 5 6 rfl +
      (-64 : ℂ) * P27_step_20 f 5 6 rfl +
      (-64 : ℂ) * P27_step_23 f 5 6 rfl +
      (32 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_2 f 4 5 rfl +
      (48 : ℂ) * P27_step_7 f 4 5 rfl +
      (-32 : ℂ) * P27_step_10 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (-32 : ℂ) * P27_step_15 f 4 5 rfl +
      (48 : ℂ) * P27_step_19 f 4 5 rfl +
      (32 : ℂ) * P27_step_20 f 4 5 rfl +
      (16 : ℂ) * P27_step_21 f 4 5 rfl +
      (16 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-32 : ℂ) * P27_step_25 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-16 : ℂ) * P27_step_1 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_8 f 3 4 rfl +
      (16 : ℂ) * P27_step_10 f 3 4 rfl +
      (16 : ℂ) * P27_step_11 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (24 : ℂ) * P27_step_17 f 3 4 rfl +
      (-8 : ℂ) * P27_step_20 f 3 4 rfl +
      (-16 : ℂ) * P27_step_21 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (8 : ℂ) * P27_step_24 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-4 : ℂ) * P27_step_4 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (-4 : ℂ) * P27_step_10 f 2 3 rfl +
      (-4 : ℂ) * P27_step_11 f 2 3 rfl +
      (4 : ℂ) * P27_step_12 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_17 f 2 3 rfl +
      (8 : ℂ) * P27_step_19 f 2 3 rfl +
      (8 : ℂ) * P27_step_20 f 2 3 rfl +
      (12 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (-8 : ℂ) * P27_step_24 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (2 : ℂ) * P27_step_6 f 1 2 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (4 : ℂ) * P27_step_10 f 1 2 rfl +
      (4 : ℂ) * P27_step_11 f 1 2 rfl +
      (-4 : ℂ) * P27_step_12 f 1 2 rfl +
      (-2 : ℂ) * P27_step_19 f 1 2 rfl +
      (2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (-2 : ℂ) * P27_step_6 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (2 : ℂ) * P27_step_19 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_4 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 4 - 262144 * P_mod27C^[18] f 4 - P_mod27C^[1] f 4 +
      P_mod27C^[0] f 4 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_4 f 18 19 rfl +
      (131072 : ℂ) * P27_step_2 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_4 f 17 18 rfl +
      (131072 : ℂ) * P27_step_20 f 17 18 rfl +
      (65536 : ℂ) * P27_step_1 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_2 f 16 17 rfl +
      (65536 : ℂ) * P27_step_10 f 16 17 rfl +
      (131072 : ℂ) * P27_step_17 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_20 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_1 f 15 16 rfl +
      (65536 : ℂ) * P27_step_2 f 15 16 rfl +
      (32768 : ℂ) * P27_step_5 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_10 f 15 16 rfl +
      (32768 : ℂ) * P27_step_14 f 15 16 rfl +
      (-131072 : ℂ) * P27_step_17 f 15 16 rfl +
      (65536 : ℂ) * P27_step_22 f 15 16 rfl +
      (65536 : ℂ) * P27_step_26 f 15 16 rfl +
      (32768 : ℂ) * P27_step_1 f 14 15 rfl +
      (-65536 : ℂ) * P27_step_2 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_5 f 14 15 rfl +
      (16384 : ℂ) * P27_step_7 f 14 15 rfl +
      (32768 : ℂ) * P27_step_8 f 14 15 rfl +
      (32768 : ℂ) * P27_step_11 f 14 15 rfl +
      (32768 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_14 f 14 15 rfl +
      (16384 : ℂ) * P27_step_16 f 14 15 rfl +
      (32768 : ℂ) * P27_step_17 f 14 15 rfl +
      (32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (-65536 : ℂ) * P27_step_22 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_1 f 13 14 rfl +
      (16384 : ℂ) * P27_step_2 f 13 14 rfl +
      (16384 : ℂ) * P27_step_4 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_7 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_8 f 13 14 rfl +
      (16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_11 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (16384 : ℂ) * P27_step_14 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_16 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (16384 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_22 f 13 14 rfl +
      (16384 : ℂ) * P27_step_26 f 13 14 rfl +
      (8192 : ℂ) * P27_step_1 f 12 13 rfl +
      (8192 : ℂ) * P27_step_2 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (8192 : ℂ) * P27_step_7 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_11 f 12 13 rfl +
      (8192 : ℂ) * P27_step_13 f 12 13 rfl +
      (-16384 : ℂ) * P27_step_14 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_19 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (8192 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_1 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_2 f 11 12 rfl +
      (-8192 : ℂ) * P27_step_7 f 11 12 rfl +
      (6144 : ℂ) * P27_step_11 f 11 12 rfl +
      (4096 : ℂ) * P27_step_14 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (4096 : ℂ) * P27_step_17 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_19 f 11 12 rfl +
      (4096 : ℂ) * P27_step_20 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_23 f 11 12 rfl +
      (4096 : ℂ) * P27_step_25 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_26 f 11 12 rfl +
      (-3072 : ℂ) * P27_step_1 f 10 11 rfl +
      (2048 : ℂ) * P27_step_7 f 10 11 rfl +
      (2048 : ℂ) * P27_step_8 f 10 11 rfl +
      (2048 : ℂ) * P27_step_10 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_13 f 10 11 rfl +
      (2048 : ℂ) * P27_step_14 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_17 f 10 11 rfl +
      (3072 : ℂ) * P27_step_19 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_20 f 10 11 rfl +
      (2048 : ℂ) * P27_step_22 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_23 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_25 f 10 11 rfl +
      (2048 : ℂ) * P27_step_26 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (1024 : ℂ) * P27_step_4 f 9 10 rfl +
      (1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (1024 : ℂ) * P27_step_7 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_10 f 9 10 rfl +
      (1024 : ℂ) * P27_step_11 f 9 10 rfl +
      (1024 : ℂ) * P27_step_13 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_14 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_17 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_22 f 9 10 rfl +
      (1536 : ℂ) * P27_step_23 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_1 f 8 9 rfl +
      (-512 : ℂ) * P27_step_2 f 8 9 rfl +
      (-512 : ℂ) * P27_step_5 f 8 9 rfl +
      (-768 : ℂ) * P27_step_7 f 8 9 rfl +
      (512 : ℂ) * P27_step_8 f 8 9 rfl +
      (-512 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_11 f 8 9 rfl +
      (512 : ℂ) * P27_step_16 f 8 9 rfl +
      (1024 : ℂ) * P27_step_17 f 8 9 rfl +
      (512 : ℂ) * P27_step_19 f 8 9 rfl +
      (1024 : ℂ) * P27_step_20 f 8 9 rfl +
      (-512 : ℂ) * P27_step_22 f 8 9 rfl +
      (-512 : ℂ) * P27_step_23 f 8 9 rfl +
      (768 : ℂ) * P27_step_25 f 8 9 rfl +
      (-1024 : ℂ) * P27_step_26 f 8 9 rfl +
      (-256 : ℂ) * P27_step_1 f 7 8 rfl +
      (256 : ℂ) * P27_step_2 f 7 8 rfl +
      (256 : ℂ) * P27_step_4 f 7 8 rfl +
      (-256 : ℂ) * P27_step_5 f 7 8 rfl +
      (-256 : ℂ) * P27_step_8 f 7 8 rfl +
      (512 : ℂ) * P27_step_10 f 7 8 rfl +
      (-512 : ℂ) * P27_step_13 f 7 8 rfl +
      (256 : ℂ) * P27_step_14 f 7 8 rfl +
      (-256 : ℂ) * P27_step_16 f 7 8 rfl +
      (-384 : ℂ) * P27_step_17 f 7 8 rfl +
      (-256 : ℂ) * P27_step_19 f 7 8 rfl +
      (-256 : ℂ) * P27_step_20 f 7 8 rfl +
      (512 : ℂ) * P27_step_22 f 7 8 rfl +
      (256 : ℂ) * P27_step_23 f 7 8 rfl +
      (-256 : ℂ) * P27_step_25 f 7 8 rfl +
      (640 : ℂ) * P27_step_26 f 7 8 rfl +
      (128 : ℂ) * P27_step_1 f 6 7 rfl +
      (128 : ℂ) * P27_step_2 f 6 7 rfl +
      (-128 : ℂ) * P27_step_4 f 6 7 rfl +
      (256 : ℂ) * P27_step_5 f 6 7 rfl +
      (128 : ℂ) * P27_step_7 f 6 7 rfl +
      (-128 : ℂ) * P27_step_10 f 6 7 rfl +
      (320 : ℂ) * P27_step_13 f 6 7 rfl +
      (-128 : ℂ) * P27_step_14 f 6 7 rfl +
      (-128 : ℂ) * P27_step_16 f 6 7 rfl +
      (-128 : ℂ) * P27_step_20 f 6 7 rfl +
      (-192 : ℂ) * P27_step_22 f 6 7 rfl +
      (-128 : ℂ) * P27_step_23 f 6 7 rfl +
      (128 : ℂ) * P27_step_25 f 6 7 rfl +
      (-128 : ℂ) * P27_step_26 f 6 7 rfl +
      (64 : ℂ) * P27_step_1 f 5 6 rfl +
      (-64 : ℂ) * P27_step_2 f 5 6 rfl +
      (-64 : ℂ) * P27_step_5 f 5 6 rfl +
      (-64 : ℂ) * P27_step_7 f 5 6 rfl +
      (-64 : ℂ) * P27_step_8 f 5 6 rfl +
      (-64 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_11 f 5 6 rfl +
      (-64 : ℂ) * P27_step_13 f 5 6 rfl +
      (64 : ℂ) * P27_step_14 f 5 6 rfl +
      (128 : ℂ) * P27_step_16 f 5 6 rfl +
      (64 : ℂ) * P27_step_17 f 5 6 rfl +
      (160 : ℂ) * P27_step_20 f 5 6 rfl +
      (-64 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_4 f 4 5 rfl +
      (-32 : ℂ) * P27_step_5 f 4 5 rfl +
      (32 : ℂ) * P27_step_7 f 4 5 rfl +
      (64 : ℂ) * P27_step_8 f 4 5 rfl +
      (80 : ℂ) * P27_step_10 f 4 5 rfl +
      (32 : ℂ) * P27_step_14 f 4 5 rfl +
      (-32 : ℂ) * P27_step_16 f 4 5 rfl +
      (-16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-64 : ℂ) * P27_step_20 f 4 5 rfl +
      (32 : ℂ) * P27_step_22 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (32 : ℂ) * P27_step_4 f 3 4 rfl +
      (40 : ℂ) * P27_step_5 f 3 4 rfl +
      (16 : ℂ) * P27_step_7 f 3 4 rfl +
      (-16 : ℂ) * P27_step_8 f 3 4 rfl +
      (-32 : ℂ) * P27_step_10 f 3 4 rfl +
      (16 : ℂ) * P27_step_11 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (-16 : ℂ) * P27_step_14 f 3 4 rfl +
      (-16 : ℂ) * P27_step_16 f 3 4 rfl +
      (-16 : ℂ) * P27_step_17 f 3 4 rfl +
      (-8 : ℂ) * P27_step_23 f 3 4 rfl +
      (16 : ℂ) * P27_step_26 f 3 4 rfl +
      (-8 : ℂ) * P27_step_4 f 2 3 rfl +
      (-16 : ℂ) * P27_step_5 f 2 3 rfl +
      (-8 : ℂ) * P27_step_7 f 2 3 rfl +
      (8 : ℂ) * P27_step_13 f 2 3 rfl +
      (20 : ℂ) * P27_step_16 f 2 3 rfl +
      (16 : ℂ) * P27_step_17 f 2 3 rfl +
      (8 : ℂ) * P27_step_19 f 2 3 rfl +
      (-8 : ℂ) * P27_step_22 f 2 3 rfl +
      (-4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-8 : ℂ) * P27_step_26 f 2 3 rfl +
      (2 : ℂ) * P27_step_8 f 1 2 rfl +
      (-4 : ℂ) * P27_step_13 f 1 2 rfl +
      (-8 : ℂ) * P27_step_16 f 1 2 rfl +
      (-4 : ℂ) * P27_step_17 f 1 2 rfl +
      (8 : ℂ) * P27_step_22 f 1 2 rfl +
      (4 : ℂ) * P27_step_23 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_8 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl +
      (2 : ℂ) * P27_step_25 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_5 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 5 - 262144 * P_mod27C^[18] f 5 - P_mod27C^[1] f 5 +
      P_mod27C^[0] f 5 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_5 f 18 19 rfl +
      (-262144 : ℂ) * P27_step_5 f 17 18 rfl +
      (131072 : ℂ) * P27_step_8 f 17 18 rfl +
      (131072 : ℂ) * P27_step_16 f 17 18 rfl +
      (65536 : ℂ) * P27_step_4 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (65536 : ℂ) * P27_step_11 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_16 f 16 17 rfl +
      (65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_2 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_8 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_19 f 15 16 rfl +
      (32768 : ℂ) * P27_step_20 f 15 16 rfl +
      (16384 : ℂ) * P27_step_1 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_4 f 14 15 rfl +
      (16384 : ℂ) * P27_step_10 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_23 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_2 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (8192 : ℂ) * P27_step_8 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_20 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_23 f 13 14 rfl +
      (8192 : ℂ) * P27_step_25 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_26 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_1 f 12 13 rfl +
      (4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (4096 : ℂ) * P27_step_4 f 12 13 rfl +
      (4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_10 f 12 13 rfl +
      (4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_13 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_25 f 12 13 rfl +
      (8192 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_5 f 11 12 rfl +
      (4096 : ℂ) * P27_step_8 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_10 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (4096 : ℂ) * P27_step_13 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_14 f 11 12 rfl +
      (2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (2048 : ℂ) * P27_step_4 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_5 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_7 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_8 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_13 f 10 11 rfl +
      (1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_16 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (2048 : ℂ) * P27_step_20 f 10 11 rfl +
      (1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (-512 : ℂ) * P27_step_4 f 9 10 rfl +
      (512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-512 : ℂ) * P27_step_8 f 9 10 rfl +
      (1024 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_11 f 9 10 rfl +
      (512 : ℂ) * P27_step_13 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_16 f 9 10 rfl +
      (-512 : ℂ) * P27_step_17 f 9 10 rfl +
      (-512 : ℂ) * P27_step_19 f 9 10 rfl +
      (-512 : ℂ) * P27_step_20 f 9 10 rfl +
      (512 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (512 : ℂ) * P27_step_1 f 8 9 rfl +
      (-256 : ℂ) * P27_step_4 f 8 9 rfl +
      (512 : ℂ) * P27_step_5 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (-512 : ℂ) * P27_step_8 f 8 9 rfl +
      (-256 : ℂ) * P27_step_10 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (256 : ℂ) * P27_step_17 f 8 9 rfl +
      (-256 : ℂ) * P27_step_19 f 8 9 rfl +
      (256 : ℂ) * P27_step_20 f 8 9 rfl +
      (-256 : ℂ) * P27_step_22 f 8 9 rfl +
      (-256 : ℂ) * P27_step_23 f 8 9 rfl +
      (256 : ℂ) * P27_step_25 f 8 9 rfl +
      (-128 : ℂ) * P27_step_2 f 7 8 rfl +
      (-256 : ℂ) * P27_step_4 f 7 8 rfl +
      (-128 : ℂ) * P27_step_5 f 7 8 rfl +
      (128 : ℂ) * P27_step_8 f 7 8 rfl +
      (128 : ℂ) * P27_step_10 f 7 8 rfl +
      (-128 : ℂ) * P27_step_11 f 7 8 rfl +
      (256 : ℂ) * P27_step_14 f 7 8 rfl +
      (256 : ℂ) * P27_step_16 f 7 8 rfl +
      (128 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_23 f 7 8 rfl +
      (-128 : ℂ) * P27_step_25 f 7 8 rfl +
      (-64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 6 7 rfl +
      (64 : ℂ) * P27_step_4 f 6 7 rfl +
      (64 : ℂ) * P27_step_5 f 6 7 rfl +
      (128 : ℂ) * P27_step_7 f 6 7 rfl +
      (128 : ℂ) * P27_step_8 f 6 7 rfl +
      (128 : ℂ) * P27_step_11 f 6 7 rfl +
      (-64 : ℂ) * P27_step_16 f 6 7 rfl +
      (-128 : ℂ) * P27_step_17 f 6 7 rfl +
      (-64 : ℂ) * P27_step_19 f 6 7 rfl +
      (-64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-64 : ℂ) * P27_step_25 f 6 7 rfl +
      (-32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (64 : ℂ) * P27_step_4 f 5 6 rfl +
      (-32 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_14 f 5 6 rfl +
      (32 : ℂ) * P27_step_16 f 5 6 rfl +
      (64 : ℂ) * P27_step_17 f 5 6 rfl +
      (64 : ℂ) * P27_step_19 f 5 6 rfl +
      (32 : ℂ) * P27_step_20 f 5 6 rfl +
      (-64 : ℂ) * P27_step_22 f 5 6 rfl +
      (-32 : ℂ) * P27_step_23 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (32 : ℂ) * P27_step_2 f 4 5 rfl +
      (-16 : ℂ) * P27_step_5 f 4 5 rfl +
      (-16 : ℂ) * P27_step_7 f 4 5 rfl +
      (-16 : ℂ) * P27_step_8 f 4 5 rfl +
      (16 : ℂ) * P27_step_10 f 4 5 rfl +
      (-16 : ℂ) * P27_step_11 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (-16 : ℂ) * P27_step_14 f 4 5 rfl +
      (32 : ℂ) * P27_step_22 f 4 5 rfl +
      (32 : ℂ) * P27_step_23 f 4 5 rfl +
      (-16 : ℂ) * P27_step_25 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (16 : ℂ) * P27_step_1 f 3 4 rfl +
      (-8 : ℂ) * P27_step_4 f 3 4 rfl +
      (8 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_7 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (-8 : ℂ) * P27_step_16 f 3 4 rfl +
      (-8 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_25 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (8 : ℂ) * P27_step_14 f 2 3 rfl +
      (4 : ℂ) * P27_step_16 f 2 3 rfl +
      (-4 : ℂ) * P27_step_17 f 2 3 rfl +
      (4 : ℂ) * P27_step_20 f 2 3 rfl +
      (-4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_26 f 2 3 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (4 : ℂ) * P27_step_7 f 1 2 rfl +
      (4 : ℂ) * P27_step_8 f 1 2 rfl +
      (2 : ℂ) * P27_step_10 f 1 2 rfl +
      (2 : ℂ) * P27_step_13 f 1 2 rfl +
      (-4 : ℂ) * P27_step_20 f 1 2 rfl +
      (-2 : ℂ) * P27_step_22 f 1 2 rfl +
      (-2 : ℂ) * P27_step_25 f 1 2 rfl +
      (-2 : ℂ) * P27_step_26 f 1 2 rfl +
      (2 : ℂ) * P27_step_4 f 0 1 rfl +
      (-2 : ℂ) * P27_step_10 f 0 1 rfl +
      (-1 : ℂ) * P27_step_13 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_6 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 6 - 262144 * P_mod27C^[18] f 6 - P_mod27C^[1] f 6 +
      P_mod27C^[0] f 6 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_6 f 18 19 rfl +
      (131072 : ℂ) * P27_step_3 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_6 f 17 18 rfl +
      (131072 : ℂ) * P27_step_23 f 17 18 rfl +
      (-131072 : ℂ) * P27_step_3 f 16 17 rfl +
      (65536 : ℂ) * P27_step_5 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (65536 : ℂ) * P27_step_15 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_23 f 16 17 rfl +
      (65536 : ℂ) * P27_step_25 f 16 17 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_5 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_15 f 15 16 rfl +
      (32768 : ℂ) * P27_step_16 f 15 16 rfl +
      (32768 : ℂ) * P27_step_21 f 15 16 rfl +
      (32768 : ℂ) * P27_step_23 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_25 f 15 16 rfl +
      (65536 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (16384 : ℂ) * P27_step_5 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (32768 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_16 f 14 15 rfl +
      (16384 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_21 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_23 f 14 15 rfl +
      (16384 : ℂ) * P27_step_24 f 14 15 rfl +
      (16384 : ℂ) * P27_step_25 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_5 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_8 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (8192 : ℂ) * P27_step_12 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_16 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (24576 : ℂ) * P27_step_20 f 13 14 rfl +
      (8192 : ℂ) * P27_step_22 f 13 14 rfl +
      (16384 : ℂ) * P27_step_23 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_24 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_25 f 13 14 rfl +
      (8192 : ℂ) * P27_step_26 f 13 14 rfl +
      (4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_6 f 12 13 rfl +
      (4096 : ℂ) * P27_step_8 f 12 13 rfl +
      (12288 : ℂ) * P27_step_10 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_12 f 12 13 rfl +
      (4096 : ℂ) * P27_step_13 f 12 13 rfl +
      (4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_16 f 12 13 rfl +
      (8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_23 f 12 13 rfl +
      (8192 : ℂ) * P27_step_25 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (2048 : ℂ) * P27_step_3 f 11 12 rfl +
      (2048 : ℂ) * P27_step_4 f 11 12 rfl +
      (2048 : ℂ) * P27_step_5 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_6 f 11 12 rfl +
      (2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_8 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_13 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_25 f 11 12 rfl +
      (4096 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_3 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_4 f 10 11 rfl +
      (3072 : ℂ) * P27_step_8 f 10 11 rfl +
      (2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (2048 : ℂ) * P27_step_13 f 10 11 rfl +
      (1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (1024 : ℂ) * P27_step_15 f 10 11 rfl +
      (1024 : ℂ) * P27_step_16 f 10 11 rfl +
      (1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_20 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_23 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_26 f 10 11 rfl +
      (512 : ℂ) * P27_step_1 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (1536 : ℂ) * P27_step_4 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_10 f 9 10 rfl +
      (512 : ℂ) * P27_step_11 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_13 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_15 f 9 10 rfl +
      (1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (512 : ℂ) * P27_step_21 f 9 10 rfl +
      (512 : ℂ) * P27_step_22 f 9 10 rfl +
      (1024 : ℂ) * P27_step_23 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (-512 : ℂ) * P27_step_1 f 8 9 rfl +
      (768 : ℂ) * P27_step_2 f 8 9 rfl +
      (-512 : ℂ) * P27_step_5 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (-256 : ℂ) * P27_step_8 f 8 9 rfl +
      (512 : ℂ) * P27_step_10 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-512 : ℂ) * P27_step_16 f 8 9 rfl +
      (512 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_19 f 8 9 rfl +
      (-512 : ℂ) * P27_step_20 f 8 9 rfl +
      (-512 : ℂ) * P27_step_21 f 8 9 rfl +
      (256 : ℂ) * P27_step_24 f 8 9 rfl +
      (512 : ℂ) * P27_step_25 f 8 9 rfl +
      (-256 : ℂ) * P27_step_26 f 8 9 rfl +
      (384 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (-128 : ℂ) * P27_step_4 f 7 8 rfl +
      (128 : ℂ) * P27_step_7 f 7 8 rfl +
      (-384 : ℂ) * P27_step_8 f 7 8 rfl +
      (-256 : ℂ) * P27_step_10 f 7 8 rfl +
      (-128 : ℂ) * P27_step_11 f 7 8 rfl +
      (128 : ℂ) * P27_step_12 f 7 8 rfl +
      (-128 : ℂ) * P27_step_13 f 7 8 rfl +
      (-256 : ℂ) * P27_step_14 f 7 8 rfl +
      (-256 : ℂ) * P27_step_16 f 7 8 rfl +
      (256 : ℂ) * P27_step_20 f 7 8 rfl +
      (256 : ℂ) * P27_step_22 f 7 8 rfl +
      (256 : ℂ) * P27_step_23 f 7 8 rfl +
      (-256 : ℂ) * P27_step_24 f 7 8 rfl +
      (256 : ℂ) * P27_step_26 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-192 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_5 f 6 7 rfl +
      (64 : ℂ) * P27_step_6 f 6 7 rfl +
      (-128 : ℂ) * P27_step_7 f 6 7 rfl +
      (-128 : ℂ) * P27_step_8 f 6 7 rfl +
      (128 : ℂ) * P27_step_10 f 6 7 rfl +
      (64 : ℂ) * P27_step_11 f 6 7 rfl +
      (-128 : ℂ) * P27_step_12 f 6 7 rfl +
      (128 : ℂ) * P27_step_13 f 6 7 rfl +
      (192 : ℂ) * P27_step_14 f 6 7 rfl +
      (192 : ℂ) * P27_step_17 f 6 7 rfl +
      (-64 : ℂ) * P27_step_19 f 6 7 rfl +
      (-64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-128 : ℂ) * P27_step_23 f 6 7 rfl +
      (128 : ℂ) * P27_step_25 f 6 7 rfl +
      (-64 : ℂ) * P27_step_26 f 6 7 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (32 : ℂ) * P27_step_3 f 5 6 rfl +
      (-64 : ℂ) * P27_step_4 f 5 6 rfl +
      (-64 : ℂ) * P27_step_6 f 5 6 rfl +
      (96 : ℂ) * P27_step_7 f 5 6 rfl +
      (-32 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_13 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_16 f 5 6 rfl +
      (-64 : ℂ) * P27_step_17 f 5 6 rfl +
      (32 : ℂ) * P27_step_19 f 5 6 rfl +
      (32 : ℂ) * P27_step_20 f 5 6 rfl +
      (96 : ℂ) * P27_step_22 f 5 6 rfl +
      (-64 : ℂ) * P27_step_25 f 5 6 rfl +
      (64 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_2 f 4 5 rfl +
      (-32 : ℂ) * P27_step_3 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (16 : ℂ) * P27_step_10 f 4 5 rfl +
      (48 : ℂ) * P27_step_11 f 4 5 rfl +
      (32 : ℂ) * P27_step_13 f 4 5 rfl +
      (16 : ℂ) * P27_step_15 f 4 5 rfl +
      (48 : ℂ) * P27_step_17 f 4 5 rfl +
      (-16 : ℂ) * P27_step_20 f 4 5 rfl +
      (-32 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (-16 : ℂ) * P27_step_1 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_8 f 3 4 rfl +
      (-8 : ℂ) * P27_step_10 f 3 4 rfl +
      (-8 : ℂ) * P27_step_11 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (-16 : ℂ) * P27_step_15 f 3 4 rfl +
      (8 : ℂ) * P27_step_17 f 3 4 rfl +
      (24 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_20 f 3 4 rfl +
      (8 : ℂ) * P27_step_21 f 3 4 rfl +
      (24 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-4 : ℂ) * P27_step_4 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (8 : ℂ) * P27_step_10 f 2 3 rfl +
      (8 : ℂ) * P27_step_11 f 2 3 rfl +
      (4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_17 f 2 3 rfl +
      (-4 : ℂ) * P27_step_19 f 2 3 rfl +
      (-4 : ℂ) * P27_step_20 f 2 3 rfl +
      (-8 : ℂ) * P27_step_21 f 2 3 rfl +
      (4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_24 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (-2 : ℂ) * P27_step_10 f 1 2 rfl +
      (2 : ℂ) * P27_step_12 f 1 2 rfl +
      (4 : ℂ) * P27_step_19 f 1 2 rfl +
      (4 : ℂ) * P27_step_20 f 1 2 rfl +
      (2 : ℂ) * P27_step_22 f 1 2 rfl +
      (-4 : ℂ) * P27_step_24 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (2 : ℂ) * P27_step_10 f 0 1 rfl +
      (-2 : ℂ) * P27_step_12 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_7 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 7 - 262144 * P_mod27C^[18] f 7 - P_mod27C^[1] f 7 +
      P_mod27C^[0] f 7 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_7 f 18 19 rfl +
      (-262144 : ℂ) * P27_step_7 f 17 18 rfl +
      (131072 : ℂ) * P27_step_11 f 17 18 rfl +
      (131072 : ℂ) * P27_step_17 f 17 18 rfl +
      (-131072 : ℂ) * P27_step_11 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_17 f 16 17 rfl +
      (65536 : ℂ) * P27_step_19 f 16 17 rfl +
      (65536 : ℂ) * P27_step_22 f 16 17 rfl +
      (65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_2 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_17 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_19 f 15 16 rfl +
      (32768 : ℂ) * P27_step_20 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_22 f 15 16 rfl +
      (32768 : ℂ) * P27_step_23 f 15 16 rfl +
      (16384 : ℂ) * P27_step_1 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (16384 : ℂ) * P27_step_10 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (49152 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_22 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_23 f 14 15 rfl +
      (16384 : ℂ) * P27_step_25 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_1 f 13 14 rfl +
      (24576 : ℂ) * P27_step_2 f 13 14 rfl +
      (8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (24576 : ℂ) * P27_step_22 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_25 f 13 14 rfl +
      (24576 : ℂ) * P27_step_26 f 13 14 rfl +
      (12288 : ℂ) * P27_step_1 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (12288 : ℂ) * P27_step_8 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (12288 : ℂ) * P27_step_13 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_22 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_26 f 12 13 rfl +
      (-2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (6144 : ℂ) * P27_step_4 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_5 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_7 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_8 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_13 f 11 12 rfl +
      (6144 : ℂ) * P27_step_14 f 11 12 rfl +
      (2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (4096 : ℂ) * P27_step_20 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (3072 : ℂ) * P27_step_2 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_4 f 10 11 rfl +
      (3072 : ℂ) * P27_step_7 f 10 11 rfl +
      (1024 : ℂ) * P27_step_8 f 10 11 rfl +
      (2048 : ℂ) * P27_step_10 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_16 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_20 f 10 11 rfl +
      (1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (1536 : ℂ) * P27_step_1 f 9 10 rfl +
      (512 : ℂ) * P27_step_4 f 9 10 rfl +
      (1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (-512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_8 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_10 f 9 10 rfl +
      (512 : ℂ) * P27_step_11 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (512 : ℂ) * P27_step_17 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_22 f 9 10 rfl +
      (512 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (-512 : ℂ) * P27_step_26 f 9 10 rfl +
      (-256 : ℂ) * P27_step_2 f 8 9 rfl +
      (-512 : ℂ) * P27_step_4 f 8 9 rfl +
      (-768 : ℂ) * P27_step_5 f 8 9 rfl +
      (-512 : ℂ) * P27_step_7 f 8 9 rfl +
      (256 : ℂ) * P27_step_8 f 8 9 rfl +
      (512 : ℂ) * P27_step_10 f 8 9 rfl +
      (-256 : ℂ) * P27_step_11 f 8 9 rfl +
      (-256 : ℂ) * P27_step_13 f 8 9 rfl +
      (768 : ℂ) * P27_step_14 f 8 9 rfl +
      (512 : ℂ) * P27_step_16 f 8 9 rfl +
      (512 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_19 f 8 9 rfl +
      (256 : ℂ) * P27_step_22 f 8 9 rfl +
      (-512 : ℂ) * P27_step_23 f 8 9 rfl +
      (256 : ℂ) * P27_step_25 f 8 9 rfl +
      (-256 : ℂ) * P27_step_26 f 8 9 rfl +
      (-128 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (128 : ℂ) * P27_step_4 f 7 8 rfl +
      (256 : ℂ) * P27_step_5 f 7 8 rfl +
      (384 : ℂ) * P27_step_7 f 7 8 rfl +
      (256 : ℂ) * P27_step_11 f 7 8 rfl +
      (-128 : ℂ) * P27_step_13 f 7 8 rfl +
      (-384 : ℂ) * P27_step_16 f 7 8 rfl +
      (-512 : ℂ) * P27_step_17 f 7 8 rfl +
      (-128 : ℂ) * P27_step_19 f 7 8 rfl +
      (-384 : ℂ) * P27_step_20 f 7 8 rfl +
      (256 : ℂ) * P27_step_22 f 7 8 rfl +
      (128 : ℂ) * P27_step_23 f 7 8 rfl +
      (-256 : ℂ) * P27_step_25 f 7 8 rfl +
      (384 : ℂ) * P27_step_26 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 6 7 rfl +
      (-192 : ℂ) * P27_step_10 f 6 7 rfl +
      (192 : ℂ) * P27_step_13 f 6 7 rfl +
      (-64 : ℂ) * P27_step_14 f 6 7 rfl +
      (128 : ℂ) * P27_step_16 f 6 7 rfl +
      (192 : ℂ) * P27_step_17 f 6 7 rfl +
      (128 : ℂ) * P27_step_19 f 6 7 rfl +
      (64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-256 : ℂ) * P27_step_22 f 6 7 rfl +
      (-64 : ℂ) * P27_step_23 f 6 7 rfl +
      (64 : ℂ) * P27_step_25 f 6 7 rfl +
      (-192 : ℂ) * P27_step_26 f 6 7 rfl +
      (-32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-96 : ℂ) * P27_step_5 f 5 6 rfl +
      (-32 : ℂ) * P27_step_7 f 5 6 rfl +
      (32 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_11 f 5 6 rfl +
      (-96 : ℂ) * P27_step_13 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (64 : ℂ) * P27_step_20 f 5 6 rfl +
      (96 : ℂ) * P27_step_22 f 5 6 rfl +
      (64 : ℂ) * P27_step_23 f 5 6 rfl +
      (-32 : ℂ) * P27_step_25 f 5 6 rfl +
      (32 : ℂ) * P27_step_26 f 5 6 rfl +
      (16 : ℂ) * P27_step_5 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (32 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (16 : ℂ) * P27_step_13 f 4 5 rfl +
      (-16 : ℂ) * P27_step_14 f 4 5 rfl +
      (-48 : ℂ) * P27_step_16 f 4 5 rfl +
      (-16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-48 : ℂ) * P27_step_20 f 4 5 rfl +
      (32 : ℂ) * P27_step_25 f 4 5 rfl +
      (8 : ℂ) * P27_step_2 f 3 4 rfl +
      (16 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_7 f 3 4 rfl +
      (-24 : ℂ) * P27_step_8 f 3 4 rfl +
      (-24 : ℂ) * P27_step_10 f 3 4 rfl +
      (8 : ℂ) * P27_step_16 f 3 4 rfl +
      (-8 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_20 f 3 4 rfl +
      (-8 : ℂ) * P27_step_23 f 3 4 rfl +
      (16 : ℂ) * P27_step_26 f 3 4 rfl +
      (4 : ℂ) * P27_step_1 f 2 3 rfl +
      (-8 : ℂ) * P27_step_2 f 2 3 rfl +
      (-12 : ℂ) * P27_step_4 f 2 3 rfl +
      (-12 : ℂ) * P27_step_5 f 2 3 rfl +
      (8 : ℂ) * P27_step_8 f 2 3 rfl +
      (8 : ℂ) * P27_step_10 f 2 3 rfl +
      (8 : ℂ) * P27_step_13 f 2 3 rfl +
      (8 : ℂ) * P27_step_16 f 2 3 rfl +
      (8 : ℂ) * P27_step_17 f 2 3 rfl +
      (-4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (-4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-8 : ℂ) * P27_step_26 f 2 3 rfl +
      (-4 : ℂ) * P27_step_1 f 1 2 rfl +
      (4 : ℂ) * P27_step_4 f 1 2 rfl +
      (4 : ℂ) * P27_step_5 f 1 2 rfl +
      (-4 : ℂ) * P27_step_13 f 1 2 rfl +
      (2 : ℂ) * P27_step_14 f 1 2 rfl +
      (-6 : ℂ) * P27_step_16 f 1 2 rfl +
      (-4 : ℂ) * P27_step_17 f 1 2 rfl +
      (4 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_14 f 0 1 rfl +
      (2 : ℂ) * P27_step_16 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_8 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 8 - 262144 * P_mod27C^[18] f 8 - P_mod27C^[1] f 8 +
      P_mod27C^[0] f 8 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_8 f 18 19 rfl +
      (131072 : ℂ) * P27_step_4 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_8 f 17 18 rfl +
      (131072 : ℂ) * P27_step_26 f 17 18 rfl +
      (65536 : ℂ) * P27_step_2 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_4 f 16 17 rfl +
      (65536 : ℂ) * P27_step_13 f 16 17 rfl +
      (65536 : ℂ) * P27_step_20 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_1 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_2 f 15 16 rfl +
      (32768 : ℂ) * P27_step_10 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (65536 : ℂ) * P27_step_17 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_1 f 14 15 rfl +
      (32768 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_5 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (16384 : ℂ) * P27_step_14 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_17 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (32768 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (16384 : ℂ) * P27_step_1 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_2 f 13 14 rfl +
      (8192 : ℂ) * P27_step_7 f 13 14 rfl +
      (16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (16384 : ℂ) * P27_step_11 f 13 14 rfl +
      (8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_14 f 13 14 rfl +
      (8192 : ℂ) * P27_step_16 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_22 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_26 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_1 f 12 13 rfl +
      (8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_7 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_8 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_13 f 12 13 rfl +
      (8192 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (8192 : ℂ) * P27_step_19 f 12 13 rfl +
      (4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_4 f 11 12 rfl +
      (4096 : ℂ) * P27_step_7 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_11 f 11 12 rfl +
      (2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_14 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (4096 : ℂ) * P27_step_23 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_2 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_7 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_8 f 10 11 rfl +
      (1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (2048 : ℂ) * P27_step_17 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_19 f 10 11 rfl +
      (2048 : ℂ) * P27_step_20 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_22 f 10 11 rfl +
      (2048 : ℂ) * P27_step_25 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (-512 : ℂ) * P27_step_1 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_4 f 9 10 rfl +
      (1024 : ℂ) * P27_step_10 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_11 f 9 10 rfl +
      (-512 : ℂ) * P27_step_13 f 9 10 rfl +
      (1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (512 : ℂ) * P27_step_19 f 9 10 rfl +
      (1024 : ℂ) * P27_step_22 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (512 : ℂ) * P27_step_5 f 8 9 rfl +
      (512 : ℂ) * P27_step_7 f 8 9 rfl +
      (512 : ℂ) * P27_step_11 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (-256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-512 : ℂ) * P27_step_17 f 8 9 rfl +
      (-512 : ℂ) * P27_step_19 f 8 9 rfl +
      (-512 : ℂ) * P27_step_20 f 8 9 rfl +
      (256 : ℂ) * P27_step_23 f 8 9 rfl +
      (-512 : ℂ) * P27_step_25 f 8 9 rfl +
      (256 : ℂ) * P27_step_26 f 8 9 rfl +
      (-256 : ℂ) * P27_step_2 f 7 8 rfl +
      (-128 : ℂ) * P27_step_7 f 7 8 rfl +
      (256 : ℂ) * P27_step_8 f 7 8 rfl +
      (-256 : ℂ) * P27_step_10 f 7 8 rfl +
      (128 : ℂ) * P27_step_13 f 7 8 rfl +
      (256 : ℂ) * P27_step_16 f 7 8 rfl +
      (256 : ℂ) * P27_step_17 f 7 8 rfl +
      (256 : ℂ) * P27_step_19 f 7 8 rfl +
      (256 : ℂ) * P27_step_20 f 7 8 rfl +
      (-256 : ℂ) * P27_step_22 f 7 8 rfl +
      (-256 : ℂ) * P27_step_23 f 7 8 rfl +
      (128 : ℂ) * P27_step_25 f 7 8 rfl +
      (-384 : ℂ) * P27_step_26 f 7 8 rfl +
      (-128 : ℂ) * P27_step_1 f 6 7 rfl +
      (128 : ℂ) * P27_step_4 f 6 7 rfl +
      (-128 : ℂ) * P27_step_5 f 6 7 rfl +
      (128 : ℂ) * P27_step_10 f 6 7 rfl +
      (-192 : ℂ) * P27_step_13 f 6 7 rfl +
      (-64 : ℂ) * P27_step_17 f 6 7 rfl +
      (128 : ℂ) * P27_step_22 f 6 7 rfl +
      (128 : ℂ) * P27_step_23 f 6 7 rfl +
      (-128 : ℂ) * P27_step_25 f 6 7 rfl +
      (128 : ℂ) * P27_step_26 f 6 7 rfl +
      (64 : ℂ) * P27_step_2 f 5 6 rfl +
      (64 : ℂ) * P27_step_5 f 5 6 rfl +
      (64 : ℂ) * P27_step_13 f 5 6 rfl +
      (-64 : ℂ) * P27_step_14 f 5 6 rfl +
      (-64 : ℂ) * P27_step_16 f 5 6 rfl +
      (-64 : ℂ) * P27_step_20 f 5 6 rfl +
      (-32 : ℂ) * P27_step_22 f 5 6 rfl +
      (64 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (32 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_7 f 4 5 rfl +
      (-32 : ℂ) * P27_step_8 f 4 5 rfl +
      (-32 : ℂ) * P27_step_10 f 4 5 rfl +
      (-16 : ℂ) * P27_step_11 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (32 : ℂ) * P27_step_16 f 4 5 rfl +
      (48 : ℂ) * P27_step_20 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-16 : ℂ) * P27_step_4 f 3 4 rfl +
      (-16 : ℂ) * P27_step_5 f 3 4 rfl +
      (16 : ℂ) * P27_step_8 f 3 4 rfl +
      (24 : ℂ) * P27_step_10 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (16 : ℂ) * P27_step_14 f 3 4 rfl +
      (-8 : ℂ) * P27_step_19 f 3 4 rfl +
      (-16 : ℂ) * P27_step_20 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (8 : ℂ) * P27_step_4 f 2 3 rfl +
      (12 : ℂ) * P27_step_5 f 2 3 rfl +
      (8 : ℂ) * P27_step_7 f 2 3 rfl +
      (-8 : ℂ) * P27_step_10 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_16 f 2 3 rfl +
      (-8 : ℂ) * P27_step_17 f 2 3 rfl +
      (-4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_26 f 2 3 rfl +
      (-4 : ℂ) * P27_step_5 f 1 2 rfl +
      (2 : ℂ) * P27_step_13 f 1 2 rfl +
      (6 : ℂ) * P27_step_16 f 1 2 rfl +
      (4 : ℂ) * P27_step_17 f 1 2 rfl +
      (-4 : ℂ) * P27_step_22 f 1 2 rfl +
      (-2 : ℂ) * P27_step_25 f 1 2 rfl +
      (-2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_16 f 0 1 rfl +
      (2 : ℂ) * P27_step_22 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_9 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 9 - 262144 * P_mod27C^[18] f 9 - P_mod27C^[1] f 9 +
      P_mod27C^[0] f 9 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_9 f 18 19 rfl +
      (-262144 : ℂ) * P27_step_9 f 17 18 rfl +
      (131072 : ℂ) * P27_step_14 f 17 18 rfl +
      (131072 : ℂ) * P27_step_18 f 17 18 rfl +
      (65536 : ℂ) * P27_step_7 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (65536 : ℂ) * P27_step_9 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_14 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_18 f 16 17 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_7 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_9 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_14 f 15 16 rfl +
      (32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_18 f 15 16 rfl +
      (32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_7 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (16384 : ℂ) * P27_step_9 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_14 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_18 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_7 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_8 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_9 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (8192 : ℂ) * P27_step_18 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (-4096 : ℂ) * P27_step_4 f 12 13 rfl +
      (4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (4096 : ℂ) * P27_step_9 f 12 13 rfl +
      (8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_18 f 12 13 rfl +
      (4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (4096 : ℂ) * P27_step_5 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_9 f 11 12 rfl +
      (2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_18 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_20 f 11 12 rfl +
      (2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (1024 : ℂ) * P27_step_5 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (2048 : ℂ) * P27_step_8 f 10 11 rfl +
      (1024 : ℂ) * P27_step_9 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_10 f 10 11 rfl +
      (1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (2048 : ℂ) * P27_step_16 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_18 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_20 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (1024 : ℂ) * P27_step_4 f 9 10 rfl +
      (-512 : ℂ) * P27_step_5 f 9 10 rfl +
      (-512 : ℂ) * P27_step_7 f 9 10 rfl +
      (512 : ℂ) * P27_step_8 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_9 f 9 10 rfl +
      (-512 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_13 f 9 10 rfl +
      (512 : ℂ) * P27_step_16 f 9 10 rfl +
      (-512 : ℂ) * P27_step_17 f 9 10 rfl +
      (512 : ℂ) * P27_step_18 f 9 10 rfl +
      (512 : ℂ) * P27_step_19 f 9 10 rfl +
      (512 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (512 : ℂ) * P27_step_2 f 8 9 rfl +
      (256 : ℂ) * P27_step_4 f 8 9 rfl +
      (-256 : ℂ) * P27_step_5 f 8 9 rfl +
      (256 : ℂ) * P27_step_9 f 8 9 rfl +
      (256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-256 : ℂ) * P27_step_11 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (-256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-256 : ℂ) * P27_step_16 f 8 9 rfl +
      (-512 : ℂ) * P27_step_18 f 8 9 rfl +
      (-256 : ℂ) * P27_step_22 f 8 9 rfl +
      (256 : ℂ) * P27_step_23 f 8 9 rfl +
      (256 : ℂ) * P27_step_1 f 7 8 rfl +
      (256 : ℂ) * P27_step_2 f 7 8 rfl +
      (128 : ℂ) * P27_step_5 f 7 8 rfl +
      (-128 : ℂ) * P27_step_7 f 7 8 rfl +
      (-256 : ℂ) * P27_step_8 f 7 8 rfl +
      (-256 : ℂ) * P27_step_9 f 7 8 rfl +
      (-256 : ℂ) * P27_step_11 f 7 8 rfl +
      (-128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-128 : ℂ) * P27_step_16 f 7 8 rfl +
      (128 : ℂ) * P27_step_17 f 7 8 rfl +
      (128 : ℂ) * P27_step_18 f 7 8 rfl +
      (-128 : ℂ) * P27_step_19 f 7 8 rfl +
      (256 : ℂ) * P27_step_20 f 7 8 rfl +
      (128 : ℂ) * P27_step_25 f 7 8 rfl +
      (128 : ℂ) * P27_step_1 f 6 7 rfl +
      (64 : ℂ) * P27_step_2 f 6 7 rfl +
      (-128 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-64 : ℂ) * P27_step_8 f 6 7 rfl +
      (64 : ℂ) * P27_step_9 f 6 7 rfl +
      (128 : ℂ) * P27_step_10 f 6 7 rfl +
      (-64 : ℂ) * P27_step_11 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (64 : ℂ) * P27_step_16 f 6 7 rfl +
      (64 : ℂ) * P27_step_17 f 6 7 rfl +
      (-128 : ℂ) * P27_step_18 f 6 7 rfl +
      (-128 : ℂ) * P27_step_19 f 6 7 rfl +
      (64 : ℂ) * P27_step_22 f 6 7 rfl +
      (-64 : ℂ) * P27_step_23 f 6 7 rfl +
      (32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-32 : ℂ) * P27_step_4 f 5 6 rfl +
      (64 : ℂ) * P27_step_5 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (32 : ℂ) * P27_step_8 f 5 6 rfl +
      (-64 : ℂ) * P27_step_9 f 5 6 rfl +
      (32 : ℂ) * P27_step_11 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_17 f 5 6 rfl +
      (32 : ℂ) * P27_step_18 f 5 6 rfl +
      (-32 : ℂ) * P27_step_19 f 5 6 rfl +
      (-32 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_22 f 5 6 rfl +
      (-64 : ℂ) * P27_step_23 f 5 6 rfl +
      (-32 : ℂ) * P27_step_25 f 5 6 rfl +
      (-16 : ℂ) * P27_step_2 f 4 5 rfl +
      (16 : ℂ) * P27_step_4 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (16 : ℂ) * P27_step_8 f 4 5 rfl +
      (16 : ℂ) * P27_step_9 f 4 5 rfl +
      (-16 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (32 : ℂ) * P27_step_16 f 4 5 rfl +
      (16 : ℂ) * P27_step_17 f 4 5 rfl +
      (-32 : ℂ) * P27_step_18 f 4 5 rfl +
      (16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-16 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-32 : ℂ) * P27_step_25 f 4 5 rfl +
      (-16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-8 : ℂ) * P27_step_1 f 3 4 rfl +
      (8 : ℂ) * P27_step_2 f 3 4 rfl +
      (8 : ℂ) * P27_step_4 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (8 : ℂ) * P27_step_8 f 3 4 rfl +
      (-16 : ℂ) * P27_step_9 f 3 4 rfl +
      (-8 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (8 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_18 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (8 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (4 : ℂ) * P27_step_1 f 2 3 rfl +
      (4 : ℂ) * P27_step_2 f 2 3 rfl +
      (4 : ℂ) * P27_step_4 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (4 : ℂ) * P27_step_9 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_17 f 2 3 rfl +
      (-8 : ℂ) * P27_step_18 f 2 3 rfl +
      (4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (2 : ℂ) * P27_step_1 f 1 2 rfl +
      (4 : ℂ) * P27_step_2 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (-4 : ℂ) * P27_step_9 f 1 2 rfl +
      (2 : ℂ) * P27_step_18 f 1 2 rfl +
      (2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (2 : ℂ) * P27_step_1 f 0 1 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_18 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_10 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 10 - 262144 * P_mod27C^[18] f 10 - P_mod27C^[1] f 10 +
      P_mod27C^[0] f 10 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_10 f 18 19 rfl +
      (131072 : ℂ) * P27_step_2 f 17 18 rfl +
      (131072 : ℂ) * P27_step_5 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_10 f 17 18 rfl +
      (65536 : ℂ) * P27_step_1 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_2 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_5 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (65536 : ℂ) * P27_step_16 f 16 17 rfl +
      (65536 : ℂ) * P27_step_17 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_1 f 15 16 rfl +
      (32768 : ℂ) * P27_step_2 f 15 16 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_14 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_16 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_22 f 15 16 rfl +
      (65536 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_1 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (16384 : ℂ) * P27_step_7 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (32768 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_14 f 14 15 rfl +
      (32768 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_22 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (-8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_2 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_7 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (8192 : ℂ) * P27_step_20 f 13 14 rfl +
      (16384 : ℂ) * P27_step_22 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (4096 : ℂ) * P27_step_1 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (8192 : ℂ) * P27_step_8 f 12 13 rfl +
      (4096 : ℂ) * P27_step_10 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (-2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (4096 : ℂ) * P27_step_4 f 11 12 rfl +
      (2048 : ℂ) * P27_step_5 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (6144 : ℂ) * P27_step_11 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_20 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_5 f 10 11 rfl +
      (1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (3072 : ℂ) * P27_step_8 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_10 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (1024 : ℂ) * P27_step_16 f 10 11 rfl +
      (3072 : ℂ) * P27_step_19 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_20 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (512 : ℂ) * P27_step_2 f 9 10 rfl +
      (1536 : ℂ) * P27_step_4 f 9 10 rfl +
      (-512 : ℂ) * P27_step_5 f 9 10 rfl +
      (-512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-512 : ℂ) * P27_step_8 f 9 10 rfl +
      (-512 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_13 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (-512 : ℂ) * P27_step_16 f 9 10 rfl +
      (-512 : ℂ) * P27_step_17 f 9 10 rfl +
      (-512 : ℂ) * P27_step_19 f 9 10 rfl +
      (512 : ℂ) * P27_step_20 f 9 10 rfl +
      (1536 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (256 : ℂ) * P27_step_1 f 8 9 rfl +
      (256 : ℂ) * P27_step_2 f 8 9 rfl +
      (-256 : ℂ) * P27_step_4 f 8 9 rfl +
      (-256 : ℂ) * P27_step_5 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_11 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (-256 : ℂ) * P27_step_16 f 8 9 rfl +
      (256 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_20 f 8 9 rfl +
      (-256 : ℂ) * P27_step_22 f 8 9 rfl +
      (-256 : ℂ) * P27_step_23 f 8 9 rfl +
      (768 : ℂ) * P27_step_25 f 8 9 rfl +
      (-256 : ℂ) * P27_step_26 f 8 9 rfl +
      (128 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (128 : ℂ) * P27_step_5 f 7 8 rfl +
      (-384 : ℂ) * P27_step_8 f 7 8 rfl +
      (128 : ℂ) * P27_step_10 f 7 8 rfl +
      (-128 : ℂ) * P27_step_13 f 7 8 rfl +
      (128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-128 : ℂ) * P27_step_16 f 7 8 rfl +
      (-128 : ℂ) * P27_step_17 f 7 8 rfl +
      (-256 : ℂ) * P27_step_19 f 7 8 rfl +
      (128 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_25 f 7 8 rfl +
      (384 : ℂ) * P27_step_26 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-192 : ℂ) * P27_step_4 f 6 7 rfl +
      (64 : ℂ) * P27_step_5 f 6 7 rfl +
      (64 : ℂ) * P27_step_7 f 6 7 rfl +
      (64 : ℂ) * P27_step_8 f 6 7 rfl +
      (-64 : ℂ) * P27_step_11 f 6 7 rfl +
      (192 : ℂ) * P27_step_13 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (64 : ℂ) * P27_step_16 f 6 7 rfl +
      (64 : ℂ) * P27_step_17 f 6 7 rfl +
      (-64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-64 : ℂ) * P27_step_22 f 6 7 rfl +
      (-128 : ℂ) * P27_step_23 f 6 7 rfl +
      (-128 : ℂ) * P27_step_26 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 5 6 rfl +
      (32 : ℂ) * P27_step_4 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (32 : ℂ) * P27_step_8 f 5 6 rfl +
      (-32 : ℂ) * P27_step_10 f 5 6 rfl +
      (32 : ℂ) * P27_step_11 f 5 6 rfl +
      (-64 : ℂ) * P27_step_13 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (32 : ℂ) * P27_step_16 f 5 6 rfl +
      (-32 : ℂ) * P27_step_17 f 5 6 rfl +
      (-32 : ℂ) * P27_step_19 f 5 6 rfl +
      (64 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_22 f 5 6 rfl +
      (-64 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_1 f 4 5 rfl +
      (-16 : ℂ) * P27_step_2 f 4 5 rfl +
      (16 : ℂ) * P27_step_4 f 4 5 rfl +
      (-16 : ℂ) * P27_step_5 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (32 : ℂ) * P27_step_8 f 4 5 rfl +
      (32 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (32 : ℂ) * P27_step_17 f 4 5 rfl +
      (16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-32 : ℂ) * P27_step_20 f 4 5 rfl +
      (-16 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (-8 : ℂ) * P27_step_1 f 3 4 rfl +
      (16 : ℂ) * P27_step_2 f 3 4 rfl +
      (16 : ℂ) * P27_step_4 f 3 4 rfl +
      (16 : ℂ) * P27_step_5 f 3 4 rfl +
      (-16 : ℂ) * P27_step_8 f 3 4 rfl +
      (-16 : ℂ) * P27_step_10 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (-16 : ℂ) * P27_step_14 f 3 4 rfl +
      (-8 : ℂ) * P27_step_16 f 3 4 rfl +
      (-8 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (16 : ℂ) * P27_step_26 f 3 4 rfl +
      (8 : ℂ) * P27_step_1 f 2 3 rfl +
      (-8 : ℂ) * P27_step_4 f 2 3 rfl +
      (-8 : ℂ) * P27_step_5 f 2 3 rfl +
      (-8 : ℂ) * P27_step_7 f 2 3 rfl +
      (8 : ℂ) * P27_step_13 f 2 3 rfl +
      (-4 : ℂ) * P27_step_14 f 2 3 rfl +
      (8 : ℂ) * P27_step_16 f 2 3 rfl +
      (8 : ℂ) * P27_step_17 f 2 3 rfl +
      (-4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-8 : ℂ) * P27_step_26 f 2 3 rfl +
      (-2 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_13 f 1 2 rfl +
      (4 : ℂ) * P27_step_14 f 1 2 rfl +
      (-4 : ℂ) * P27_step_16 f 1 2 rfl +
      (-4 : ℂ) * P27_step_17 f 1 2 rfl +
      (2 : ℂ) * P27_step_20 f 1 2 rfl +
      (4 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (2 : ℂ) * P27_step_7 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_20 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_11 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 11 - 262144 * P_mod27C^[18] f 11 - P_mod27C^[1] f 11 +
      P_mod27C^[0] f 11 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_11 f 18 19 rfl +
      (-262144 : ℂ) * P27_step_11 f 17 18 rfl +
      (131072 : ℂ) * P27_step_17 f 17 18 rfl +
      (131072 : ℂ) * P27_step_19 f 17 18 rfl +
      (65536 : ℂ) * P27_step_2 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_17 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_19 f 16 17 rfl +
      (65536 : ℂ) * P27_step_22 f 16 17 rfl +
      (65536 : ℂ) * P27_step_23 f 16 17 rfl +
      (65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_1 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_2 f 15 16 rfl +
      (32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_20 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_22 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_23 f 15 16 rfl +
      (32768 : ℂ) * P27_step_25 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_1 f 14 15 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_8 f 14 15 rfl +
      (16384 : ℂ) * P27_step_10 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (16384 : ℂ) * P27_step_14 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_25 f 14 15 rfl +
      (32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_2 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_4 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (8192 : ℂ) * P27_step_7 f 13 14 rfl +
      (8192 : ℂ) * P27_step_8 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_14 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_26 f 13 14 rfl +
      (4096 : ℂ) * P27_step_1 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_2 f 12 13 rfl +
      (4096 : ℂ) * P27_step_4 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_7 f 12 13 rfl +
      (4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_13 f 12 13 rfl +
      (4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (8192 : ℂ) * P27_step_20 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_1 f 11 12 rfl +
      (2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (2048 : ℂ) * P27_step_8 f 11 12 rfl +
      (4096 : ℂ) * P27_step_10 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_20 f 11 12 rfl +
      (2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 10 11 rfl +
      (1024 : ℂ) * P27_step_4 f 10 11 rfl +
      (2048 : ℂ) * P27_step_5 f 10 11 rfl +
      (1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_10 f 10 11 rfl +
      (1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_14 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_20 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (512 : ℂ) * P27_step_1 f 9 10 rfl +
      (-512 : ℂ) * P27_step_2 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_5 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_7 f 9 10 rfl +
      (512 : ℂ) * P27_step_8 f 9 10 rfl +
      (-512 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_11 f 9 10 rfl +
      (512 : ℂ) * P27_step_14 f 9 10 rfl +
      (1024 : ℂ) * P27_step_16 f 9 10 rfl +
      (1024 : ℂ) * P27_step_17 f 9 10 rfl +
      (512 : ℂ) * P27_step_19 f 9 10 rfl +
      (1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_22 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_26 f 9 10 rfl +
      (-256 : ℂ) * P27_step_1 f 8 9 rfl +
      (256 : ℂ) * P27_step_2 f 8 9 rfl +
      (256 : ℂ) * P27_step_4 f 8 9 rfl +
      (-256 : ℂ) * P27_step_5 f 8 9 rfl +
      (256 : ℂ) * P27_step_7 f 8 9 rfl +
      (512 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_13 f 8 9 rfl +
      (256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-768 : ℂ) * P27_step_16 f 8 9 rfl +
      (-512 : ℂ) * P27_step_17 f 8 9 rfl +
      (-256 : ℂ) * P27_step_19 f 8 9 rfl +
      (-256 : ℂ) * P27_step_20 f 8 9 rfl +
      (512 : ℂ) * P27_step_22 f 8 9 rfl +
      (256 : ℂ) * P27_step_23 f 8 9 rfl +
      (512 : ℂ) * P27_step_26 f 8 9 rfl +
      (128 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (256 : ℂ) * P27_step_5 f 7 8 rfl +
      (128 : ℂ) * P27_step_7 f 7 8 rfl +
      (-256 : ℂ) * P27_step_8 f 7 8 rfl +
      (-128 : ℂ) * P27_step_10 f 7 8 rfl +
      (256 : ℂ) * P27_step_13 f 7 8 rfl +
      (-128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-128 : ℂ) * P27_step_16 f 7 8 rfl +
      (128 : ℂ) * P27_step_17 f 7 8 rfl +
      (-128 : ℂ) * P27_step_20 f 7 8 rfl +
      (-256 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_23 f 7 8 rfl +
      (128 : ℂ) * P27_step_25 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-128 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_5 f 6 7 rfl +
      (-64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-64 : ℂ) * P27_step_8 f 6 7 rfl +
      (-64 : ℂ) * P27_step_10 f 6 7 rfl +
      (-64 : ℂ) * P27_step_11 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (128 : ℂ) * P27_step_16 f 6 7 rfl +
      (64 : ℂ) * P27_step_17 f 6 7 rfl +
      (128 : ℂ) * P27_step_20 f 6 7 rfl +
      (64 : ℂ) * P27_step_22 f 6 7 rfl +
      (-64 : ℂ) * P27_step_25 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 5 6 rfl +
      (-32 : ℂ) * P27_step_4 f 5 6 rfl +
      (-32 : ℂ) * P27_step_5 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (64 : ℂ) * P27_step_8 f 5 6 rfl +
      (64 : ℂ) * P27_step_10 f 5 6 rfl +
      (32 : ℂ) * P27_step_11 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_16 f 5 6 rfl +
      (-32 : ℂ) * P27_step_19 f 5 6 rfl +
      (-32 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_22 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (-32 : ℂ) * P27_step_1 f 4 5 rfl +
      (32 : ℂ) * P27_step_4 f 4 5 rfl +
      (32 : ℂ) * P27_step_5 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (-16 : ℂ) * P27_step_8 f 4 5 rfl +
      (-16 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (-16 : ℂ) * P27_step_16 f 4 5 rfl +
      (-16 : ℂ) * P27_step_17 f 4 5 rfl +
      (16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-8 : ℂ) * P27_step_4 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (-16 : ℂ) * P27_step_14 f 3 4 rfl +
      (16 : ℂ) * P27_step_16 f 3 4 rfl +
      (16 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (-8 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-8 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (8 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-4 : ℂ) * P27_step_17 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_12 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 12 - 262144 * P_mod27C^[18] f 12 - P_mod27C^[1] f 12 +
      P_mod27C^[0] f 12 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_12 f 18 19 rfl +
      (131072 : ℂ) * P27_step_5 f 17 18 rfl +
      (131072 : ℂ) * P27_step_6 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_12 f 17 18 rfl +
      (65536 : ℂ) * P27_step_3 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_5 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_6 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (65536 : ℂ) * P27_step_16 f 16 17 rfl +
      (65536 : ℂ) * P27_step_23 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_3 f 15 16 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (32768 : ℂ) * P27_step_5 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_15 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_16 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_23 f 15 16 rfl +
      (32768 : ℂ) * P27_step_25 f 15 16 rfl +
      (32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_5 f 14 15 rfl +
      (-49152 : ℂ) * P27_step_8 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_15 f 14 15 rfl +
      (16384 : ℂ) * P27_step_16 f 14 15 rfl +
      (16384 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (16384 : ℂ) * P27_step_21 f 14 15 rfl +
      (16384 : ℂ) * P27_step_23 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_25 f 14 15 rfl +
      (32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_2 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_4 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_16 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_21 f 13 14 rfl +
      (8192 : ℂ) * P27_step_22 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (8192 : ℂ) * P27_step_24 f 13 14 rfl +
      (8192 : ℂ) * P27_step_25 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_26 f 13 14 rfl +
      (4096 : ℂ) * P27_step_1 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_2 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_8 f 12 13 rfl +
      (8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (4096 : ℂ) * P27_step_12 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_13 f 12 13 rfl +
      (4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (8192 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_24 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_1 f 11 12 rfl +
      (4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_4 f 11 12 rfl +
      (6144 : ℂ) * P27_step_5 f 11 12 rfl +
      (2048 : ℂ) * P27_step_6 f 11 12 rfl +
      (2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (2048 : ℂ) * P27_step_8 f 11 12 rfl +
      (4096 : ℂ) * P27_step_10 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_12 f 11 12 rfl +
      (2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_20 f 11 12 rfl +
      (4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_23 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_2 f 10 11 rfl +
      (1024 : ℂ) * P27_step_3 f 10 11 rfl +
      (1024 : ℂ) * P27_step_4 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_6 f 10 11 rfl +
      (1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_10 f 10 11 rfl +
      (2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_14 f 10 11 rfl +
      (3072 : ℂ) * P27_step_16 f 10 11 rfl +
      (1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_25 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_1 f 9 10 rfl +
      (512 : ℂ) * P27_step_2 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_3 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_7 f 9 10 rfl +
      (1024 : ℂ) * P27_step_8 f 9 10 rfl +
      (512 : ℂ) * P27_step_11 f 9 10 rfl +
      (1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (512 : ℂ) * P27_step_15 f 9 10 rfl +
      (512 : ℂ) * P27_step_17 f 9 10 rfl +
      (1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (-512 : ℂ) * P27_step_20 f 9 10 rfl +
      (512 : ℂ) * P27_step_22 f 9 10 rfl +
      (-512 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_26 f 9 10 rfl +
      (256 : ℂ) * P27_step_1 f 8 9 rfl +
      (512 : ℂ) * P27_step_4 f 8 9 rfl +
      (-512 : ℂ) * P27_step_5 f 8 9 rfl +
      (512 : ℂ) * P27_step_7 f 8 9 rfl +
      (-256 : ℂ) * P27_step_8 f 8 9 rfl +
      (-256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_13 f 8 9 rfl +
      (-512 : ℂ) * P27_step_14 f 8 9 rfl +
      (-512 : ℂ) * P27_step_15 f 8 9 rfl +
      (-512 : ℂ) * P27_step_16 f 8 9 rfl +
      (-256 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_19 f 8 9 rfl +
      (256 : ℂ) * P27_step_20 f 8 9 rfl +
      (256 : ℂ) * P27_step_21 f 8 9 rfl +
      (256 : ℂ) * P27_step_22 f 8 9 rfl +
      (768 : ℂ) * P27_step_23 f 8 9 rfl +
      (-256 : ℂ) * P27_step_25 f 8 9 rfl +
      (512 : ℂ) * P27_step_26 f 8 9 rfl +
      (384 : ℂ) * P27_step_2 f 7 8 rfl +
      (-128 : ℂ) * P27_step_4 f 7 8 rfl +
      (-256 : ℂ) * P27_step_7 f 7 8 rfl +
      (-384 : ℂ) * P27_step_8 f 7 8 rfl +
      (128 : ℂ) * P27_step_10 f 7 8 rfl +
      (256 : ℂ) * P27_step_13 f 7 8 rfl +
      (128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-256 : ℂ) * P27_step_16 f 7 8 rfl +
      (384 : ℂ) * P27_step_17 f 7 8 rfl +
      (-128 : ℂ) * P27_step_20 f 7 8 rfl +
      (-256 : ℂ) * P27_step_21 f 7 8 rfl +
      (-128 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_23 f 7 8 rfl +
      (128 : ℂ) * P27_step_24 f 7 8 rfl +
      (384 : ℂ) * P27_step_25 f 7 8 rfl +
      (-128 : ℂ) * P27_step_26 f 7 8 rfl +
      (192 : ℂ) * P27_step_1 f 6 7 rfl +
      (-192 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_5 f 6 7 rfl +
      (64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-128 : ℂ) * P27_step_8 f 6 7 rfl +
      (-64 : ℂ) * P27_step_10 f 6 7 rfl +
      (-128 : ℂ) * P27_step_11 f 6 7 rfl +
      (64 : ℂ) * P27_step_12 f 6 7 rfl +
      (-64 : ℂ) * P27_step_13 f 6 7 rfl +
      (128 : ℂ) * P27_step_20 f 6 7 rfl +
      (192 : ℂ) * P27_step_22 f 6 7 rfl +
      (64 : ℂ) * P27_step_23 f 6 7 rfl +
      (-128 : ℂ) * P27_step_24 f 6 7 rfl +
      (-64 : ℂ) * P27_step_25 f 6 7 rfl +
      (128 : ℂ) * P27_step_26 f 6 7 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (-64 : ℂ) * P27_step_4 f 5 6 rfl +
      (32 : ℂ) * P27_step_6 f 5 6 rfl +
      (64 : ℂ) * P27_step_10 f 5 6 rfl +
      (96 : ℂ) * P27_step_11 f 5 6 rfl +
      (-64 : ℂ) * P27_step_12 f 5 6 rfl +
      (64 : ℂ) * P27_step_13 f 5 6 rfl +
      (96 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_16 f 5 6 rfl +
      (32 : ℂ) * P27_step_17 f 5 6 rfl +
      (-64 : ℂ) * P27_step_19 f 5 6 rfl +
      (-64 : ℂ) * P27_step_20 f 5 6 rfl +
      (-64 : ℂ) * P27_step_23 f 5 6 rfl +
      (32 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_2 f 4 5 rfl +
      (16 : ℂ) * P27_step_3 f 4 5 rfl +
      (-32 : ℂ) * P27_step_6 f 4 5 rfl +
      (48 : ℂ) * P27_step_7 f 4 5 rfl +
      (-32 : ℂ) * P27_step_10 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (48 : ℂ) * P27_step_19 f 4 5 rfl +
      (32 : ℂ) * P27_step_20 f 4 5 rfl +
      (16 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-32 : ℂ) * P27_step_25 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-16 : ℂ) * P27_step_1 f 3 4 rfl +
      (-16 : ℂ) * P27_step_3 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_8 f 3 4 rfl +
      (16 : ℂ) * P27_step_10 f 3 4 rfl +
      (16 : ℂ) * P27_step_11 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (8 : ℂ) * P27_step_15 f 3 4 rfl +
      (24 : ℂ) * P27_step_17 f 3 4 rfl +
      (-8 : ℂ) * P27_step_20 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-4 : ℂ) * P27_step_4 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (-4 : ℂ) * P27_step_10 f 2 3 rfl +
      (-4 : ℂ) * P27_step_11 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (-8 : ℂ) * P27_step_15 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_17 f 2 3 rfl +
      (8 : ℂ) * P27_step_19 f 2 3 rfl +
      (8 : ℂ) * P27_step_20 f 2 3 rfl +
      (4 : ℂ) * P27_step_21 f 2 3 rfl +
      (12 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (4 : ℂ) * P27_step_10 f 1 2 rfl +
      (4 : ℂ) * P27_step_11 f 1 2 rfl +
      (-2 : ℂ) * P27_step_19 f 1 2 rfl +
      (-4 : ℂ) * P27_step_21 f 1 2 rfl +
      (2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_24 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (2 : ℂ) * P27_step_19 f 0 1 rfl +
      (-2 : ℂ) * P27_step_24 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_13 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 13 - 262144 * P_mod27C^[18] f 13 - P_mod27C^[1] f 13 +
      P_mod27C^[0] f 13 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_13 f 18 19 rfl +
      (-262144 : ℂ) * P27_step_13 f 17 18 rfl +
      (262144 : ℂ) * P27_step_20 f 17 18 rfl +
      (131072 : ℂ) * P27_step_10 f 16 17 rfl +
      (131072 : ℂ) * P27_step_17 f 16 17 rfl +
      (-262144 : ℂ) * P27_step_20 f 16 17 rfl +
      (65536 : ℂ) * P27_step_2 f 15 16 rfl +
      (65536 : ℂ) * P27_step_5 f 15 16 rfl +
      (-131072 : ℂ) * P27_step_10 f 15 16 rfl +
      (-131072 : ℂ) * P27_step_17 f 15 16 rfl +
      (65536 : ℂ) * P27_step_22 f 15 16 rfl +
      (65536 : ℂ) * P27_step_26 f 15 16 rfl +
      (32768 : ℂ) * P27_step_1 f 14 15 rfl +
      (-65536 : ℂ) * P27_step_2 f 14 15 rfl +
      (-65536 : ℂ) * P27_step_5 f 14 15 rfl +
      (32768 : ℂ) * P27_step_8 f 14 15 rfl +
      (32768 : ℂ) * P27_step_11 f 14 15 rfl +
      (32768 : ℂ) * P27_step_13 f 14 15 rfl +
      (32768 : ℂ) * P27_step_16 f 14 15 rfl +
      (32768 : ℂ) * P27_step_17 f 14 15 rfl +
      (32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (-65536 : ℂ) * P27_step_22 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_1 f 13 14 rfl +
      (16384 : ℂ) * P27_step_2 f 13 14 rfl +
      (16384 : ℂ) * P27_step_4 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_11 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (16384 : ℂ) * P27_step_14 f 13 14 rfl +
      (-32768 : ℂ) * P27_step_16 f 13 14 rfl +
      (16384 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_22 f 13 14 rfl +
      (16384 : ℂ) * P27_step_26 f 13 14 rfl +
      (8192 : ℂ) * P27_step_1 f 12 13 rfl +
      (8192 : ℂ) * P27_step_2 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (8192 : ℂ) * P27_step_7 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_8 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_11 f 12 13 rfl +
      (8192 : ℂ) * P27_step_13 f 12 13 rfl +
      (-16384 : ℂ) * P27_step_14 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_19 f 12 13 rfl +
      (8192 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_1 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_4 f 11 12 rfl +
      (-8192 : ℂ) * P27_step_7 f 11 12 rfl +
      (4096 : ℂ) * P27_step_11 f 11 12 rfl +
      (4096 : ℂ) * P27_step_14 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (4096 : ℂ) * P27_step_17 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_19 f 11 12 rfl +
      (4096 : ℂ) * P27_step_20 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_23 f 11 12 rfl +
      (4096 : ℂ) * P27_step_25 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_26 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_2 f 10 11 rfl +
      (2048 : ℂ) * P27_step_7 f 10 11 rfl +
      (2048 : ℂ) * P27_step_8 f 10 11 rfl +
      (2048 : ℂ) * P27_step_10 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_13 f 10 11 rfl +
      (2048 : ℂ) * P27_step_14 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_17 f 10 11 rfl +
      (2048 : ℂ) * P27_step_19 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_20 f 10 11 rfl +
      (2048 : ℂ) * P27_step_22 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_23 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_25 f 10 11 rfl +
      (2048 : ℂ) * P27_step_26 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_1 f 9 10 rfl +
      (1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (1024 : ℂ) * P27_step_4 f 9 10 rfl +
      (1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (1024 : ℂ) * P27_step_7 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_10 f 9 10 rfl +
      (1024 : ℂ) * P27_step_11 f 9 10 rfl +
      (1024 : ℂ) * P27_step_13 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_17 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_22 f 9 10 rfl +
      (1024 : ℂ) * P27_step_23 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_1 f 8 9 rfl +
      (-512 : ℂ) * P27_step_2 f 8 9 rfl +
      (-512 : ℂ) * P27_step_5 f 8 9 rfl +
      (-512 : ℂ) * P27_step_7 f 8 9 rfl +
      (512 : ℂ) * P27_step_8 f 8 9 rfl +
      (-512 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_11 f 8 9 rfl +
      (-512 : ℂ) * P27_step_14 f 8 9 rfl +
      (512 : ℂ) * P27_step_16 f 8 9 rfl +
      (1024 : ℂ) * P27_step_17 f 8 9 rfl +
      (512 : ℂ) * P27_step_19 f 8 9 rfl +
      (1024 : ℂ) * P27_step_20 f 8 9 rfl +
      (-512 : ℂ) * P27_step_22 f 8 9 rfl +
      (512 : ℂ) * P27_step_25 f 8 9 rfl +
      (-1024 : ℂ) * P27_step_26 f 8 9 rfl +
      (-256 : ℂ) * P27_step_1 f 7 8 rfl +
      (256 : ℂ) * P27_step_2 f 7 8 rfl +
      (256 : ℂ) * P27_step_4 f 7 8 rfl +
      (-256 : ℂ) * P27_step_5 f 7 8 rfl +
      (-256 : ℂ) * P27_step_7 f 7 8 rfl +
      (-256 : ℂ) * P27_step_8 f 7 8 rfl +
      (512 : ℂ) * P27_step_10 f 7 8 rfl +
      (-512 : ℂ) * P27_step_13 f 7 8 rfl +
      (256 : ℂ) * P27_step_14 f 7 8 rfl +
      (-256 : ℂ) * P27_step_16 f 7 8 rfl +
      (-256 : ℂ) * P27_step_17 f 7 8 rfl +
      (-256 : ℂ) * P27_step_19 f 7 8 rfl +
      (-256 : ℂ) * P27_step_20 f 7 8 rfl +
      (512 : ℂ) * P27_step_22 f 7 8 rfl +
      (256 : ℂ) * P27_step_23 f 7 8 rfl +
      (512 : ℂ) * P27_step_26 f 7 8 rfl +
      (128 : ℂ) * P27_step_1 f 6 7 rfl +
      (128 : ℂ) * P27_step_2 f 6 7 rfl +
      (-128 : ℂ) * P27_step_4 f 6 7 rfl +
      (256 : ℂ) * P27_step_5 f 6 7 rfl +
      (128 : ℂ) * P27_step_7 f 6 7 rfl +
      (-128 : ℂ) * P27_step_10 f 6 7 rfl +
      (256 : ℂ) * P27_step_13 f 6 7 rfl +
      (-128 : ℂ) * P27_step_14 f 6 7 rfl +
      (-128 : ℂ) * P27_step_16 f 6 7 rfl +
      (-128 : ℂ) * P27_step_17 f 6 7 rfl +
      (-128 : ℂ) * P27_step_20 f 6 7 rfl +
      (-128 : ℂ) * P27_step_22 f 6 7 rfl +
      (-128 : ℂ) * P27_step_23 f 6 7 rfl +
      (128 : ℂ) * P27_step_25 f 6 7 rfl +
      (64 : ℂ) * P27_step_1 f 5 6 rfl +
      (-64 : ℂ) * P27_step_2 f 5 6 rfl +
      (-64 : ℂ) * P27_step_5 f 5 6 rfl +
      (-64 : ℂ) * P27_step_7 f 5 6 rfl +
      (-64 : ℂ) * P27_step_8 f 5 6 rfl +
      (-64 : ℂ) * P27_step_10 f 5 6 rfl +
      (64 : ℂ) * P27_step_14 f 5 6 rfl +
      (128 : ℂ) * P27_step_16 f 5 6 rfl +
      (64 : ℂ) * P27_step_17 f 5 6 rfl +
      (128 : ℂ) * P27_step_20 f 5 6 rfl +
      (-64 : ℂ) * P27_step_22 f 5 6 rfl +
      (-64 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_4 f 4 5 rfl +
      (-32 : ℂ) * P27_step_5 f 4 5 rfl +
      (32 : ℂ) * P27_step_7 f 4 5 rfl +
      (64 : ℂ) * P27_step_8 f 4 5 rfl +
      (64 : ℂ) * P27_step_10 f 4 5 rfl +
      (-32 : ℂ) * P27_step_11 f 4 5 rfl +
      (32 : ℂ) * P27_step_14 f 4 5 rfl +
      (-32 : ℂ) * P27_step_16 f 4 5 rfl +
      (-32 : ℂ) * P27_step_20 f 4 5 rfl +
      (32 : ℂ) * P27_step_22 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (32 : ℂ) * P27_step_4 f 3 4 rfl +
      (32 : ℂ) * P27_step_5 f 3 4 rfl +
      (16 : ℂ) * P27_step_7 f 3 4 rfl +
      (-16 : ℂ) * P27_step_8 f 3 4 rfl +
      (-16 : ℂ) * P27_step_10 f 3 4 rfl +
      (16 : ℂ) * P27_step_11 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (-16 : ℂ) * P27_step_14 f 3 4 rfl +
      (-16 : ℂ) * P27_step_16 f 3 4 rfl +
      (-16 : ℂ) * P27_step_17 f 3 4 rfl +
      (-16 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_26 f 3 4 rfl +
      (-8 : ℂ) * P27_step_4 f 2 3 rfl +
      (-8 : ℂ) * P27_step_5 f 2 3 rfl +
      (-8 : ℂ) * P27_step_7 f 2 3 rfl +
      (8 : ℂ) * P27_step_13 f 2 3 rfl +
      (16 : ℂ) * P27_step_16 f 2 3 rfl +
      (16 : ℂ) * P27_step_17 f 2 3 rfl +
      (8 : ℂ) * P27_step_19 f 2 3 rfl +
      (-8 : ℂ) * P27_step_22 f 2 3 rfl +
      (-8 : ℂ) * P27_step_23 f 2 3 rfl +
      (-8 : ℂ) * P27_step_26 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 1 2 rfl +
      (-4 : ℂ) * P27_step_16 f 1 2 rfl +
      (-4 : ℂ) * P27_step_17 f 1 2 rfl +
      (8 : ℂ) * P27_step_22 f 1 2 rfl +
      (4 : ℂ) * P27_step_23 f 1 2 rfl +
      (-4 : ℂ) * P27_step_25 f 1 2 rfl +
      (4 : ℂ) * P27_step_26 f 1 2 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl +
      (2 : ℂ) * P27_step_25 f 0 1 rfl +
      (-2 : ℂ) * P27_step_26 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_14 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 14 - 262144 * P_mod27C^[18] f 14 - P_mod27C^[1] f 14 +
      P_mod27C^[0] f 14 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_14 f 18 19 rfl +
      (131072 : ℂ) * P27_step_7 f 17 18 rfl +
      (131072 : ℂ) * P27_step_8 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_14 f 17 18 rfl +
      (65536 : ℂ) * P27_step_4 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_7 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_8 f 16 17 rfl +
      (65536 : ℂ) * P27_step_11 f 16 17 rfl +
      (65536 : ℂ) * P27_step_17 f 16 17 rfl +
      (65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_2 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_4 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_19 f 15 16 rfl +
      (32768 : ℂ) * P27_step_20 f 15 16 rfl +
      (32768 : ℂ) * P27_step_22 f 15 16 rfl +
      (16384 : ℂ) * P27_step_1 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_10 f 14 15 rfl +
      (16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_23 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (-8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (8192 : ℂ) * P27_step_8 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_20 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_23 f 13 14 rfl +
      (8192 : ℂ) * P27_step_25 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_26 f 13 14 rfl +
      (4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (4096 : ℂ) * P27_step_4 f 12 13 rfl +
      (4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_10 f 12 13 rfl +
      (4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_13 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_25 f 12 13 rfl +
      (8192 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_5 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (4096 : ℂ) * P27_step_8 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_10 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (4096 : ℂ) * P27_step_13 f 11 12 rfl +
      (2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (2048 : ℂ) * P27_step_4 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_5 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_8 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_13 f 10 11 rfl +
      (1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_16 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (2048 : ℂ) * P27_step_20 f 10 11 rfl +
      (1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (2048 : ℂ) * P27_step_26 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (-512 : ℂ) * P27_step_4 f 9 10 rfl +
      (512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-512 : ℂ) * P27_step_8 f 9 10 rfl +
      (1024 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_11 f 9 10 rfl +
      (1024 : ℂ) * P27_step_13 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_16 f 9 10 rfl +
      (512 : ℂ) * P27_step_17 f 9 10 rfl +
      (-512 : ℂ) * P27_step_19 f 9 10 rfl +
      (-512 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_22 f 9 10 rfl +
      (512 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (-512 : ℂ) * P27_step_26 f 9 10 rfl +
      (512 : ℂ) * P27_step_1 f 8 9 rfl +
      (-256 : ℂ) * P27_step_4 f 8 9 rfl +
      (512 : ℂ) * P27_step_5 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (-512 : ℂ) * P27_step_8 f 8 9 rfl +
      (-256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-256 : ℂ) * P27_step_11 f 8 9 rfl +
      (-256 : ℂ) * P27_step_13 f 8 9 rfl +
      (256 : ℂ) * P27_step_17 f 8 9 rfl +
      (-256 : ℂ) * P27_step_19 f 8 9 rfl +
      (512 : ℂ) * P27_step_20 f 8 9 rfl +
      (256 : ℂ) * P27_step_22 f 8 9 rfl +
      (-256 : ℂ) * P27_step_23 f 8 9 rfl +
      (256 : ℂ) * P27_step_25 f 8 9 rfl +
      (-128 : ℂ) * P27_step_2 f 7 8 rfl +
      (-256 : ℂ) * P27_step_4 f 7 8 rfl +
      (-128 : ℂ) * P27_step_5 f 7 8 rfl +
      (128 : ℂ) * P27_step_8 f 7 8 rfl +
      (256 : ℂ) * P27_step_10 f 7 8 rfl +
      (128 : ℂ) * P27_step_11 f 7 8 rfl +
      (256 : ℂ) * P27_step_14 f 7 8 rfl +
      (256 : ℂ) * P27_step_16 f 7 8 rfl +
      (-128 : ℂ) * P27_step_19 f 7 8 rfl +
      (-256 : ℂ) * P27_step_20 f 7 8 rfl +
      (128 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_23 f 7 8 rfl +
      (-128 : ℂ) * P27_step_25 f 7 8 rfl +
      (-64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 6 7 rfl +
      (64 : ℂ) * P27_step_4 f 6 7 rfl +
      (128 : ℂ) * P27_step_5 f 6 7 rfl +
      (128 : ℂ) * P27_step_7 f 6 7 rfl +
      (128 : ℂ) * P27_step_8 f 6 7 rfl +
      (-128 : ℂ) * P27_step_10 f 6 7 rfl +
      (128 : ℂ) * P27_step_11 f 6 7 rfl +
      (-64 : ℂ) * P27_step_16 f 6 7 rfl +
      (-128 : ℂ) * P27_step_17 f 6 7 rfl +
      (64 : ℂ) * P27_step_19 f 6 7 rfl +
      (-64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-64 : ℂ) * P27_step_23 f 6 7 rfl +
      (-64 : ℂ) * P27_step_25 f 6 7 rfl +
      (-32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (64 : ℂ) * P27_step_4 f 5 6 rfl +
      (-64 : ℂ) * P27_step_5 f 5 6 rfl +
      (-32 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_14 f 5 6 rfl +
      (64 : ℂ) * P27_step_16 f 5 6 rfl +
      (64 : ℂ) * P27_step_17 f 5 6 rfl +
      (64 : ℂ) * P27_step_19 f 5 6 rfl +
      (32 : ℂ) * P27_step_20 f 5 6 rfl +
      (-64 : ℂ) * P27_step_22 f 5 6 rfl +
      (32 : ℂ) * P27_step_23 f 5 6 rfl +
      (-32 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (32 : ℂ) * P27_step_2 f 4 5 rfl +
      (-16 : ℂ) * P27_step_5 f 4 5 rfl +
      (-16 : ℂ) * P27_step_7 f 4 5 rfl +
      (16 : ℂ) * P27_step_10 f 4 5 rfl +
      (-16 : ℂ) * P27_step_11 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (-16 : ℂ) * P27_step_14 f 4 5 rfl +
      (-32 : ℂ) * P27_step_16 f 4 5 rfl +
      (32 : ℂ) * P27_step_22 f 4 5 rfl +
      (32 : ℂ) * P27_step_23 f 4 5 rfl +
      (16 : ℂ) * P27_step_25 f 4 5 rfl +
      (16 : ℂ) * P27_step_1 f 3 4 rfl +
      (8 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_7 f 3 4 rfl +
      (-16 : ℂ) * P27_step_8 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (-8 : ℂ) * P27_step_16 f 3 4 rfl +
      (-8 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_25 f 3 4 rfl +
      (8 : ℂ) * P27_step_26 f 3 4 rfl +
      (4 : ℂ) * P27_step_2 f 2 3 rfl +
      (-8 : ℂ) * P27_step_4 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (4 : ℂ) * P27_step_13 f 2 3 rfl +
      (8 : ℂ) * P27_step_14 f 2 3 rfl +
      (4 : ℂ) * P27_step_16 f 2 3 rfl +
      (-4 : ℂ) * P27_step_17 f 2 3 rfl +
      (-4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_26 f 2 3 rfl +
      (2 : ℂ) * P27_step_1 f 1 2 rfl +
      (-4 : ℂ) * P27_step_2 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (4 : ℂ) * P27_step_7 f 1 2 rfl +
      (4 : ℂ) * P27_step_8 f 1 2 rfl +
      (2 : ℂ) * P27_step_13 f 1 2 rfl +
      (-2 : ℂ) * P27_step_22 f 1 2 rfl +
      (-2 : ℂ) * P27_step_25 f 1 2 rfl +
      (-2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_1 f 0 1 rfl +
      (2 : ℂ) * P27_step_4 f 0 1 rfl +
      (-1 : ℂ) * P27_step_13 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_15 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 15 - 262144 * P_mod27C^[18] f 15 - P_mod27C^[1] f 15 +
      P_mod27C^[0] f 15 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_15 f 18 19 rfl +
      (-262144 : ℂ) * P27_step_15 f 17 18 rfl +
      (131072 : ℂ) * P27_step_21 f 17 18 rfl +
      (131072 : ℂ) * P27_step_23 f 17 18 rfl +
      (65536 : ℂ) * P27_step_5 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_21 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_23 f 16 17 rfl +
      (65536 : ℂ) * P27_step_24 f 16 17 rfl +
      (65536 : ℂ) * P27_step_25 f 16 17 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_5 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_12 f 15 16 rfl +
      (32768 : ℂ) * P27_step_16 f 15 16 rfl +
      (32768 : ℂ) * P27_step_23 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_24 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_25 f 15 16 rfl +
      (65536 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (16384 : ℂ) * P27_step_5 f 14 15 rfl +
      (16384 : ℂ) * P27_step_6 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_12 f 14 15 rfl +
      (32768 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_16 f 14 15 rfl +
      (16384 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_23 f 14 15 rfl +
      (16384 : ℂ) * P27_step_25 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_3 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_5 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_6 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_8 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_16 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (24576 : ℂ) * P27_step_20 f 13 14 rfl +
      (8192 : ℂ) * P27_step_22 f 13 14 rfl +
      (16384 : ℂ) * P27_step_23 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_25 f 13 14 rfl +
      (8192 : ℂ) * P27_step_26 f 13 14 rfl +
      (4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_3 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_8 f 12 13 rfl +
      (12288 : ℂ) * P27_step_10 f 12 13 rfl +
      (4096 : ℂ) * P27_step_13 f 12 13 rfl +
      (4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_15 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_16 f 12 13 rfl +
      (8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_23 f 12 13 rfl +
      (8192 : ℂ) * P27_step_25 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (2048 : ℂ) * P27_step_4 f 11 12 rfl +
      (2048 : ℂ) * P27_step_5 f 11 12 rfl +
      (2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_8 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_13 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_15 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (2048 : ℂ) * P27_step_21 f 11 12 rfl +
      (4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_25 f 11 12 rfl +
      (4096 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_4 f 10 11 rfl +
      (3072 : ℂ) * P27_step_8 f 10 11 rfl +
      (2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (2048 : ℂ) * P27_step_13 f 10 11 rfl +
      (1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (1024 : ℂ) * P27_step_16 f 10 11 rfl +
      (1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_20 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_21 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_23 f 10 11 rfl +
      (1024 : ℂ) * P27_step_24 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_26 f 10 11 rfl +
      (512 : ℂ) * P27_step_1 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (1536 : ℂ) * P27_step_4 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_10 f 9 10 rfl +
      (512 : ℂ) * P27_step_11 f 9 10 rfl +
      (512 : ℂ) * P27_step_12 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_13 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (512 : ℂ) * P27_step_22 f 9 10 rfl +
      (1024 : ℂ) * P27_step_23 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_24 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (-512 : ℂ) * P27_step_1 f 8 9 rfl +
      (768 : ℂ) * P27_step_2 f 8 9 rfl +
      (-512 : ℂ) * P27_step_5 f 8 9 rfl +
      (256 : ℂ) * P27_step_6 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (-256 : ℂ) * P27_step_8 f 8 9 rfl +
      (512 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_12 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-512 : ℂ) * P27_step_16 f 8 9 rfl +
      (512 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_19 f 8 9 rfl +
      (-512 : ℂ) * P27_step_20 f 8 9 rfl +
      (512 : ℂ) * P27_step_25 f 8 9 rfl +
      (-256 : ℂ) * P27_step_26 f 8 9 rfl +
      (384 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (128 : ℂ) * P27_step_3 f 7 8 rfl +
      (-128 : ℂ) * P27_step_4 f 7 8 rfl +
      (-256 : ℂ) * P27_step_6 f 7 8 rfl +
      (128 : ℂ) * P27_step_7 f 7 8 rfl +
      (-384 : ℂ) * P27_step_8 f 7 8 rfl +
      (-256 : ℂ) * P27_step_10 f 7 8 rfl +
      (-128 : ℂ) * P27_step_11 f 7 8 rfl +
      (-128 : ℂ) * P27_step_13 f 7 8 rfl +
      (-256 : ℂ) * P27_step_14 f 7 8 rfl +
      (-256 : ℂ) * P27_step_16 f 7 8 rfl +
      (256 : ℂ) * P27_step_20 f 7 8 rfl +
      (256 : ℂ) * P27_step_22 f 7 8 rfl +
      (256 : ℂ) * P27_step_23 f 7 8 rfl +
      (256 : ℂ) * P27_step_26 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-128 : ℂ) * P27_step_3 f 6 7 rfl +
      (-192 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_5 f 6 7 rfl +
      (-128 : ℂ) * P27_step_7 f 6 7 rfl +
      (-128 : ℂ) * P27_step_8 f 6 7 rfl +
      (128 : ℂ) * P27_step_10 f 6 7 rfl +
      (64 : ℂ) * P27_step_11 f 6 7 rfl +
      (128 : ℂ) * P27_step_13 f 6 7 rfl +
      (192 : ℂ) * P27_step_14 f 6 7 rfl +
      (64 : ℂ) * P27_step_15 f 6 7 rfl +
      (192 : ℂ) * P27_step_17 f 6 7 rfl +
      (-64 : ℂ) * P27_step_19 f 6 7 rfl +
      (-64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-128 : ℂ) * P27_step_23 f 6 7 rfl +
      (128 : ℂ) * P27_step_25 f 6 7 rfl +
      (-64 : ℂ) * P27_step_26 f 6 7 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (-64 : ℂ) * P27_step_4 f 5 6 rfl +
      (96 : ℂ) * P27_step_7 f 5 6 rfl +
      (-32 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_13 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (-64 : ℂ) * P27_step_15 f 5 6 rfl +
      (-32 : ℂ) * P27_step_16 f 5 6 rfl +
      (-64 : ℂ) * P27_step_17 f 5 6 rfl +
      (32 : ℂ) * P27_step_19 f 5 6 rfl +
      (32 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_21 f 5 6 rfl +
      (96 : ℂ) * P27_step_22 f 5 6 rfl +
      (-64 : ℂ) * P27_step_25 f 5 6 rfl +
      (64 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_2 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (16 : ℂ) * P27_step_10 f 4 5 rfl +
      (48 : ℂ) * P27_step_11 f 4 5 rfl +
      (32 : ℂ) * P27_step_13 f 4 5 rfl +
      (48 : ℂ) * P27_step_17 f 4 5 rfl +
      (-16 : ℂ) * P27_step_20 f 4 5 rfl +
      (-32 : ℂ) * P27_step_21 f 4 5 rfl +
      (-32 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (16 : ℂ) * P27_step_24 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (-16 : ℂ) * P27_step_1 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_8 f 3 4 rfl +
      (-8 : ℂ) * P27_step_10 f 3 4 rfl +
      (-8 : ℂ) * P27_step_11 f 3 4 rfl +
      (8 : ℂ) * P27_step_12 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (8 : ℂ) * P27_step_17 f 3 4 rfl +
      (24 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_20 f 3 4 rfl +
      (24 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-16 : ℂ) * P27_step_24 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-4 : ℂ) * P27_step_4 f 2 3 rfl +
      (4 : ℂ) * P27_step_6 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (8 : ℂ) * P27_step_10 f 2 3 rfl +
      (8 : ℂ) * P27_step_11 f 2 3 rfl +
      (-8 : ℂ) * P27_step_12 f 2 3 rfl +
      (4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_17 f 2 3 rfl +
      (-4 : ℂ) * P27_step_19 f 2 3 rfl +
      (-4 : ℂ) * P27_step_20 f 2 3 rfl +
      (4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (2 : ℂ) * P27_step_3 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (-4 : ℂ) * P27_step_6 f 1 2 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (-2 : ℂ) * P27_step_10 f 1 2 rfl +
      (4 : ℂ) * P27_step_19 f 1 2 rfl +
      (4 : ℂ) * P27_step_20 f 1 2 rfl +
      (2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_3 f 0 1 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (2 : ℂ) * P27_step_10 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_16 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 16 - 262144 * P_mod27C^[18] f 16 - P_mod27C^[1] f 16 +
      P_mod27C^[0] f 16 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_16 f 18 19 rfl +
      (131072 : ℂ) * P27_step_8 f 17 18 rfl +
      (131072 : ℂ) * P27_step_11 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_16 f 17 18 rfl +
      (65536 : ℂ) * P27_step_4 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_8 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_11 f 16 17 rfl +
      (65536 : ℂ) * P27_step_17 f 16 17 rfl +
      (65536 : ℂ) * P27_step_19 f 16 17 rfl +
      (65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (65536 : ℂ) * P27_step_2 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_4 f 15 16 rfl +
      (32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_17 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_19 f 15 16 rfl +
      (32768 : ℂ) * P27_step_20 f 15 16 rfl +
      (32768 : ℂ) * P27_step_22 f 15 16 rfl +
      (32768 : ℂ) * P27_step_23 f 15 16 rfl +
      (32768 : ℂ) * P27_step_1 f 14 15 rfl +
      (-65536 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (16384 : ℂ) * P27_step_10 f 14 15 rfl +
      (16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (49152 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_22 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_23 f 14 15 rfl +
      (16384 : ℂ) * P27_step_25 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_1 f 13 14 rfl +
      (24576 : ℂ) * P27_step_2 f 13 14 rfl +
      (8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (16384 : ℂ) * P27_step_14 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_17 f 13 14 rfl +
      (8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (24576 : ℂ) * P27_step_22 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_25 f 13 14 rfl +
      (24576 : ℂ) * P27_step_26 f 13 14 rfl +
      (12288 : ℂ) * P27_step_1 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (8192 : ℂ) * P27_step_7 f 12 13 rfl +
      (12288 : ℂ) * P27_step_8 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (12288 : ℂ) * P27_step_13 f 12 13 rfl +
      (-16384 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_22 f 12 13 rfl +
      (4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_26 f 12 13 rfl +
      (-2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (6144 : ℂ) * P27_step_4 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_5 f 11 12 rfl +
      (-8192 : ℂ) * P27_step_7 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_8 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_13 f 11 12 rfl +
      (6144 : ℂ) * P27_step_14 f 11 12 rfl +
      (2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (4096 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (4096 : ℂ) * P27_step_20 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (3072 : ℂ) * P27_step_2 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_4 f 10 11 rfl +
      (3072 : ℂ) * P27_step_7 f 10 11 rfl +
      (1024 : ℂ) * P27_step_8 f 10 11 rfl +
      (2048 : ℂ) * P27_step_10 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_16 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_20 f 10 11 rfl +
      (2048 : ℂ) * P27_step_22 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (2048 : ℂ) * P27_step_26 f 10 11 rfl +
      (1536 : ℂ) * P27_step_1 f 9 10 rfl +
      (512 : ℂ) * P27_step_4 f 9 10 rfl +
      (1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (-512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_8 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_10 f 9 10 rfl +
      (1024 : ℂ) * P27_step_11 f 9 10 rfl +
      (1024 : ℂ) * P27_step_13 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (512 : ℂ) * P27_step_17 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (512 : ℂ) * P27_step_20 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_22 f 9 10 rfl +
      (512 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (-512 : ℂ) * P27_step_26 f 9 10 rfl +
      (-256 : ℂ) * P27_step_2 f 8 9 rfl +
      (-512 : ℂ) * P27_step_4 f 8 9 rfl +
      (-768 : ℂ) * P27_step_5 f 8 9 rfl +
      (-512 : ℂ) * P27_step_7 f 8 9 rfl +
      (256 : ℂ) * P27_step_8 f 8 9 rfl +
      (256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-768 : ℂ) * P27_step_11 f 8 9 rfl +
      (-256 : ℂ) * P27_step_13 f 8 9 rfl +
      (768 : ℂ) * P27_step_14 f 8 9 rfl +
      (512 : ℂ) * P27_step_16 f 8 9 rfl +
      (512 : ℂ) * P27_step_17 f 8 9 rfl +
      (512 : ℂ) * P27_step_19 f 8 9 rfl +
      (512 : ℂ) * P27_step_20 f 8 9 rfl +
      (256 : ℂ) * P27_step_22 f 8 9 rfl +
      (-512 : ℂ) * P27_step_23 f 8 9 rfl +
      (256 : ℂ) * P27_step_25 f 8 9 rfl +
      (-256 : ℂ) * P27_step_26 f 8 9 rfl +
      (-128 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (128 : ℂ) * P27_step_4 f 7 8 rfl +
      (128 : ℂ) * P27_step_5 f 7 8 rfl +
      (384 : ℂ) * P27_step_7 f 7 8 rfl +
      (256 : ℂ) * P27_step_10 f 7 8 rfl +
      (256 : ℂ) * P27_step_11 f 7 8 rfl +
      (-128 : ℂ) * P27_step_13 f 7 8 rfl +
      (-384 : ℂ) * P27_step_16 f 7 8 rfl +
      (-512 : ℂ) * P27_step_17 f 7 8 rfl +
      (-384 : ℂ) * P27_step_19 f 7 8 rfl +
      (-384 : ℂ) * P27_step_20 f 7 8 rfl +
      (256 : ℂ) * P27_step_22 f 7 8 rfl +
      (256 : ℂ) * P27_step_23 f 7 8 rfl +
      (-256 : ℂ) * P27_step_25 f 7 8 rfl +
      (384 : ℂ) * P27_step_26 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 6 7 rfl +
      (128 : ℂ) * P27_step_5 f 6 7 rfl +
      (-192 : ℂ) * P27_step_10 f 6 7 rfl +
      (192 : ℂ) * P27_step_13 f 6 7 rfl +
      (-64 : ℂ) * P27_step_14 f 6 7 rfl +
      (64 : ℂ) * P27_step_16 f 6 7 rfl +
      (192 : ℂ) * P27_step_17 f 6 7 rfl +
      (128 : ℂ) * P27_step_19 f 6 7 rfl +
      (64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-256 : ℂ) * P27_step_22 f 6 7 rfl +
      (-192 : ℂ) * P27_step_23 f 6 7 rfl +
      (128 : ℂ) * P27_step_25 f 6 7 rfl +
      (-192 : ℂ) * P27_step_26 f 6 7 rfl +
      (-32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-96 : ℂ) * P27_step_5 f 5 6 rfl +
      (-32 : ℂ) * P27_step_7 f 5 6 rfl +
      (-32 : ℂ) * P27_step_8 f 5 6 rfl +
      (32 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_11 f 5 6 rfl +
      (-96 : ℂ) * P27_step_13 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (64 : ℂ) * P27_step_16 f 5 6 rfl +
      (64 : ℂ) * P27_step_20 f 5 6 rfl +
      (96 : ℂ) * P27_step_22 f 5 6 rfl +
      (64 : ℂ) * P27_step_23 f 5 6 rfl +
      (-96 : ℂ) * P27_step_25 f 5 6 rfl +
      (64 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_4 f 4 5 rfl +
      (16 : ℂ) * P27_step_5 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (32 : ℂ) * P27_step_8 f 4 5 rfl +
      (32 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (32 : ℂ) * P27_step_13 f 4 5 rfl +
      (-16 : ℂ) * P27_step_14 f 4 5 rfl +
      (-48 : ℂ) * P27_step_16 f 4 5 rfl +
      (-16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-48 : ℂ) * P27_step_20 f 4 5 rfl +
      (32 : ℂ) * P27_step_25 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (16 : ℂ) * P27_step_4 f 3 4 rfl +
      (16 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_7 f 3 4 rfl +
      (-24 : ℂ) * P27_step_8 f 3 4 rfl +
      (-24 : ℂ) * P27_step_10 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (8 : ℂ) * P27_step_16 f 3 4 rfl +
      (-8 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (24 : ℂ) * P27_step_20 f 3 4 rfl +
      (-8 : ℂ) * P27_step_23 f 3 4 rfl +
      (16 : ℂ) * P27_step_26 f 3 4 rfl +
      (-12 : ℂ) * P27_step_4 f 2 3 rfl +
      (-12 : ℂ) * P27_step_5 f 2 3 rfl +
      (8 : ℂ) * P27_step_8 f 2 3 rfl +
      (12 : ℂ) * P27_step_10 f 2 3 rfl +
      (8 : ℂ) * P27_step_13 f 2 3 rfl +
      (8 : ℂ) * P27_step_16 f 2 3 rfl +
      (8 : ℂ) * P27_step_17 f 2 3 rfl +
      (-8 : ℂ) * P27_step_20 f 2 3 rfl +
      (-4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (-4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-8 : ℂ) * P27_step_26 f 2 3 rfl +
      (4 : ℂ) * P27_step_4 f 1 2 rfl +
      (6 : ℂ) * P27_step_5 f 1 2 rfl +
      (-4 : ℂ) * P27_step_10 f 1 2 rfl +
      (-4 : ℂ) * P27_step_13 f 1 2 rfl +
      (-6 : ℂ) * P27_step_16 f 1 2 rfl +
      (-4 : ℂ) * P27_step_17 f 1 2 rfl +
      (4 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_5 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (2 : ℂ) * P27_step_16 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_17 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 17 - 262144 * P_mod27C^[18] f 17 - P_mod27C^[1] f 17 +
      P_mod27C^[0] f 17 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_17 f 18 19 rfl +
      (-262144 : ℂ) * P27_step_17 f 17 18 rfl +
      (131072 : ℂ) * P27_step_22 f 17 18 rfl +
      (131072 : ℂ) * P27_step_26 f 17 18 rfl +
      (65536 : ℂ) * P27_step_11 f 16 17 rfl +
      (65536 : ℂ) * P27_step_13 f 16 17 rfl +
      (65536 : ℂ) * P27_step_20 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_22 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_10 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_11 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (65536 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_19 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (32768 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_5 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_17 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_19 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (32768 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_23 f 14 15 rfl +
      (16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (16384 : ℂ) * P27_step_1 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_2 f 13 14 rfl +
      (16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (16384 : ℂ) * P27_step_11 f 13 14 rfl +
      (8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_16 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_22 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_23 f 13 14 rfl +
      (8192 : ℂ) * P27_step_25 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_26 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_1 f 12 13 rfl +
      (8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_8 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_13 f 12 13 rfl +
      (8192 : ℂ) * P27_step_14 f 12 13 rfl +
      (8192 : ℂ) * P27_step_19 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_25 f 12 13 rfl +
      (8192 : ℂ) * P27_step_26 f 12 13 rfl +
      (4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_4 f 11 12 rfl +
      (4096 : ℂ) * P27_step_7 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_11 f 11 12 rfl +
      (4096 : ℂ) * P27_step_13 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_14 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (4096 : ℂ) * P27_step_23 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_2 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_7 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_8 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (2048 : ℂ) * P27_step_17 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_19 f 10 11 rfl +
      (3072 : ℂ) * P27_step_20 f 10 11 rfl +
      (2048 : ℂ) * P27_step_25 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (-512 : ℂ) * P27_step_1 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_4 f 9 10 rfl +
      (1536 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_13 f 9 10 rfl +
      (1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (1024 : ℂ) * P27_step_22 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (768 : ℂ) * P27_step_5 f 8 9 rfl +
      (512 : ℂ) * P27_step_7 f 8 9 rfl +
      (-512 : ℂ) * P27_step_10 f 8 9 rfl +
      (512 : ℂ) * P27_step_11 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (-256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-512 : ℂ) * P27_step_17 f 8 9 rfl +
      (-512 : ℂ) * P27_step_20 f 8 9 rfl +
      (-512 : ℂ) * P27_step_25 f 8 9 rfl +
      (256 : ℂ) * P27_step_26 f 8 9 rfl +
      (-256 : ℂ) * P27_step_2 f 7 8 rfl +
      (-256 : ℂ) * P27_step_5 f 7 8 rfl +
      (-128 : ℂ) * P27_step_7 f 7 8 rfl +
      (256 : ℂ) * P27_step_8 f 7 8 rfl +
      (-256 : ℂ) * P27_step_10 f 7 8 rfl +
      (128 : ℂ) * P27_step_13 f 7 8 rfl +
      (384 : ℂ) * P27_step_16 f 7 8 rfl +
      (256 : ℂ) * P27_step_17 f 7 8 rfl +
      (256 : ℂ) * P27_step_19 f 7 8 rfl +
      (256 : ℂ) * P27_step_20 f 7 8 rfl +
      (-256 : ℂ) * P27_step_22 f 7 8 rfl +
      (-384 : ℂ) * P27_step_26 f 7 8 rfl +
      (-128 : ℂ) * P27_step_1 f 6 7 rfl +
      (128 : ℂ) * P27_step_4 f 6 7 rfl +
      (-128 : ℂ) * P27_step_5 f 6 7 rfl +
      (64 : ℂ) * P27_step_8 f 6 7 rfl +
      (128 : ℂ) * P27_step_10 f 6 7 rfl +
      (-192 : ℂ) * P27_step_13 f 6 7 rfl +
      (-128 : ℂ) * P27_step_16 f 6 7 rfl +
      (-64 : ℂ) * P27_step_17 f 6 7 rfl +
      (128 : ℂ) * P27_step_22 f 6 7 rfl +
      (128 : ℂ) * P27_step_23 f 6 7 rfl +
      (64 : ℂ) * P27_step_26 f 6 7 rfl +
      (64 : ℂ) * P27_step_2 f 5 6 rfl +
      (32 : ℂ) * P27_step_4 f 5 6 rfl +
      (64 : ℂ) * P27_step_5 f 5 6 rfl +
      (-64 : ℂ) * P27_step_8 f 5 6 rfl +
      (32 : ℂ) * P27_step_13 f 5 6 rfl +
      (-64 : ℂ) * P27_step_14 f 5 6 rfl +
      (-64 : ℂ) * P27_step_16 f 5 6 rfl +
      (-64 : ℂ) * P27_step_20 f 5 6 rfl +
      (-32 : ℂ) * P27_step_22 f 5 6 rfl +
      (64 : ℂ) * P27_step_25 f 5 6 rfl +
      (32 : ℂ) * P27_step_26 f 5 6 rfl +
      (32 : ℂ) * P27_step_1 f 4 5 rfl +
      (16 : ℂ) * P27_step_2 f 4 5 rfl +
      (-32 : ℂ) * P27_step_4 f 4 5 rfl +
      (-32 : ℂ) * P27_step_7 f 4 5 rfl +
      (-32 : ℂ) * P27_step_8 f 4 5 rfl +
      (-32 : ℂ) * P27_step_10 f 4 5 rfl +
      (-16 : ℂ) * P27_step_11 f 4 5 rfl +
      (16 : ℂ) * P27_step_13 f 4 5 rfl +
      (32 : ℂ) * P27_step_16 f 4 5 rfl +
      (32 : ℂ) * P27_step_20 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (8 : ℂ) * P27_step_1 f 3 4 rfl +
      (-16 : ℂ) * P27_step_2 f 3 4 rfl +
      (-16 : ℂ) * P27_step_4 f 3 4 rfl +
      (-16 : ℂ) * P27_step_5 f 3 4 rfl +
      (16 : ℂ) * P27_step_8 f 3 4 rfl +
      (16 : ℂ) * P27_step_10 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (16 : ℂ) * P27_step_14 f 3 4 rfl +
      (-8 : ℂ) * P27_step_19 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-8 : ℂ) * P27_step_1 f 2 3 rfl +
      (8 : ℂ) * P27_step_4 f 2 3 rfl +
      (8 : ℂ) * P27_step_5 f 2 3 rfl +
      (8 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (4 : ℂ) * P27_step_14 f 2 3 rfl +
      (-8 : ℂ) * P27_step_16 f 2 3 rfl +
      (-8 : ℂ) * P27_step_17 f 2 3 rfl +
      (-4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_26 f 2 3 rfl +
      (2 : ℂ) * P27_step_7 f 1 2 rfl +
      (2 : ℂ) * P27_step_13 f 1 2 rfl +
      (-4 : ℂ) * P27_step_14 f 1 2 rfl +
      (4 : ℂ) * P27_step_16 f 1 2 rfl +
      (4 : ℂ) * P27_step_17 f 1 2 rfl +
      (-4 : ℂ) * P27_step_22 f 1 2 rfl +
      (-2 : ℂ) * P27_step_25 f 1 2 rfl +
      (-2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_7 f 0 1 rfl +
      (-1 : ℂ) * P27_step_13 f 0 1 rfl +
      (2 : ℂ) * P27_step_22 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_18 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 18 - 262144 * P_mod27C^[18] f 18 - P_mod27C^[1] f 18 +
      P_mod27C^[0] f 18 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_18 f 18 19 rfl +
      (131072 : ℂ) * P27_step_9 f 17 18 rfl +
      (131072 : ℂ) * P27_step_14 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_18 f 17 18 rfl +
      (65536 : ℂ) * P27_step_7 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_9 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_14 f 16 17 rfl +
      (65536 : ℂ) * P27_step_18 f 16 17 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_7 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_9 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_14 f 15 16 rfl +
      (32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_18 f 15 16 rfl +
      (32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_7 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_9 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_14 f 14 15 rfl +
      (16384 : ℂ) * P27_step_18 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_7 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_8 f 13 14 rfl +
      (8192 : ℂ) * P27_step_9 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_18 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (-4096 : ℂ) * P27_step_4 f 12 13 rfl +
      (4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_9 f 12 13 rfl +
      (8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (4096 : ℂ) * P27_step_18 f 12 13 rfl +
      (4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (4096 : ℂ) * P27_step_5 f 11 12 rfl +
      (2048 : ℂ) * P27_step_9 f 11 12 rfl +
      (2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_18 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_20 f 11 12 rfl +
      (2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (1024 : ℂ) * P27_step_5 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (2048 : ℂ) * P27_step_8 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_9 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_10 f 10 11 rfl +
      (1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (2048 : ℂ) * P27_step_16 f 10 11 rfl +
      (1024 : ℂ) * P27_step_18 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_20 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (1024 : ℂ) * P27_step_4 f 9 10 rfl +
      (-512 : ℂ) * P27_step_5 f 9 10 rfl +
      (-512 : ℂ) * P27_step_7 f 9 10 rfl +
      (512 : ℂ) * P27_step_8 f 9 10 rfl +
      (512 : ℂ) * P27_step_9 f 9 10 rfl +
      (-512 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_13 f 9 10 rfl +
      (512 : ℂ) * P27_step_16 f 9 10 rfl +
      (-512 : ℂ) * P27_step_17 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_18 f 9 10 rfl +
      (512 : ℂ) * P27_step_19 f 9 10 rfl +
      (512 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (512 : ℂ) * P27_step_2 f 8 9 rfl +
      (256 : ℂ) * P27_step_4 f 8 9 rfl +
      (-256 : ℂ) * P27_step_5 f 8 9 rfl +
      (-512 : ℂ) * P27_step_9 f 8 9 rfl +
      (256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-256 : ℂ) * P27_step_11 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (-256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-256 : ℂ) * P27_step_16 f 8 9 rfl +
      (256 : ℂ) * P27_step_18 f 8 9 rfl +
      (-256 : ℂ) * P27_step_22 f 8 9 rfl +
      (256 : ℂ) * P27_step_23 f 8 9 rfl +
      (256 : ℂ) * P27_step_1 f 7 8 rfl +
      (256 : ℂ) * P27_step_2 f 7 8 rfl +
      (128 : ℂ) * P27_step_5 f 7 8 rfl +
      (-128 : ℂ) * P27_step_7 f 7 8 rfl +
      (-256 : ℂ) * P27_step_8 f 7 8 rfl +
      (128 : ℂ) * P27_step_9 f 7 8 rfl +
      (-256 : ℂ) * P27_step_11 f 7 8 rfl +
      (-128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-128 : ℂ) * P27_step_16 f 7 8 rfl +
      (128 : ℂ) * P27_step_17 f 7 8 rfl +
      (-256 : ℂ) * P27_step_18 f 7 8 rfl +
      (-128 : ℂ) * P27_step_19 f 7 8 rfl +
      (256 : ℂ) * P27_step_20 f 7 8 rfl +
      (128 : ℂ) * P27_step_25 f 7 8 rfl +
      (128 : ℂ) * P27_step_1 f 6 7 rfl +
      (64 : ℂ) * P27_step_2 f 6 7 rfl +
      (-128 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-64 : ℂ) * P27_step_8 f 6 7 rfl +
      (-128 : ℂ) * P27_step_9 f 6 7 rfl +
      (128 : ℂ) * P27_step_10 f 6 7 rfl +
      (-64 : ℂ) * P27_step_11 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (64 : ℂ) * P27_step_16 f 6 7 rfl +
      (64 : ℂ) * P27_step_17 f 6 7 rfl +
      (64 : ℂ) * P27_step_18 f 6 7 rfl +
      (-128 : ℂ) * P27_step_19 f 6 7 rfl +
      (64 : ℂ) * P27_step_22 f 6 7 rfl +
      (-64 : ℂ) * P27_step_23 f 6 7 rfl +
      (32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-32 : ℂ) * P27_step_4 f 5 6 rfl +
      (64 : ℂ) * P27_step_5 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (32 : ℂ) * P27_step_8 f 5 6 rfl +
      (32 : ℂ) * P27_step_9 f 5 6 rfl +
      (32 : ℂ) * P27_step_11 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_17 f 5 6 rfl +
      (-64 : ℂ) * P27_step_18 f 5 6 rfl +
      (-32 : ℂ) * P27_step_19 f 5 6 rfl +
      (-32 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_22 f 5 6 rfl +
      (-64 : ℂ) * P27_step_23 f 5 6 rfl +
      (-32 : ℂ) * P27_step_25 f 5 6 rfl +
      (-16 : ℂ) * P27_step_2 f 4 5 rfl +
      (16 : ℂ) * P27_step_4 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (16 : ℂ) * P27_step_8 f 4 5 rfl +
      (-32 : ℂ) * P27_step_9 f 4 5 rfl +
      (-16 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (32 : ℂ) * P27_step_16 f 4 5 rfl +
      (16 : ℂ) * P27_step_17 f 4 5 rfl +
      (16 : ℂ) * P27_step_18 f 4 5 rfl +
      (16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-16 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-32 : ℂ) * P27_step_25 f 4 5 rfl +
      (-16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-8 : ℂ) * P27_step_1 f 3 4 rfl +
      (8 : ℂ) * P27_step_2 f 3 4 rfl +
      (8 : ℂ) * P27_step_4 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (8 : ℂ) * P27_step_8 f 3 4 rfl +
      (8 : ℂ) * P27_step_9 f 3 4 rfl +
      (-8 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (8 : ℂ) * P27_step_17 f 3 4 rfl +
      (-16 : ℂ) * P27_step_18 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (8 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (4 : ℂ) * P27_step_1 f 2 3 rfl +
      (4 : ℂ) * P27_step_2 f 2 3 rfl +
      (4 : ℂ) * P27_step_4 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (-8 : ℂ) * P27_step_9 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_17 f 2 3 rfl +
      (4 : ℂ) * P27_step_18 f 2 3 rfl +
      (4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (2 : ℂ) * P27_step_1 f 1 2 rfl +
      (4 : ℂ) * P27_step_2 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (2 : ℂ) * P27_step_9 f 1 2 rfl +
      (-4 : ℂ) * P27_step_18 f 1 2 rfl +
      (2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (2 : ℂ) * P27_step_1 f 0 1 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (-2 : ℂ) * P27_step_9 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_19 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 19 - 262144 * P_mod27C^[18] f 19 - P_mod27C^[1] f 19 +
      P_mod27C^[0] f 19 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_19 f 18 19 rfl +
      (131072 : ℂ) * P27_step_2 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_19 f 17 18 rfl +
      (131072 : ℂ) * P27_step_23 f 17 18 rfl +
      (65536 : ℂ) * P27_step_1 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_2 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (65536 : ℂ) * P27_step_17 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_23 f 16 17 rfl +
      (65536 : ℂ) * P27_step_25 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_1 f 15 16 rfl +
      (32768 : ℂ) * P27_step_2 f 15 16 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_14 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_22 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_25 f 15 16 rfl +
      (98304 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_1 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_4 f 14 15 rfl +
      (16384 : ℂ) * P27_step_7 f 14 15 rfl +
      (16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (49152 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_14 f 14 15 rfl +
      (32768 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_22 f 14 15 rfl +
      (-49152 : ℂ) * P27_step_26 f 14 15 rfl +
      (-8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_7 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (16384 : ℂ) * P27_step_22 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (8192 : ℂ) * P27_step_8 f 12 13 rfl +
      (8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (4096 : ℂ) * P27_step_4 f 11 12 rfl +
      (4096 : ℂ) * P27_step_5 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_10 f 11 12 rfl +
      (6144 : ℂ) * P27_step_11 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_20 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_5 f 10 11 rfl +
      (3072 : ℂ) * P27_step_8 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_10 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (2048 : ℂ) * P27_step_16 f 10 11 rfl +
      (3072 : ℂ) * P27_step_19 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_20 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (512 : ℂ) * P27_step_2 f 9 10 rfl +
      (1536 : ℂ) * P27_step_4 f 9 10 rfl +
      (-512 : ℂ) * P27_step_5 f 9 10 rfl +
      (512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-512 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_13 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_16 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_17 f 9 10 rfl +
      (-512 : ℂ) * P27_step_19 f 9 10 rfl +
      (512 : ℂ) * P27_step_20 f 9 10 rfl +
      (1536 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (256 : ℂ) * P27_step_1 f 8 9 rfl +
      (256 : ℂ) * P27_step_2 f 8 9 rfl +
      (-256 : ℂ) * P27_step_5 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (-512 : ℂ) * P27_step_8 f 8 9 rfl +
      (256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_11 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (-256 : ℂ) * P27_step_16 f 8 9 rfl +
      (768 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_20 f 8 9 rfl +
      (-512 : ℂ) * P27_step_22 f 8 9 rfl +
      (-256 : ℂ) * P27_step_23 f 8 9 rfl +
      (768 : ℂ) * P27_step_25 f 8 9 rfl +
      (-256 : ℂ) * P27_step_26 f 8 9 rfl +
      (128 : ℂ) * P27_step_1 f 7 8 rfl +
      (256 : ℂ) * P27_step_2 f 7 8 rfl +
      (-256 : ℂ) * P27_step_4 f 7 8 rfl +
      (128 : ℂ) * P27_step_5 f 7 8 rfl +
      (-384 : ℂ) * P27_step_8 f 7 8 rfl +
      (128 : ℂ) * P27_step_10 f 7 8 rfl +
      (-128 : ℂ) * P27_step_11 f 7 8 rfl +
      (-128 : ℂ) * P27_step_13 f 7 8 rfl +
      (128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-128 : ℂ) * P27_step_16 f 7 8 rfl +
      (-128 : ℂ) * P27_step_17 f 7 8 rfl +
      (-256 : ℂ) * P27_step_19 f 7 8 rfl +
      (384 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_25 f 7 8 rfl +
      (384 : ℂ) * P27_step_26 f 7 8 rfl +
      (128 : ℂ) * P27_step_1 f 6 7 rfl +
      (-128 : ℂ) * P27_step_2 f 6 7 rfl +
      (-192 : ℂ) * P27_step_4 f 6 7 rfl +
      (64 : ℂ) * P27_step_5 f 6 7 rfl +
      (64 : ℂ) * P27_step_7 f 6 7 rfl +
      (64 : ℂ) * P27_step_8 f 6 7 rfl +
      (64 : ℂ) * P27_step_11 f 6 7 rfl +
      (192 : ℂ) * P27_step_13 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (64 : ℂ) * P27_step_16 f 6 7 rfl +
      (64 : ℂ) * P27_step_17 f 6 7 rfl +
      (-64 : ℂ) * P27_step_19 f 6 7 rfl +
      (-64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-64 : ℂ) * P27_step_22 f 6 7 rfl +
      (-128 : ℂ) * P27_step_23 f 6 7 rfl +
      (-128 : ℂ) * P27_step_26 f 6 7 rfl +
      (-64 : ℂ) * P27_step_1 f 5 6 rfl +
      (-64 : ℂ) * P27_step_2 f 5 6 rfl +
      (32 : ℂ) * P27_step_4 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (32 : ℂ) * P27_step_8 f 5 6 rfl +
      (-32 : ℂ) * P27_step_10 f 5 6 rfl +
      (32 : ℂ) * P27_step_11 f 5 6 rfl +
      (-64 : ℂ) * P27_step_13 f 5 6 rfl +
      (64 : ℂ) * P27_step_14 f 5 6 rfl +
      (32 : ℂ) * P27_step_16 f 5 6 rfl +
      (-32 : ℂ) * P27_step_17 f 5 6 rfl +
      (32 : ℂ) * P27_step_19 f 5 6 rfl +
      (64 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_22 f 5 6 rfl +
      (-32 : ℂ) * P27_step_23 f 5 6 rfl +
      (-64 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_1 f 4 5 rfl +
      (-16 : ℂ) * P27_step_2 f 4 5 rfl +
      (16 : ℂ) * P27_step_4 f 4 5 rfl +
      (-16 : ℂ) * P27_step_5 f 4 5 rfl +
      (32 : ℂ) * P27_step_7 f 4 5 rfl +
      (32 : ℂ) * P27_step_8 f 4 5 rfl +
      (32 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (-32 : ℂ) * P27_step_14 f 4 5 rfl +
      (32 : ℂ) * P27_step_17 f 4 5 rfl +
      (16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-32 : ℂ) * P27_step_20 f 4 5 rfl +
      (-16 : ℂ) * P27_step_22 f 4 5 rfl +
      (16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-16 : ℂ) * P27_step_25 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (-8 : ℂ) * P27_step_1 f 3 4 rfl +
      (16 : ℂ) * P27_step_2 f 3 4 rfl +
      (16 : ℂ) * P27_step_4 f 3 4 rfl +
      (16 : ℂ) * P27_step_5 f 3 4 rfl +
      (-16 : ℂ) * P27_step_7 f 3 4 rfl +
      (-16 : ℂ) * P27_step_8 f 3 4 rfl +
      (-16 : ℂ) * P27_step_10 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (-16 : ℂ) * P27_step_14 f 3 4 rfl +
      (-8 : ℂ) * P27_step_16 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (8 : ℂ) * P27_step_25 f 3 4 rfl +
      (8 : ℂ) * P27_step_26 f 3 4 rfl +
      (8 : ℂ) * P27_step_1 f 2 3 rfl +
      (-8 : ℂ) * P27_step_4 f 2 3 rfl +
      (-8 : ℂ) * P27_step_5 f 2 3 rfl +
      (-8 : ℂ) * P27_step_7 f 2 3 rfl +
      (4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-4 : ℂ) * P27_step_14 f 2 3 rfl +
      (8 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-2 : ℂ) * P27_step_7 f 1 2 rfl +
      (2 : ℂ) * P27_step_11 f 1 2 rfl +
      (4 : ℂ) * P27_step_14 f 1 2 rfl +
      (-4 : ℂ) * P27_step_16 f 1 2 rfl +
      (-4 : ℂ) * P27_step_17 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (2 : ℂ) * P27_step_7 f 0 1 rfl +
      (-2 : ℂ) * P27_step_11 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_20 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 20 - 262144 * P_mod27C^[18] f 20 - P_mod27C^[1] f 20 +
      P_mod27C^[0] f 20 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_20 f 18 19 rfl +
      (131072 : ℂ) * P27_step_10 f 17 18 rfl +
      (131072 : ℂ) * P27_step_17 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_20 f 17 18 rfl +
      (65536 : ℂ) * P27_step_2 f 16 17 rfl +
      (65536 : ℂ) * P27_step_5 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_10 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_17 f 16 17 rfl +
      (65536 : ℂ) * P27_step_22 f 16 17 rfl +
      (65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_1 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_2 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_5 f 15 16 rfl +
      (32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (32768 : ℂ) * P27_step_16 f 15 16 rfl +
      (32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_20 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_22 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_1 f 14 15 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (16384 : ℂ) * P27_step_10 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (16384 : ℂ) * P27_step_14 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_16 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_2 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (8192 : ℂ) * P27_step_7 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_8 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_14 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (4096 : ℂ) * P27_step_1 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_4 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_7 f 12 13 rfl +
      (4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (4096 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (-2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (2048 : ℂ) * P27_step_8 f 11 12 rfl +
      (2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_20 f 11 12 rfl +
      (2048 : ℂ) * P27_step_22 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 10 11 rfl +
      (1024 : ℂ) * P27_step_4 f 10 11 rfl +
      (1024 : ℂ) * P27_step_5 f 10 11 rfl +
      (1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_10 f 10 11 rfl +
      (1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_20 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (512 : ℂ) * P27_step_1 f 9 10 rfl +
      (-512 : ℂ) * P27_step_2 f 9 10 rfl +
      (-512 : ℂ) * P27_step_5 f 9 10 rfl +
      (-512 : ℂ) * P27_step_7 f 9 10 rfl +
      (512 : ℂ) * P27_step_8 f 9 10 rfl +
      (-512 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_11 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (512 : ℂ) * P27_step_16 f 9 10 rfl +
      (1024 : ℂ) * P27_step_17 f 9 10 rfl +
      (512 : ℂ) * P27_step_19 f 9 10 rfl +
      (1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_22 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_26 f 9 10 rfl +
      (-256 : ℂ) * P27_step_1 f 8 9 rfl +
      (256 : ℂ) * P27_step_2 f 8 9 rfl +
      (256 : ℂ) * P27_step_4 f 8 9 rfl +
      (-256 : ℂ) * P27_step_5 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (-256 : ℂ) * P27_step_8 f 8 9 rfl +
      (512 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_13 f 8 9 rfl +
      (256 : ℂ) * P27_step_14 f 8 9 rfl +
      (-256 : ℂ) * P27_step_16 f 8 9 rfl +
      (-256 : ℂ) * P27_step_17 f 8 9 rfl +
      (-256 : ℂ) * P27_step_19 f 8 9 rfl +
      (-256 : ℂ) * P27_step_20 f 8 9 rfl +
      (512 : ℂ) * P27_step_22 f 8 9 rfl +
      (256 : ℂ) * P27_step_23 f 8 9 rfl +
      (512 : ℂ) * P27_step_26 f 8 9 rfl +
      (128 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (-128 : ℂ) * P27_step_4 f 7 8 rfl +
      (256 : ℂ) * P27_step_5 f 7 8 rfl +
      (128 : ℂ) * P27_step_7 f 7 8 rfl +
      (-128 : ℂ) * P27_step_10 f 7 8 rfl +
      (256 : ℂ) * P27_step_13 f 7 8 rfl +
      (-128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-128 : ℂ) * P27_step_16 f 7 8 rfl +
      (-128 : ℂ) * P27_step_17 f 7 8 rfl +
      (-128 : ℂ) * P27_step_20 f 7 8 rfl +
      (-128 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_23 f 7 8 rfl +
      (128 : ℂ) * P27_step_25 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 6 7 rfl +
      (-64 : ℂ) * P27_step_5 f 6 7 rfl +
      (-64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-64 : ℂ) * P27_step_8 f 6 7 rfl +
      (-64 : ℂ) * P27_step_10 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (128 : ℂ) * P27_step_16 f 6 7 rfl +
      (64 : ℂ) * P27_step_17 f 6 7 rfl +
      (128 : ℂ) * P27_step_20 f 6 7 rfl +
      (-64 : ℂ) * P27_step_22 f 6 7 rfl +
      (-64 : ℂ) * P27_step_25 f 6 7 rfl +
      (-32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-32 : ℂ) * P27_step_4 f 5 6 rfl +
      (-32 : ℂ) * P27_step_5 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (64 : ℂ) * P27_step_8 f 5 6 rfl +
      (64 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_11 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_16 f 5 6 rfl +
      (-32 : ℂ) * P27_step_20 f 5 6 rfl +
      (32 : ℂ) * P27_step_22 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (32 : ℂ) * P27_step_4 f 4 5 rfl +
      (32 : ℂ) * P27_step_5 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (-16 : ℂ) * P27_step_8 f 4 5 rfl +
      (-16 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (-16 : ℂ) * P27_step_14 f 4 5 rfl +
      (-16 : ℂ) * P27_step_16 f 4 5 rfl +
      (-16 : ℂ) * P27_step_17 f 4 5 rfl +
      (-16 : ℂ) * P27_step_19 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-8 : ℂ) * P27_step_4 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_7 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (16 : ℂ) * P27_step_16 f 3 4 rfl +
      (16 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (-8 : ℂ) * P27_step_22 f 3 4 rfl +
      (-8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (-4 : ℂ) * P27_step_17 f 2 3 rfl +
      (8 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (-4 : ℂ) * P27_step_25 f 2 3 rfl +
      (4 : ℂ) * P27_step_26 f 2 3 rfl +
      (2 : ℂ) * P27_step_13 f 1 2 rfl +
      (-2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (-2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-1 : ℂ) * P27_step_13 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_21 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 21 - 262144 * P_mod27C^[18] f 21 - P_mod27C^[1] f 21 +
      P_mod27C^[0] f 21 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_21 f 18 19 rfl +
      (131072 : ℂ) * P27_step_5 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_21 f 17 18 rfl +
      (131072 : ℂ) * P27_step_24 f 17 18 rfl +
      (-131072 : ℂ) * P27_step_5 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (65536 : ℂ) * P27_step_12 f 16 17 rfl +
      (65536 : ℂ) * P27_step_16 f 16 17 rfl +
      (65536 : ℂ) * P27_step_23 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_24 f 16 17 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (32768 : ℂ) * P27_step_5 f 15 16 rfl +
      (32768 : ℂ) * P27_step_6 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_12 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_16 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_23 f 15 16 rfl +
      (32768 : ℂ) * P27_step_25 f 15 16 rfl +
      (32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_3 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_5 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_6 f 14 15 rfl +
      (-49152 : ℂ) * P27_step_8 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (16384 : ℂ) * P27_step_16 f 14 15 rfl +
      (16384 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (16384 : ℂ) * P27_step_23 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_25 f 14 15 rfl +
      (32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_2 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_3 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_4 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_15 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_16 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (8192 : ℂ) * P27_step_22 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_23 f 13 14 rfl +
      (8192 : ℂ) * P27_step_25 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_26 f 13 14 rfl +
      (4096 : ℂ) * P27_step_1 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_2 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_8 f 12 13 rfl +
      (8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_13 f 12 13 rfl +
      (4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_15 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (8192 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_21 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_25 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_1 f 11 12 rfl +
      (4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_4 f 11 12 rfl +
      (6144 : ℂ) * P27_step_5 f 11 12 rfl +
      (2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (2048 : ℂ) * P27_step_8 f 11 12 rfl +
      (4096 : ℂ) * P27_step_10 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (2048 : ℂ) * P27_step_14 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_20 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_21 f 11 12 rfl +
      (4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_23 f 11 12 rfl +
      (2048 : ℂ) * P27_step_24 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_2 f 10 11 rfl +
      (1024 : ℂ) * P27_step_4 f 10 11 rfl +
      (1024 : ℂ) * P27_step_7 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_10 f 10 11 rfl +
      (2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (1024 : ℂ) * P27_step_12 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_14 f 10 11 rfl +
      (3072 : ℂ) * P27_step_16 f 10 11 rfl +
      (1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_24 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_25 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_1 f 9 10 rfl +
      (512 : ℂ) * P27_step_2 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (512 : ℂ) * P27_step_6 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_7 f 9 10 rfl +
      (1024 : ℂ) * P27_step_8 f 9 10 rfl +
      (512 : ℂ) * P27_step_11 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_12 f 9 10 rfl +
      (1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (512 : ℂ) * P27_step_17 f 9 10 rfl +
      (1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (-512 : ℂ) * P27_step_20 f 9 10 rfl +
      (512 : ℂ) * P27_step_22 f 9 10 rfl +
      (-512 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_26 f 9 10 rfl +
      (256 : ℂ) * P27_step_1 f 8 9 rfl +
      (256 : ℂ) * P27_step_3 f 8 9 rfl +
      (512 : ℂ) * P27_step_4 f 8 9 rfl +
      (-512 : ℂ) * P27_step_5 f 8 9 rfl +
      (-512 : ℂ) * P27_step_6 f 8 9 rfl +
      (512 : ℂ) * P27_step_7 f 8 9 rfl +
      (-256 : ℂ) * P27_step_8 f 8 9 rfl +
      (-256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_13 f 8 9 rfl +
      (-512 : ℂ) * P27_step_14 f 8 9 rfl +
      (-512 : ℂ) * P27_step_16 f 8 9 rfl +
      (-256 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_19 f 8 9 rfl +
      (256 : ℂ) * P27_step_20 f 8 9 rfl +
      (256 : ℂ) * P27_step_22 f 8 9 rfl +
      (768 : ℂ) * P27_step_23 f 8 9 rfl +
      (-256 : ℂ) * P27_step_25 f 8 9 rfl +
      (512 : ℂ) * P27_step_26 f 8 9 rfl +
      (384 : ℂ) * P27_step_2 f 7 8 rfl +
      (-256 : ℂ) * P27_step_3 f 7 8 rfl +
      (-128 : ℂ) * P27_step_4 f 7 8 rfl +
      (-256 : ℂ) * P27_step_7 f 7 8 rfl +
      (-384 : ℂ) * P27_step_8 f 7 8 rfl +
      (128 : ℂ) * P27_step_10 f 7 8 rfl +
      (256 : ℂ) * P27_step_13 f 7 8 rfl +
      (128 : ℂ) * P27_step_14 f 7 8 rfl +
      (128 : ℂ) * P27_step_15 f 7 8 rfl +
      (-256 : ℂ) * P27_step_16 f 7 8 rfl +
      (384 : ℂ) * P27_step_17 f 7 8 rfl +
      (-128 : ℂ) * P27_step_20 f 7 8 rfl +
      (-128 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_23 f 7 8 rfl +
      (384 : ℂ) * P27_step_25 f 7 8 rfl +
      (-128 : ℂ) * P27_step_26 f 7 8 rfl +
      (192 : ℂ) * P27_step_1 f 6 7 rfl +
      (-192 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_5 f 6 7 rfl +
      (64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-128 : ℂ) * P27_step_8 f 6 7 rfl +
      (-64 : ℂ) * P27_step_10 f 6 7 rfl +
      (-128 : ℂ) * P27_step_11 f 6 7 rfl +
      (-64 : ℂ) * P27_step_13 f 6 7 rfl +
      (-128 : ℂ) * P27_step_15 f 6 7 rfl +
      (128 : ℂ) * P27_step_20 f 6 7 rfl +
      (64 : ℂ) * P27_step_21 f 6 7 rfl +
      (192 : ℂ) * P27_step_22 f 6 7 rfl +
      (64 : ℂ) * P27_step_23 f 6 7 rfl +
      (-64 : ℂ) * P27_step_25 f 6 7 rfl +
      (128 : ℂ) * P27_step_26 f 6 7 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (-64 : ℂ) * P27_step_4 f 5 6 rfl +
      (64 : ℂ) * P27_step_10 f 5 6 rfl +
      (96 : ℂ) * P27_step_11 f 5 6 rfl +
      (64 : ℂ) * P27_step_13 f 5 6 rfl +
      (96 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_16 f 5 6 rfl +
      (32 : ℂ) * P27_step_17 f 5 6 rfl +
      (-64 : ℂ) * P27_step_19 f 5 6 rfl +
      (-64 : ℂ) * P27_step_20 f 5 6 rfl +
      (-64 : ℂ) * P27_step_21 f 5 6 rfl +
      (-64 : ℂ) * P27_step_23 f 5 6 rfl +
      (32 : ℂ) * P27_step_24 f 5 6 rfl +
      (32 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_2 f 4 5 rfl +
      (48 : ℂ) * P27_step_7 f 4 5 rfl +
      (-32 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_12 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (48 : ℂ) * P27_step_19 f 4 5 rfl +
      (32 : ℂ) * P27_step_20 f 4 5 rfl +
      (16 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-32 : ℂ) * P27_step_24 f 4 5 rfl +
      (-32 : ℂ) * P27_step_25 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-16 : ℂ) * P27_step_1 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (8 : ℂ) * P27_step_6 f 3 4 rfl +
      (-8 : ℂ) * P27_step_8 f 3 4 rfl +
      (16 : ℂ) * P27_step_10 f 3 4 rfl +
      (16 : ℂ) * P27_step_11 f 3 4 rfl +
      (-16 : ℂ) * P27_step_12 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (24 : ℂ) * P27_step_17 f 3 4 rfl +
      (-8 : ℂ) * P27_step_20 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (4 : ℂ) * P27_step_3 f 2 3 rfl +
      (-4 : ℂ) * P27_step_4 f 2 3 rfl +
      (-8 : ℂ) * P27_step_6 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (-4 : ℂ) * P27_step_10 f 2 3 rfl +
      (-4 : ℂ) * P27_step_11 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_17 f 2 3 rfl +
      (8 : ℂ) * P27_step_19 f 2 3 rfl +
      (8 : ℂ) * P27_step_20 f 2 3 rfl +
      (12 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-4 : ℂ) * P27_step_3 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (4 : ℂ) * P27_step_10 f 1 2 rfl +
      (4 : ℂ) * P27_step_11 f 1 2 rfl +
      (2 : ℂ) * P27_step_15 f 1 2 rfl +
      (-2 : ℂ) * P27_step_19 f 1 2 rfl +
      (2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_15 f 0 1 rfl +
      (2 : ℂ) * P27_step_19 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_22 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 22 - 262144 * P_mod27C^[18] f 22 - P_mod27C^[1] f 22 +
      P_mod27C^[0] f 22 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_22 f 18 19 rfl +
      (131072 : ℂ) * P27_step_11 f 17 18 rfl +
      (131072 : ℂ) * P27_step_20 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_22 f 17 18 rfl +
      (65536 : ℂ) * P27_step_10 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_11 f 16 17 rfl +
      (131072 : ℂ) * P27_step_17 f 16 17 rfl +
      (65536 : ℂ) * P27_step_19 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_20 f 16 17 rfl +
      (65536 : ℂ) * P27_step_2 f 15 16 rfl +
      (32768 : ℂ) * P27_step_5 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_10 f 15 16 rfl +
      (-131072 : ℂ) * P27_step_17 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_19 f 15 16 rfl +
      (65536 : ℂ) * P27_step_22 f 15 16 rfl +
      (32768 : ℂ) * P27_step_23 f 15 16 rfl +
      (65536 : ℂ) * P27_step_26 f 15 16 rfl +
      (32768 : ℂ) * P27_step_1 f 14 15 rfl +
      (-65536 : ℂ) * P27_step_2 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_5 f 14 15 rfl +
      (32768 : ℂ) * P27_step_8 f 14 15 rfl +
      (32768 : ℂ) * P27_step_11 f 14 15 rfl +
      (32768 : ℂ) * P27_step_13 f 14 15 rfl +
      (16384 : ℂ) * P27_step_16 f 14 15 rfl +
      (32768 : ℂ) * P27_step_17 f 14 15 rfl +
      (32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (-65536 : ℂ) * P27_step_22 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_23 f 14 15 rfl +
      (16384 : ℂ) * P27_step_25 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_1 f 13 14 rfl +
      (16384 : ℂ) * P27_step_2 f 13 14 rfl +
      (16384 : ℂ) * P27_step_4 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_8 f 13 14 rfl +
      (16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_11 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (16384 : ℂ) * P27_step_14 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_16 f 13 14 rfl +
      (16384 : ℂ) * P27_step_19 f 13 14 rfl +
      (16384 : ℂ) * P27_step_22 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_25 f 13 14 rfl +
      (24576 : ℂ) * P27_step_26 f 13 14 rfl +
      (8192 : ℂ) * P27_step_1 f 12 13 rfl +
      (8192 : ℂ) * P27_step_2 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (8192 : ℂ) * P27_step_7 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_11 f 12 13 rfl +
      (12288 : ℂ) * P27_step_13 f 12 13 rfl +
      (-16384 : ℂ) * P27_step_14 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_19 f 12 13 rfl +
      (8192 : ℂ) * P27_step_23 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_26 f 12 13 rfl +
      (4096 : ℂ) * P27_step_1 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_2 f 11 12 rfl +
      (-8192 : ℂ) * P27_step_7 f 11 12 rfl +
      (4096 : ℂ) * P27_step_11 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_13 f 11 12 rfl +
      (4096 : ℂ) * P27_step_14 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (4096 : ℂ) * P27_step_17 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_19 f 11 12 rfl +
      (6144 : ℂ) * P27_step_20 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_23 f 11 12 rfl +
      (4096 : ℂ) * P27_step_25 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_26 f 11 12 rfl +
      (-3072 : ℂ) * P27_step_1 f 10 11 rfl +
      (2048 : ℂ) * P27_step_7 f 10 11 rfl +
      (2048 : ℂ) * P27_step_8 f 10 11 rfl +
      (3072 : ℂ) * P27_step_10 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_13 f 10 11 rfl +
      (2048 : ℂ) * P27_step_14 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_17 f 10 11 rfl +
      (2048 : ℂ) * P27_step_19 f 10 11 rfl +
      (-4096 : ℂ) * P27_step_20 f 10 11 rfl +
      (2048 : ℂ) * P27_step_22 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_23 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_25 f 10 11 rfl +
      (2048 : ℂ) * P27_step_26 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (1024 : ℂ) * P27_step_4 f 9 10 rfl +
      (1536 : ℂ) * P27_step_5 f 9 10 rfl +
      (1024 : ℂ) * P27_step_7 f 9 10 rfl +
      (-2048 : ℂ) * P27_step_10 f 9 10 rfl +
      (1024 : ℂ) * P27_step_11 f 9 10 rfl +
      (1024 : ℂ) * P27_step_13 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_14 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_17 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_22 f 9 10 rfl +
      (1024 : ℂ) * P27_step_23 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_1 f 8 9 rfl +
      (-512 : ℂ) * P27_step_2 f 8 9 rfl +
      (-1024 : ℂ) * P27_step_5 f 8 9 rfl +
      (-768 : ℂ) * P27_step_7 f 8 9 rfl +
      (512 : ℂ) * P27_step_8 f 8 9 rfl +
      (-512 : ℂ) * P27_step_10 f 8 9 rfl +
      (-512 : ℂ) * P27_step_11 f 8 9 rfl +
      (768 : ℂ) * P27_step_16 f 8 9 rfl +
      (1024 : ℂ) * P27_step_17 f 8 9 rfl +
      (512 : ℂ) * P27_step_19 f 8 9 rfl +
      (1024 : ℂ) * P27_step_20 f 8 9 rfl +
      (-512 : ℂ) * P27_step_22 f 8 9 rfl +
      (512 : ℂ) * P27_step_25 f 8 9 rfl +
      (-1024 : ℂ) * P27_step_26 f 8 9 rfl +
      (-256 : ℂ) * P27_step_1 f 7 8 rfl +
      (256 : ℂ) * P27_step_2 f 7 8 rfl +
      (256 : ℂ) * P27_step_4 f 7 8 rfl +
      (-256 : ℂ) * P27_step_5 f 7 8 rfl +
      (-128 : ℂ) * P27_step_8 f 7 8 rfl +
      (512 : ℂ) * P27_step_10 f 7 8 rfl +
      (-512 : ℂ) * P27_step_13 f 7 8 rfl +
      (256 : ℂ) * P27_step_14 f 7 8 rfl +
      (-512 : ℂ) * P27_step_16 f 7 8 rfl +
      (-384 : ℂ) * P27_step_17 f 7 8 rfl +
      (-256 : ℂ) * P27_step_19 f 7 8 rfl +
      (-256 : ℂ) * P27_step_20 f 7 8 rfl +
      (512 : ℂ) * P27_step_22 f 7 8 rfl +
      (256 : ℂ) * P27_step_23 f 7 8 rfl +
      (512 : ℂ) * P27_step_26 f 7 8 rfl +
      (128 : ℂ) * P27_step_1 f 6 7 rfl +
      (128 : ℂ) * P27_step_2 f 6 7 rfl +
      (-64 : ℂ) * P27_step_4 f 6 7 rfl +
      (256 : ℂ) * P27_step_5 f 6 7 rfl +
      (128 : ℂ) * P27_step_7 f 6 7 rfl +
      (-128 : ℂ) * P27_step_8 f 6 7 rfl +
      (-128 : ℂ) * P27_step_10 f 6 7 rfl +
      (256 : ℂ) * P27_step_13 f 6 7 rfl +
      (-128 : ℂ) * P27_step_14 f 6 7 rfl +
      (-128 : ℂ) * P27_step_16 f 6 7 rfl +
      (-128 : ℂ) * P27_step_20 f 6 7 rfl +
      (-192 : ℂ) * P27_step_22 f 6 7 rfl +
      (-128 : ℂ) * P27_step_23 f 6 7 rfl +
      (128 : ℂ) * P27_step_25 f 6 7 rfl +
      (64 : ℂ) * P27_step_1 f 5 6 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (-64 : ℂ) * P27_step_4 f 5 6 rfl +
      (-64 : ℂ) * P27_step_5 f 5 6 rfl +
      (-64 : ℂ) * P27_step_7 f 5 6 rfl +
      (-64 : ℂ) * P27_step_8 f 5 6 rfl +
      (-64 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_11 f 5 6 rfl +
      (64 : ℂ) * P27_step_14 f 5 6 rfl +
      (128 : ℂ) * P27_step_16 f 5 6 rfl +
      (64 : ℂ) * P27_step_17 f 5 6 rfl +
      (128 : ℂ) * P27_step_20 f 5 6 rfl +
      (-64 : ℂ) * P27_step_25 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_2 f 4 5 rfl +
      (-32 : ℂ) * P27_step_4 f 4 5 rfl +
      (-32 : ℂ) * P27_step_5 f 4 5 rfl +
      (32 : ℂ) * P27_step_7 f 4 5 rfl +
      (64 : ℂ) * P27_step_8 f 4 5 rfl +
      (64 : ℂ) * P27_step_10 f 4 5 rfl +
      (32 : ℂ) * P27_step_14 f 4 5 rfl +
      (-32 : ℂ) * P27_step_16 f 4 5 rfl +
      (-16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-32 : ℂ) * P27_step_20 f 4 5 rfl +
      (32 : ℂ) * P27_step_22 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (-16 : ℂ) * P27_step_1 f 3 4 rfl +
      (32 : ℂ) * P27_step_4 f 3 4 rfl +
      (32 : ℂ) * P27_step_5 f 3 4 rfl +
      (16 : ℂ) * P27_step_7 f 3 4 rfl +
      (-16 : ℂ) * P27_step_8 f 3 4 rfl +
      (-16 : ℂ) * P27_step_10 f 3 4 rfl +
      (16 : ℂ) * P27_step_11 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (-16 : ℂ) * P27_step_16 f 3 4 rfl +
      (-16 : ℂ) * P27_step_17 f 3 4 rfl +
      (-8 : ℂ) * P27_step_23 f 3 4 rfl +
      (16 : ℂ) * P27_step_26 f 3 4 rfl +
      (-8 : ℂ) * P27_step_4 f 2 3 rfl +
      (-8 : ℂ) * P27_step_5 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (8 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (16 : ℂ) * P27_step_16 f 2 3 rfl +
      (16 : ℂ) * P27_step_17 f 2 3 rfl +
      (8 : ℂ) * P27_step_19 f 2 3 rfl +
      (-8 : ℂ) * P27_step_22 f 2 3 rfl +
      (-4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-8 : ℂ) * P27_step_26 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_13 f 1 2 rfl +
      (-4 : ℂ) * P27_step_16 f 1 2 rfl +
      (-2 : ℂ) * P27_step_17 f 1 2 rfl +
      (8 : ℂ) * P27_step_22 f 1 2 rfl +
      (4 : ℂ) * P27_step_23 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_17 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl +
      (2 : ℂ) * P27_step_25 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_23 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 23 - 262144 * P_mod27C^[18] f 23 - P_mod27C^[1] f 23 +
      P_mod27C^[0] f 23 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_23 f 18 19 rfl +
      (131072 : ℂ) * P27_step_8 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_23 f 17 18 rfl +
      (131072 : ℂ) * P27_step_25 f 17 18 rfl +
      (65536 : ℂ) * P27_step_4 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_8 f 16 17 rfl +
      (65536 : ℂ) * P27_step_11 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_25 f 16 17 rfl +
      (131072 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_2 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_4 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_11 f 15 16 rfl +
      (65536 : ℂ) * P27_step_13 f 15 16 rfl +
      (32768 : ℂ) * P27_step_17 f 15 16 rfl +
      (32768 : ℂ) * P27_step_19 f 15 16 rfl +
      (32768 : ℂ) * P27_step_20 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_1 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_10 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_19 f 14 15 rfl +
      (32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (16384 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_23 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (-8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (8192 : ℂ) * P27_step_5 f 13 14 rfl +
      (8192 : ℂ) * P27_step_8 f 13 14 rfl +
      (16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_20 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_23 f 13 14 rfl +
      (8192 : ℂ) * P27_step_25 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_26 f 13 14 rfl +
      (4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (4096 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_10 f 12 13 rfl +
      (4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_13 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (4096 : ℂ) * P27_step_16 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_20 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_25 f 12 13 rfl +
      (8192 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_5 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (4096 : ℂ) * P27_step_8 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_10 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (4096 : ℂ) * P27_step_13 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (2048 : ℂ) * P27_step_4 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_5 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_11 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_13 f 10 11 rfl +
      (1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_16 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (2048 : ℂ) * P27_step_20 f 10 11 rfl +
      (1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_8 f 9 10 rfl +
      (1024 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_11 f 9 10 rfl +
      (512 : ℂ) * P27_step_13 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_16 f 9 10 rfl +
      (512 : ℂ) * P27_step_17 f 9 10 rfl +
      (-512 : ℂ) * P27_step_19 f 9 10 rfl +
      (-512 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_22 f 9 10 rfl +
      (512 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (512 : ℂ) * P27_step_1 f 8 9 rfl +
      (256 : ℂ) * P27_step_2 f 8 9 rfl +
      (-768 : ℂ) * P27_step_4 f 8 9 rfl +
      (512 : ℂ) * P27_step_5 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (-512 : ℂ) * P27_step_8 f 8 9 rfl +
      (-256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-256 : ℂ) * P27_step_11 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (256 : ℂ) * P27_step_17 f 8 9 rfl +
      (-256 : ℂ) * P27_step_19 f 8 9 rfl +
      (256 : ℂ) * P27_step_20 f 8 9 rfl +
      (256 : ℂ) * P27_step_22 f 8 9 rfl +
      (-256 : ℂ) * P27_step_23 f 8 9 rfl +
      (256 : ℂ) * P27_step_25 f 8 9 rfl +
      (128 : ℂ) * P27_step_1 f 7 8 rfl +
      (-384 : ℂ) * P27_step_2 f 7 8 rfl +
      (-256 : ℂ) * P27_step_4 f 7 8 rfl +
      (-128 : ℂ) * P27_step_5 f 7 8 rfl +
      (128 : ℂ) * P27_step_8 f 7 8 rfl +
      (128 : ℂ) * P27_step_10 f 7 8 rfl +
      (128 : ℂ) * P27_step_11 f 7 8 rfl +
      (256 : ℂ) * P27_step_14 f 7 8 rfl +
      (256 : ℂ) * P27_step_16 f 7 8 rfl +
      (-128 : ℂ) * P27_step_19 f 7 8 rfl +
      (128 : ℂ) * P27_step_22 f 7 8 rfl +
      (-128 : ℂ) * P27_step_23 f 7 8 rfl +
      (-128 : ℂ) * P27_step_25 f 7 8 rfl +
      (-192 : ℂ) * P27_step_1 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 6 7 rfl +
      (64 : ℂ) * P27_step_4 f 6 7 rfl +
      (64 : ℂ) * P27_step_5 f 6 7 rfl +
      (128 : ℂ) * P27_step_7 f 6 7 rfl +
      (128 : ℂ) * P27_step_8 f 6 7 rfl +
      (128 : ℂ) * P27_step_11 f 6 7 rfl +
      (64 : ℂ) * P27_step_14 f 6 7 rfl +
      (-64 : ℂ) * P27_step_16 f 6 7 rfl +
      (-128 : ℂ) * P27_step_17 f 6 7 rfl +
      (64 : ℂ) * P27_step_19 f 6 7 rfl +
      (-64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-64 : ℂ) * P27_step_23 f 6 7 rfl +
      (-64 : ℂ) * P27_step_25 f 6 7 rfl +
      (-32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (64 : ℂ) * P27_step_4 f 5 6 rfl +
      (32 : ℂ) * P27_step_7 f 5 6 rfl +
      (-32 : ℂ) * P27_step_10 f 5 6 rfl +
      (-96 : ℂ) * P27_step_14 f 5 6 rfl +
      (32 : ℂ) * P27_step_16 f 5 6 rfl +
      (64 : ℂ) * P27_step_17 f 5 6 rfl +
      (64 : ℂ) * P27_step_19 f 5 6 rfl +
      (32 : ℂ) * P27_step_20 f 5 6 rfl +
      (-64 : ℂ) * P27_step_22 f 5 6 rfl +
      (32 : ℂ) * P27_step_23 f 5 6 rfl +
      (-32 : ℂ) * P27_step_25 f 5 6 rfl +
      (-32 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (32 : ℂ) * P27_step_2 f 4 5 rfl +
      (-16 : ℂ) * P27_step_5 f 4 5 rfl +
      (-48 : ℂ) * P27_step_7 f 4 5 rfl +
      (-16 : ℂ) * P27_step_8 f 4 5 rfl +
      (16 : ℂ) * P27_step_10 f 4 5 rfl +
      (-16 : ℂ) * P27_step_11 f 4 5 rfl +
      (-16 : ℂ) * P27_step_13 f 4 5 rfl +
      (-16 : ℂ) * P27_step_14 f 4 5 rfl +
      (16 : ℂ) * P27_step_17 f 4 5 rfl +
      (32 : ℂ) * P27_step_22 f 4 5 rfl +
      (32 : ℂ) * P27_step_23 f 4 5 rfl +
      (16 : ℂ) * P27_step_25 f 4 5 rfl +
      (16 : ℂ) * P27_step_1 f 3 4 rfl +
      (-8 : ℂ) * P27_step_4 f 3 4 rfl +
      (8 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_7 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (-8 : ℂ) * P27_step_16 f 3 4 rfl +
      (-16 : ℂ) * P27_step_17 f 3 4 rfl +
      (-8 : ℂ) * P27_step_19 f 3 4 rfl +
      (8 : ℂ) * P27_step_22 f 3 4 rfl +
      (16 : ℂ) * P27_step_25 f 3 4 rfl +
      (8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (4 : ℂ) * P27_step_11 f 2 3 rfl +
      (4 : ℂ) * P27_step_13 f 2 3 rfl +
      (8 : ℂ) * P27_step_14 f 2 3 rfl +
      (4 : ℂ) * P27_step_16 f 2 3 rfl +
      (-4 : ℂ) * P27_step_17 f 2 3 rfl +
      (-8 : ℂ) * P27_step_22 f 2 3 rfl +
      (-4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_26 f 2 3 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (4 : ℂ) * P27_step_7 f 1 2 rfl +
      (4 : ℂ) * P27_step_8 f 1 2 rfl +
      (-4 : ℂ) * P27_step_11 f 1 2 rfl +
      (2 : ℂ) * P27_step_13 f 1 2 rfl +
      (2 : ℂ) * P27_step_19 f 1 2 rfl +
      (-2 : ℂ) * P27_step_22 f 1 2 rfl +
      (-2 : ℂ) * P27_step_25 f 1 2 rfl +
      (-2 : ℂ) * P27_step_26 f 1 2 rfl +
      (2 : ℂ) * P27_step_4 f 0 1 rfl +
      (-1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_19 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_24 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 24 - 262144 * P_mod27C^[18] f 24 - P_mod27C^[1] f 24 +
      P_mod27C^[0] f 24 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_24 f 18 19 rfl +
      (131072 : ℂ) * P27_step_12 f 17 18 rfl +
      (131072 : ℂ) * P27_step_23 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_24 f 17 18 rfl +
      (65536 : ℂ) * P27_step_5 f 16 17 rfl +
      (65536 : ℂ) * P27_step_6 f 16 17 rfl +
      (65536 : ℂ) * P27_step_8 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_12 f 16 17 rfl +
      (-131072 : ℂ) * P27_step_23 f 16 17 rfl +
      (65536 : ℂ) * P27_step_25 f 16 17 rfl +
      (32768 : ℂ) * P27_step_3 f 15 16 rfl +
      (32768 : ℂ) * P27_step_4 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_5 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_6 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_8 f 15 16 rfl +
      (32768 : ℂ) * P27_step_11 f 15 16 rfl +
      (32768 : ℂ) * P27_step_16 f 15 16 rfl +
      (32768 : ℂ) * P27_step_23 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_25 f 15 16 rfl +
      (65536 : ℂ) * P27_step_26 f 15 16 rfl +
      (16384 : ℂ) * P27_step_2 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_3 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_4 f 14 15 rfl +
      (16384 : ℂ) * P27_step_5 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (32768 : ℂ) * P27_step_13 f 14 15 rfl +
      (16384 : ℂ) * P27_step_15 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_16 f 14 15 rfl +
      (16384 : ℂ) * P27_step_17 f 14 15 rfl +
      (16384 : ℂ) * P27_step_19 f 14 15 rfl +
      (16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_23 f 14 15 rfl +
      (16384 : ℂ) * P27_step_25 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (8192 : ℂ) * P27_step_1 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_5 f 13 14 rfl +
      (-24576 : ℂ) * P27_step_8 f 13 14 rfl +
      (8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_15 f 13 14 rfl +
      (8192 : ℂ) * P27_step_16 f 13 14 rfl +
      (8192 : ℂ) * P27_step_17 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (24576 : ℂ) * P27_step_20 f 13 14 rfl +
      (8192 : ℂ) * P27_step_21 f 13 14 rfl +
      (8192 : ℂ) * P27_step_22 f 13 14 rfl +
      (16384 : ℂ) * P27_step_23 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_25 f 13 14 rfl +
      (8192 : ℂ) * P27_step_26 f 13 14 rfl +
      (4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_4 f 12 13 rfl +
      (8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_8 f 12 13 rfl +
      (12288 : ℂ) * P27_step_10 f 12 13 rfl +
      (4096 : ℂ) * P27_step_13 f 12 13 rfl +
      (4096 : ℂ) * P27_step_14 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_16 f 12 13 rfl +
      (8192 : ℂ) * P27_step_17 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_20 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_21 f 12 13 rfl +
      (4096 : ℂ) * P27_step_22 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_23 f 12 13 rfl +
      (4096 : ℂ) * P27_step_24 f 12 13 rfl +
      (8192 : ℂ) * P27_step_25 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_26 f 12 13 rfl +
      (2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_2 f 11 12 rfl +
      (2048 : ℂ) * P27_step_4 f 11 12 rfl +
      (2048 : ℂ) * P27_step_5 f 11 12 rfl +
      (2048 : ℂ) * P27_step_7 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_8 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_10 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (2048 : ℂ) * P27_step_12 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_13 f 11 12 rfl +
      (4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (4096 : ℂ) * P27_step_22 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_24 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_25 f 11 12 rfl +
      (4096 : ℂ) * P27_step_26 f 11 12 rfl +
      (-1024 : ℂ) * P27_step_1 f 10 11 rfl +
      (1024 : ℂ) * P27_step_2 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_4 f 10 11 rfl +
      (1024 : ℂ) * P27_step_6 f 10 11 rfl +
      (3072 : ℂ) * P27_step_8 f 10 11 rfl +
      (2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_12 f 10 11 rfl +
      (2048 : ℂ) * P27_step_13 f 10 11 rfl +
      (1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (1024 : ℂ) * P27_step_16 f 10 11 rfl +
      (1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_20 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_23 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_26 f 10 11 rfl +
      (512 : ℂ) * P27_step_1 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (512 : ℂ) * P27_step_3 f 9 10 rfl +
      (1536 : ℂ) * P27_step_4 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_6 f 9 10 rfl +
      (512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_10 f 9 10 rfl +
      (512 : ℂ) * P27_step_11 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_13 f 9 10 rfl +
      (-512 : ℂ) * P27_step_14 f 9 10 rfl +
      (1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (1024 : ℂ) * P27_step_20 f 9 10 rfl +
      (512 : ℂ) * P27_step_22 f 9 10 rfl +
      (1024 : ℂ) * P27_step_23 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_25 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (-512 : ℂ) * P27_step_1 f 8 9 rfl +
      (768 : ℂ) * P27_step_2 f 8 9 rfl +
      (-512 : ℂ) * P27_step_3 f 8 9 rfl +
      (-512 : ℂ) * P27_step_5 f 8 9 rfl +
      (-256 : ℂ) * P27_step_7 f 8 9 rfl +
      (-256 : ℂ) * P27_step_8 f 8 9 rfl +
      (512 : ℂ) * P27_step_10 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (256 : ℂ) * P27_step_14 f 8 9 rfl +
      (256 : ℂ) * P27_step_15 f 8 9 rfl +
      (-512 : ℂ) * P27_step_16 f 8 9 rfl +
      (512 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_19 f 8 9 rfl +
      (-512 : ℂ) * P27_step_20 f 8 9 rfl +
      (512 : ℂ) * P27_step_25 f 8 9 rfl +
      (-256 : ℂ) * P27_step_26 f 8 9 rfl +
      (384 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (-128 : ℂ) * P27_step_4 f 7 8 rfl +
      (128 : ℂ) * P27_step_7 f 7 8 rfl +
      (-384 : ℂ) * P27_step_8 f 7 8 rfl +
      (-256 : ℂ) * P27_step_10 f 7 8 rfl +
      (-128 : ℂ) * P27_step_11 f 7 8 rfl +
      (-128 : ℂ) * P27_step_13 f 7 8 rfl +
      (-256 : ℂ) * P27_step_14 f 7 8 rfl +
      (-256 : ℂ) * P27_step_15 f 7 8 rfl +
      (-256 : ℂ) * P27_step_16 f 7 8 rfl +
      (256 : ℂ) * P27_step_20 f 7 8 rfl +
      (128 : ℂ) * P27_step_21 f 7 8 rfl +
      (256 : ℂ) * P27_step_22 f 7 8 rfl +
      (256 : ℂ) * P27_step_23 f 7 8 rfl +
      (256 : ℂ) * P27_step_26 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-192 : ℂ) * P27_step_4 f 6 7 rfl +
      (-64 : ℂ) * P27_step_5 f 6 7 rfl +
      (-128 : ℂ) * P27_step_7 f 6 7 rfl +
      (-128 : ℂ) * P27_step_8 f 6 7 rfl +
      (128 : ℂ) * P27_step_10 f 6 7 rfl +
      (64 : ℂ) * P27_step_11 f 6 7 rfl +
      (128 : ℂ) * P27_step_13 f 6 7 rfl +
      (192 : ℂ) * P27_step_14 f 6 7 rfl +
      (192 : ℂ) * P27_step_17 f 6 7 rfl +
      (-64 : ℂ) * P27_step_19 f 6 7 rfl +
      (-64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-128 : ℂ) * P27_step_21 f 6 7 rfl +
      (-128 : ℂ) * P27_step_23 f 6 7 rfl +
      (64 : ℂ) * P27_step_24 f 6 7 rfl +
      (128 : ℂ) * P27_step_25 f 6 7 rfl +
      (-64 : ℂ) * P27_step_26 f 6 7 rfl +
      (-32 : ℂ) * P27_step_2 f 5 6 rfl +
      (-64 : ℂ) * P27_step_4 f 5 6 rfl +
      (96 : ℂ) * P27_step_7 f 5 6 rfl +
      (-32 : ℂ) * P27_step_10 f 5 6 rfl +
      (32 : ℂ) * P27_step_12 f 5 6 rfl +
      (-32 : ℂ) * P27_step_13 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (-32 : ℂ) * P27_step_16 f 5 6 rfl +
      (-64 : ℂ) * P27_step_17 f 5 6 rfl +
      (32 : ℂ) * P27_step_19 f 5 6 rfl +
      (32 : ℂ) * P27_step_20 f 5 6 rfl +
      (96 : ℂ) * P27_step_22 f 5 6 rfl +
      (-64 : ℂ) * P27_step_24 f 5 6 rfl +
      (-64 : ℂ) * P27_step_25 f 5 6 rfl +
      (64 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_2 f 4 5 rfl +
      (16 : ℂ) * P27_step_6 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (16 : ℂ) * P27_step_10 f 4 5 rfl +
      (48 : ℂ) * P27_step_11 f 4 5 rfl +
      (-32 : ℂ) * P27_step_12 f 4 5 rfl +
      (32 : ℂ) * P27_step_13 f 4 5 rfl +
      (48 : ℂ) * P27_step_17 f 4 5 rfl +
      (-16 : ℂ) * P27_step_20 f 4 5 rfl +
      (-32 : ℂ) * P27_step_22 f 4 5 rfl +
      (-16 : ℂ) * P27_step_23 f 4 5 rfl +
      (-32 : ℂ) * P27_step_26 f 4 5 rfl +
      (-16 : ℂ) * P27_step_1 f 3 4 rfl +
      (8 : ℂ) * P27_step_3 f 3 4 rfl +
      (-8 : ℂ) * P27_step_5 f 3 4 rfl +
      (-16 : ℂ) * P27_step_6 f 3 4 rfl +
      (-8 : ℂ) * P27_step_8 f 3 4 rfl +
      (-8 : ℂ) * P27_step_10 f 3 4 rfl +
      (-8 : ℂ) * P27_step_11 f 3 4 rfl +
      (-16 : ℂ) * P27_step_13 f 3 4 rfl +
      (-8 : ℂ) * P27_step_14 f 3 4 rfl +
      (8 : ℂ) * P27_step_17 f 3 4 rfl +
      (24 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_20 f 3 4 rfl +
      (24 : ℂ) * P27_step_22 f 3 4 rfl +
      (8 : ℂ) * P27_step_23 f 3 4 rfl +
      (-8 : ℂ) * P27_step_25 f 3 4 rfl +
      (8 : ℂ) * P27_step_26 f 3 4 rfl +
      (-8 : ℂ) * P27_step_3 f 2 3 rfl +
      (-4 : ℂ) * P27_step_4 f 2 3 rfl +
      (-4 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_8 f 2 3 rfl +
      (8 : ℂ) * P27_step_10 f 2 3 rfl +
      (8 : ℂ) * P27_step_11 f 2 3 rfl +
      (4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_14 f 2 3 rfl +
      (4 : ℂ) * P27_step_15 f 2 3 rfl +
      (-4 : ℂ) * P27_step_16 f 2 3 rfl +
      (4 : ℂ) * P27_step_17 f 2 3 rfl +
      (-4 : ℂ) * P27_step_19 f 2 3 rfl +
      (-4 : ℂ) * P27_step_20 f 2 3 rfl +
      (4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-2 : ℂ) * P27_step_4 f 1 2 rfl +
      (-4 : ℂ) * P27_step_7 f 1 2 rfl +
      (-4 : ℂ) * P27_step_8 f 1 2 rfl +
      (-2 : ℂ) * P27_step_10 f 1 2 rfl +
      (-4 : ℂ) * P27_step_15 f 1 2 rfl +
      (4 : ℂ) * P27_step_19 f 1 2 rfl +
      (4 : ℂ) * P27_step_20 f 1 2 rfl +
      (2 : ℂ) * P27_step_21 f 1 2 rfl +
      (2 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-2 : ℂ) * P27_step_4 f 0 1 rfl +
      (2 : ℂ) * P27_step_10 f 0 1 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (-2 : ℂ) * P27_step_21 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_25 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 25 - 262144 * P_mod27C^[18] f 25 - P_mod27C^[1] f 25 +
      P_mod27C^[0] f 25 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_25 f 18 19 rfl +
      (131072 : ℂ) * P27_step_11 f 17 18 rfl +
      (-262144 : ℂ) * P27_step_25 f 17 18 rfl +
      (131072 : ℂ) * P27_step_26 f 17 18 rfl +
      (-131072 : ℂ) * P27_step_11 f 16 17 rfl +
      (65536 : ℂ) * P27_step_13 f 16 17 rfl +
      (65536 : ℂ) * P27_step_17 f 16 17 rfl +
      (65536 : ℂ) * P27_step_19 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (32768 : ℂ) * P27_step_2 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_17 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_19 f 15 16 rfl +
      (65536 : ℂ) * P27_step_20 f 15 16 rfl +
      (32768 : ℂ) * P27_step_22 f 15 16 rfl +
      (32768 : ℂ) * P27_step_23 f 15 16 rfl +
      (16384 : ℂ) * P27_step_1 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_2 f 14 15 rfl +
      (16384 : ℂ) * P27_step_8 f 14 15 rfl +
      (32768 : ℂ) * P27_step_10 f 14 15 rfl +
      (16384 : ℂ) * P27_step_11 f 14 15 rfl +
      (49152 : ℂ) * P27_step_17 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_20 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_22 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_23 f 14 15 rfl +
      (16384 : ℂ) * P27_step_25 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_26 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_1 f 13 14 rfl +
      (24576 : ℂ) * P27_step_2 f 13 14 rfl +
      (8192 : ℂ) * P27_step_4 f 13 14 rfl +
      (16384 : ℂ) * P27_step_5 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_10 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_11 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_13 f 13 14 rfl +
      (8192 : ℂ) * P27_step_14 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_17 f 13 14 rfl +
      (8192 : ℂ) * P27_step_19 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_20 f 13 14 rfl +
      (24576 : ℂ) * P27_step_22 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_25 f 13 14 rfl +
      (24576 : ℂ) * P27_step_26 f 13 14 rfl +
      (12288 : ℂ) * P27_step_1 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_2 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_5 f 12 13 rfl +
      (4096 : ℂ) * P27_step_7 f 12 13 rfl +
      (12288 : ℂ) * P27_step_8 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_10 f 12 13 rfl +
      (4096 : ℂ) * P27_step_11 f 12 13 rfl +
      (12288 : ℂ) * P27_step_13 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_14 f 12 13 rfl +
      (8192 : ℂ) * P27_step_16 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_19 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_22 f 12 13 rfl +
      (4096 : ℂ) * P27_step_23 f 12 13 rfl +
      (-12288 : ℂ) * P27_step_26 f 12 13 rfl +
      (-2048 : ℂ) * P27_step_1 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (6144 : ℂ) * P27_step_4 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_5 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_7 f 11 12 rfl +
      (2048 : ℂ) * P27_step_11 f 11 12 rfl +
      (-6144 : ℂ) * P27_step_13 f 11 12 rfl +
      (6144 : ℂ) * P27_step_14 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_16 f 11 12 rfl +
      (2048 : ℂ) * P27_step_17 f 11 12 rfl +
      (2048 : ℂ) * P27_step_19 f 11 12 rfl +
      (4096 : ℂ) * P27_step_20 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_23 f 11 12 rfl +
      (2048 : ℂ) * P27_step_25 f 11 12 rfl +
      (-2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (3072 : ℂ) * P27_step_2 f 10 11 rfl +
      (3072 : ℂ) * P27_step_7 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_8 f 10 11 rfl +
      (2048 : ℂ) * P27_step_10 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_11 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_14 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_16 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_17 f 10 11 rfl +
      (1024 : ℂ) * P27_step_19 f 10 11 rfl +
      (-3072 : ℂ) * P27_step_20 f 10 11 rfl +
      (1024 : ℂ) * P27_step_22 f 10 11 rfl +
      (1024 : ℂ) * P27_step_23 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_25 f 10 11 rfl +
      (2048 : ℂ) * P27_step_26 f 10 11 rfl +
      (1536 : ℂ) * P27_step_1 f 9 10 rfl +
      (512 : ℂ) * P27_step_2 f 9 10 rfl +
      (-512 : ℂ) * P27_step_4 f 9 10 rfl +
      (1024 : ℂ) * P27_step_5 f 9 10 rfl +
      (-512 : ℂ) * P27_step_7 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_8 f 9 10 rfl +
      (-1536 : ℂ) * P27_step_10 f 9 10 rfl +
      (512 : ℂ) * P27_step_11 f 9 10 rfl +
      (1024 : ℂ) * P27_step_13 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (512 : ℂ) * P27_step_17 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_19 f 9 10 rfl +
      (512 : ℂ) * P27_step_20 f 9 10 rfl +
      (-512 : ℂ) * P27_step_22 f 9 10 rfl +
      (512 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_25 f 9 10 rfl +
      (-512 : ℂ) * P27_step_26 f 9 10 rfl +
      (256 : ℂ) * P27_step_1 f 8 9 rfl +
      (-768 : ℂ) * P27_step_2 f 8 9 rfl +
      (-512 : ℂ) * P27_step_4 f 8 9 rfl +
      (-768 : ℂ) * P27_step_5 f 8 9 rfl +
      (-512 : ℂ) * P27_step_7 f 8 9 rfl +
      (256 : ℂ) * P27_step_8 f 8 9 rfl +
      (256 : ℂ) * P27_step_10 f 8 9 rfl +
      (-256 : ℂ) * P27_step_11 f 8 9 rfl +
      (-256 : ℂ) * P27_step_13 f 8 9 rfl +
      (768 : ℂ) * P27_step_14 f 8 9 rfl +
      (512 : ℂ) * P27_step_16 f 8 9 rfl +
      (512 : ℂ) * P27_step_17 f 8 9 rfl +
      (256 : ℂ) * P27_step_19 f 8 9 rfl +
      (512 : ℂ) * P27_step_20 f 8 9 rfl +
      (256 : ℂ) * P27_step_22 f 8 9 rfl +
      (-512 : ℂ) * P27_step_23 f 8 9 rfl +
      (256 : ℂ) * P27_step_25 f 8 9 rfl +
      (-256 : ℂ) * P27_step_26 f 8 9 rfl +
      (-384 : ℂ) * P27_step_1 f 7 8 rfl +
      (128 : ℂ) * P27_step_2 f 7 8 rfl +
      (128 : ℂ) * P27_step_4 f 7 8 rfl +
      (128 : ℂ) * P27_step_5 f 7 8 rfl +
      (384 : ℂ) * P27_step_7 f 7 8 rfl +
      (256 : ℂ) * P27_step_10 f 7 8 rfl +
      (256 : ℂ) * P27_step_11 f 7 8 rfl +
      (-128 : ℂ) * P27_step_13 f 7 8 rfl +
      (128 : ℂ) * P27_step_14 f 7 8 rfl +
      (-384 : ℂ) * P27_step_16 f 7 8 rfl +
      (-512 : ℂ) * P27_step_17 f 7 8 rfl +
      (-128 : ℂ) * P27_step_19 f 7 8 rfl +
      (-384 : ℂ) * P27_step_20 f 7 8 rfl +
      (256 : ℂ) * P27_step_22 f 7 8 rfl +
      (128 : ℂ) * P27_step_23 f 7 8 rfl +
      (-256 : ℂ) * P27_step_25 f 7 8 rfl +
      (384 : ℂ) * P27_step_26 f 7 8 rfl +
      (64 : ℂ) * P27_step_1 f 6 7 rfl +
      (-64 : ℂ) * P27_step_2 f 6 7 rfl +
      (128 : ℂ) * P27_step_5 f 6 7 rfl +
      (64 : ℂ) * P27_step_7 f 6 7 rfl +
      (-192 : ℂ) * P27_step_10 f 6 7 rfl +
      (192 : ℂ) * P27_step_13 f 6 7 rfl +
      (-192 : ℂ) * P27_step_14 f 6 7 rfl +
      (64 : ℂ) * P27_step_16 f 6 7 rfl +
      (192 : ℂ) * P27_step_17 f 6 7 rfl +
      (128 : ℂ) * P27_step_19 f 6 7 rfl +
      (64 : ℂ) * P27_step_20 f 6 7 rfl +
      (-256 : ℂ) * P27_step_22 f 6 7 rfl +
      (-64 : ℂ) * P27_step_23 f 6 7 rfl +
      (64 : ℂ) * P27_step_25 f 6 7 rfl +
      (-192 : ℂ) * P27_step_26 f 6 7 rfl +
      (-32 : ℂ) * P27_step_1 f 5 6 rfl +
      (-96 : ℂ) * P27_step_5 f 5 6 rfl +
      (-96 : ℂ) * P27_step_7 f 5 6 rfl +
      (-32 : ℂ) * P27_step_8 f 5 6 rfl +
      (32 : ℂ) * P27_step_10 f 5 6 rfl +
      (-32 : ℂ) * P27_step_11 f 5 6 rfl +
      (-96 : ℂ) * P27_step_13 f 5 6 rfl +
      (32 : ℂ) * P27_step_14 f 5 6 rfl +
      (64 : ℂ) * P27_step_16 f 5 6 rfl +
      (32 : ℂ) * P27_step_17 f 5 6 rfl +
      (64 : ℂ) * P27_step_20 f 5 6 rfl +
      (96 : ℂ) * P27_step_22 f 5 6 rfl +
      (64 : ℂ) * P27_step_23 f 5 6 rfl +
      (-32 : ℂ) * P27_step_25 f 5 6 rfl +
      (32 : ℂ) * P27_step_26 f 5 6 rfl +
      (-16 : ℂ) * P27_step_4 f 4 5 rfl +
      (16 : ℂ) * P27_step_5 f 4 5 rfl +
      (16 : ℂ) * P27_step_7 f 4 5 rfl +
      (32 : ℂ) * P27_step_8 f 4 5 rfl +
      (32 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_11 f 4 5 rfl +
      (16 : ℂ) * P27_step_13 f 4 5 rfl +
      (-16 : ℂ) * P27_step_14 f 4 5 rfl +
      (-48 : ℂ) * P27_step_16 f 4 5 rfl +
      (-32 : ℂ) * P27_step_17 f 4 5 rfl +
      (-16 : ℂ) * P27_step_19 f 4 5 rfl +
      (-48 : ℂ) * P27_step_20 f 4 5 rfl +
      (16 : ℂ) * P27_step_22 f 4 5 rfl +
      (32 : ℂ) * P27_step_25 f 4 5 rfl +
      (16 : ℂ) * P27_step_4 f 3 4 rfl +
      (16 : ℂ) * P27_step_5 f 3 4 rfl +
      (-8 : ℂ) * P27_step_7 f 3 4 rfl +
      (-24 : ℂ) * P27_step_8 f 3 4 rfl +
      (-24 : ℂ) * P27_step_10 f 3 4 rfl +
      (8 : ℂ) * P27_step_11 f 3 4 rfl +
      (8 : ℂ) * P27_step_16 f 3 4 rfl +
      (-8 : ℂ) * P27_step_17 f 3 4 rfl +
      (8 : ℂ) * P27_step_19 f 3 4 rfl +
      (16 : ℂ) * P27_step_20 f 3 4 rfl +
      (-16 : ℂ) * P27_step_22 f 3 4 rfl +
      (-8 : ℂ) * P27_step_23 f 3 4 rfl +
      (16 : ℂ) * P27_step_26 f 3 4 rfl +
      (-12 : ℂ) * P27_step_4 f 2 3 rfl +
      (-12 : ℂ) * P27_step_5 f 2 3 rfl +
      (8 : ℂ) * P27_step_8 f 2 3 rfl +
      (8 : ℂ) * P27_step_10 f 2 3 rfl +
      (-8 : ℂ) * P27_step_11 f 2 3 rfl +
      (8 : ℂ) * P27_step_13 f 2 3 rfl +
      (8 : ℂ) * P27_step_16 f 2 3 rfl +
      (8 : ℂ) * P27_step_17 f 2 3 rfl +
      (4 : ℂ) * P27_step_19 f 2 3 rfl +
      (-4 : ℂ) * P27_step_22 f 2 3 rfl +
      (4 : ℂ) * P27_step_23 f 2 3 rfl +
      (-4 : ℂ) * P27_step_25 f 2 3 rfl +
      (-8 : ℂ) * P27_step_26 f 2 3 rfl +
      (4 : ℂ) * P27_step_4 f 1 2 rfl +
      (4 : ℂ) * P27_step_5 f 1 2 rfl +
      (-4 : ℂ) * P27_step_13 f 1 2 rfl +
      (-6 : ℂ) * P27_step_16 f 1 2 rfl +
      (-4 : ℂ) * P27_step_17 f 1 2 rfl +
      (-4 : ℂ) * P27_step_19 f 1 2 rfl +
      (4 : ℂ) * P27_step_22 f 1 2 rfl +
      (2 : ℂ) * P27_step_23 f 1 2 rfl +
      (2 : ℂ) * P27_step_25 f 1 2 rfl +
      (2 : ℂ) * P27_step_26 f 1 2 rfl +
      (1 : ℂ) * P27_step_13 f 0 1 rfl +
      (2 : ℂ) * P27_step_16 f 0 1 rfl +
      (-2 : ℂ) * P27_step_22 f 0 1 rfl +
      (-2 : ℂ) * P27_step_23 f 0 1 rfl

set_option maxHeartbeats 4000000 in
lemma P27_annih_at_26 (f : ZMod 27 → ℂ) :
    262144 * P_mod27C^[19] f 26 - 262144 * P_mod27C^[18] f 26 - P_mod27C^[1] f 26 +
      P_mod27C^[0] f 26 = 0 := by
  linear_combination (262144 : ℂ) * P27_step_26 f 18 19 rfl +
      (131072 : ℂ) * P27_step_13 f 17 18 rfl +
      (-131072 : ℂ) * P27_step_26 f 17 18 rfl +
      (-65536 : ℂ) * P27_step_13 f 16 17 rfl +
      (131072 : ℂ) * P27_step_20 f 16 17 rfl +
      (-65536 : ℂ) * P27_step_26 f 16 17 rfl +
      (65536 : ℂ) * P27_step_10 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_13 f 15 16 rfl +
      (65536 : ℂ) * P27_step_17 f 15 16 rfl +
      (-65536 : ℂ) * P27_step_20 f 15 16 rfl +
      (-32768 : ℂ) * P27_step_26 f 15 16 rfl +
      (32768 : ℂ) * P27_step_2 f 14 15 rfl +
      (32768 : ℂ) * P27_step_5 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_10 f 14 15 rfl +
      (-16384 : ℂ) * P27_step_13 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_17 f 14 15 rfl +
      (-32768 : ℂ) * P27_step_20 f 14 15 rfl +
      (32768 : ℂ) * P27_step_22 f 14 15 rfl +
      (16384 : ℂ) * P27_step_26 f 14 15 rfl +
      (16384 : ℂ) * P27_step_1 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_2 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_5 f 13 14 rfl +
      (16384 : ℂ) * P27_step_8 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_10 f 13 14 rfl +
      (16384 : ℂ) * P27_step_11 f 13 14 rfl +
      (8192 : ℂ) * P27_step_13 f 13 14 rfl +
      (16384 : ℂ) * P27_step_16 f 13 14 rfl +
      (-16384 : ℂ) * P27_step_22 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_26 f 13 14 rfl +
      (-8192 : ℂ) * P27_step_1 f 12 13 rfl +
      (8192 : ℂ) * P27_step_4 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_5 f 12 13 rfl +
      (-4096 : ℂ) * P27_step_13 f 12 13 rfl +
      (8192 : ℂ) * P27_step_14 f 12 13 rfl +
      (-8192 : ℂ) * P27_step_16 f 12 13 rfl +
      (8192 : ℂ) * P27_step_19 f 12 13 rfl +
      (4096 : ℂ) * P27_step_26 f 12 13 rfl +
      (4096 : ℂ) * P27_step_2 f 11 12 rfl +
      (4096 : ℂ) * P27_step_7 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_8 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_11 f 11 12 rfl +
      (2048 : ℂ) * P27_step_13 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_14 f 11 12 rfl +
      (-4096 : ℂ) * P27_step_16 f 11 12 rfl +
      (4096 : ℂ) * P27_step_23 f 11 12 rfl +
      (2048 : ℂ) * P27_step_26 f 11 12 rfl +
      (2048 : ℂ) * P27_step_1 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_4 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_7 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_8 f 10 11 rfl +
      (1024 : ℂ) * P27_step_13 f 10 11 rfl +
      (2048 : ℂ) * P27_step_17 f 10 11 rfl +
      (-2048 : ℂ) * P27_step_19 f 10 11 rfl +
      (2048 : ℂ) * P27_step_20 f 10 11 rfl +
      (2048 : ℂ) * P27_step_25 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_26 f 10 11 rfl +
      (-1024 : ℂ) * P27_step_2 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_4 f 9 10 rfl +
      (1024 : ℂ) * P27_step_10 f 9 10 rfl +
      (-512 : ℂ) * P27_step_13 f 9 10 rfl +
      (1024 : ℂ) * P27_step_14 f 9 10 rfl +
      (1024 : ℂ) * P27_step_22 f 9 10 rfl +
      (-1024 : ℂ) * P27_step_23 f 9 10 rfl +
      (512 : ℂ) * P27_step_26 f 9 10 rfl +
      (-512 : ℂ) * P27_step_1 f 8 9 rfl +
      (512 : ℂ) * P27_step_5 f 8 9 rfl +
      (512 : ℂ) * P27_step_7 f 8 9 rfl +
      (512 : ℂ) * P27_step_11 f 8 9 rfl +
      (256 : ℂ) * P27_step_13 f 8 9 rfl +
      (-512 : ℂ) * P27_step_17 f 8 9 rfl +
      (-512 : ℂ) * P27_step_20 f 8 9 rfl +
      (-512 : ℂ) * P27_step_25 f 8 9 rfl +
      (256 : ℂ) * P27_step_26 f 8 9 rfl +
      (-256 : ℂ) * P27_step_2 f 7 8 rfl +
      (256 : ℂ) * P27_step_8 f 7 8 rfl +
      (-256 : ℂ) * P27_step_10 f 7 8 rfl +
      (128 : ℂ) * P27_step_13 f 7 8 rfl +
      (-256 : ℂ) * P27_step_14 f 7 8 rfl +
      (256 : ℂ) * P27_step_16 f 7 8 rfl +
      (256 : ℂ) * P27_step_17 f 7 8 rfl +
      (256 : ℂ) * P27_step_19 f 7 8 rfl +
      (256 : ℂ) * P27_step_20 f 7 8 rfl +
      (-256 : ℂ) * P27_step_22 f 7 8 rfl +
      (-384 : ℂ) * P27_step_26 f 7 8 rfl +
      (-128 : ℂ) * P27_step_1 f 6 7 rfl +
      (128 : ℂ) * P27_step_4 f 6 7 rfl +
      (-128 : ℂ) * P27_step_5 f 6 7 rfl +
      (-128 : ℂ) * P27_step_7 f 6 7 rfl +
      (128 : ℂ) * P27_step_10 f 6 7 rfl +
      (-192 : ℂ) * P27_step_13 f 6 7 rfl +
      (128 : ℂ) * P27_step_22 f 6 7 rfl +
      (128 : ℂ) * P27_step_23 f 6 7 rfl +
      (64 : ℂ) * P27_step_26 f 6 7 rfl +
      (64 : ℂ) * P27_step_2 f 5 6 rfl +
      (64 : ℂ) * P27_step_5 f 5 6 rfl +
      (32 : ℂ) * P27_step_13 f 5 6 rfl +
      (-64 : ℂ) * P27_step_14 f 5 6 rfl +
      (-64 : ℂ) * P27_step_16 f 5 6 rfl +
      (-64 : ℂ) * P27_step_17 f 5 6 rfl +
      (-64 : ℂ) * P27_step_20 f 5 6 rfl +
      (64 : ℂ) * P27_step_25 f 5 6 rfl +
      (32 : ℂ) * P27_step_26 f 5 6 rfl +
      (32 : ℂ) * P27_step_1 f 4 5 rfl +
      (-32 : ℂ) * P27_step_7 f 4 5 rfl +
      (-32 : ℂ) * P27_step_8 f 4 5 rfl +
      (-32 : ℂ) * P27_step_10 f 4 5 rfl +
      (16 : ℂ) * P27_step_13 f 4 5 rfl +
      (32 : ℂ) * P27_step_16 f 4 5 rfl +
      (32 : ℂ) * P27_step_20 f 4 5 rfl +
      (-32 : ℂ) * P27_step_22 f 4 5 rfl +
      (16 : ℂ) * P27_step_26 f 4 5 rfl +
      (-16 : ℂ) * P27_step_4 f 3 4 rfl +
      (-16 : ℂ) * P27_step_5 f 3 4 rfl +
      (16 : ℂ) * P27_step_8 f 3 4 rfl +
      (16 : ℂ) * P27_step_10 f 3 4 rfl +
      (-16 : ℂ) * P27_step_11 f 3 4 rfl +
      (8 : ℂ) * P27_step_13 f 3 4 rfl +
      (16 : ℂ) * P27_step_14 f 3 4 rfl +
      (-8 : ℂ) * P27_step_26 f 3 4 rfl +
      (8 : ℂ) * P27_step_4 f 2 3 rfl +
      (8 : ℂ) * P27_step_5 f 2 3 rfl +
      (8 : ℂ) * P27_step_7 f 2 3 rfl +
      (-4 : ℂ) * P27_step_13 f 2 3 rfl +
      (-8 : ℂ) * P27_step_16 f 2 3 rfl +
      (-8 : ℂ) * P27_step_17 f 2 3 rfl +
      (-8 : ℂ) * P27_step_19 f 2 3 rfl +
      (4 : ℂ) * P27_step_26 f 2 3 rfl +
      (2 : ℂ) * P27_step_13 f 1 2 rfl +
      (4 : ℂ) * P27_step_16 f 1 2 rfl +
      (4 : ℂ) * P27_step_17 f 1 2 rfl +
      (-4 : ℂ) * P27_step_22 f 1 2 rfl +
      (-4 : ℂ) * P27_step_23 f 1 2 rfl +
      (-2 : ℂ) * P27_step_26 f 1 2 rfl +
      (-1 : ℂ) * P27_step_13 f 0 1 rfl +
      (2 : ℂ) * P27_step_22 f 0 1 rfl +
      (-2 : ℂ) * P27_step_25 f 0 1 rfl

/--
Annihilating Polynomial Identity at Level `j = 3`:
The separable polynomial `(X - 1)((2X)¹⁸ - 1) = 262144 X¹⁹ - 262144 X¹⁸ - X + 1`
annihilates `P_mod27C` identically on `ZMod 27 → ℂ`.
-/
theorem P_mod27C_annihilating_poly (f : ZMod 27 → ℂ) (v : ZMod 27) :
    262144 * (P_mod27C^[19] f v) - 262144 * (P_mod27C^[18] f v) - P_mod27C f v + f v = 0 := by
  show 262144 * P_mod27C^[19] f v - 262144 * P_mod27C^[18] f v - P_mod27C^[1] f v +
    P_mod27C^[0] f v = 0
  have key : ∀ w : ZMod 27, w = 0 ∨ w = 1 ∨ w = 2 ∨ w = 3 ∨ w = 4 ∨ w = 5 ∨ w = 6 ∨ w = 7 ∨ w = 8 ∨ w = 9 ∨ w = 10 ∨ w = 11 ∨ w = 12 ∨ w = 13 ∨ w = 14 ∨ w = 15 ∨ w = 16 ∨ w = 17 ∨ w = 18 ∨ w = 19 ∨ w = 20 ∨ w = 21 ∨ w = 22 ∨ w = 23 ∨ w = 24 ∨ w = 25 ∨ w = 26 := by decide
  rcases key v with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact P27_annih_at_0 f
  · exact P27_annih_at_1 f
  · exact P27_annih_at_2 f
  · exact P27_annih_at_3 f
  · exact P27_annih_at_4 f
  · exact P27_annih_at_5 f
  · exact P27_annih_at_6 f
  · exact P27_annih_at_7 f
  · exact P27_annih_at_8 f
  · exact P27_annih_at_9 f
  · exact P27_annih_at_10 f
  · exact P27_annih_at_11 f
  · exact P27_annih_at_12 f
  · exact P27_annih_at_13 f
  · exact P27_annih_at_14 f
  · exact P27_annih_at_15 f
  · exact P27_annih_at_16 f
  · exact P27_annih_at_17 f
  · exact P27_annih_at_18 f
  · exact P27_annih_at_19 f
  · exact P27_annih_at_20 f
  · exact P27_annih_at_21 f
  · exact P27_annih_at_22 f
  · exact P27_annih_at_23 f
  · exact P27_annih_at_24 f
  · exact P27_annih_at_25 f
  · exact P27_annih_at_26 f
 
/-- Iteration of `P_mod27C` on an eigenfunction `P_mod27C f = lam • f`. -/
lemma P_mod27C_iterate_eigenfunction (f : ZMod 27 → ℂ) (lam : ℂ)
    (heig : ∀ v : ZMod 27, P_mod27C f v = lam * f v) (k : ℕ) (v : ZMod 27) :
    P_mod27C^[k] f v = lam ^ k * f v := by
  induction k generalizing v with
  | zero => simp
  | succ k ih =>
    rw [Function.iterate_succ_apply']
    have hP : P_mod27C (P_mod27C^[k] f) v = lam * (P_mod27C^[k] f v) := by
      simp only [P_mod27C, ih]
      have h := heig v
      simp only [P_mod27C] at h
      linear_combination (lam ^ k) * h
    rw [hP, ih]
    ring
 
/--
Complex Eigenvalue Modulus Bound at Level `j = 3` (`|λ₂(P_mod27C)| = 1/2`):
Every complex eigenvalue `lam : ℂ` of `P_mod27C` satisfies either `lam = 1` or `‖lam‖ = 1 / 2`.
-/
theorem mod27C_spectrum_exact_modulus (f : ZMod 27 → ℂ) (lam : ℂ)
    (heig : ∀ v : ZMod 27, P_mod27C f v = lam * f v)
    (hnz : ∃ v : ZMod 27, f v ≠ 0) :
    lam = 1 ∨ ‖lam‖ = 1 / 2 := by
  obtain ⟨v₀, hv₀⟩ := hnz
  have hpoly := P_mod27C_annihilating_poly f v₀
  rw [P_mod27C_iterate_eigenfunction f lam heig 19 v₀,
    P_mod27C_iterate_eigenfunction f lam heig 18 v₀,
    heig v₀] at hpoly
  have hfac : ((lam - 1) * (262144 * lam ^ 18 - 1)) * f v₀ = 0 := by
    linear_combination hpoly
  have hroot : (lam - 1) * (262144 * lam ^ 18 - 1) = 0 :=
    (mul_eq_zero.mp hfac).resolve_right hv₀
  rcases mul_eq_zero.mp hroot with h1 | h18
  · left
    exact sub_eq_zero.mp h1
  · right
    have hpow : (2 * lam) ^ 18 = 1 := by
      linear_combination h18
    have hnorm : ‖(2 * lam) ^ 18‖ = ‖(1 : ℂ)‖ := congrArg norm hpow
    simp only [norm_pow, norm_mul, norm_one] at hnorm
    have h2 : ‖(2 : ℂ)‖ = 2 := by norm_num
    rw [h2] at hnorm
    have hnonneg : 0 ≤ 2 * ‖lam‖ := by positivity
    have hpos_eq : 2 * ‖lam‖ = 1 := by
      have h1' : (2 * ‖lam‖) ^ 18 = (1 : ℝ) ^ 18 := by
        rw [hnorm]; norm_num
      exact (pow_left_inj₀ hnonneg (by norm_num) (by norm_num)).mp h1'
    linarith
 
/-- `P_mod27C` commutes with the canonical embedding `ℝ →+* ℂ` (`Complex.ofReal`). -/
lemma P_mod27C_ofReal (f : ZMod 27 → ℝ) (v : ZMod 27) :
    P_mod27C (fun x => (f x : ℂ)) v = (P_mod27 f v : ℂ) := by
  simp only [P_mod27C, P_mod27]
  push_cast
  rfl
 
/--
Real Eigenvalue Modulus Bound at Level `j = 3` (`|λ₂(P_mod27)| = 1/2`):
Every real eigenvalue `lam : ℝ` of `P_mod27` satisfies either `lam = 1` or `|lam| = 1 / 2`.
-/
theorem mod27_spectrum_exact_modulus (f : ZMod 27 → ℝ) (lam : ℝ)
    (heig : ∀ v : ZMod 27, P_mod27 f v = lam * f v)
    (hnz : ∃ v : ZMod 27, f v ≠ 0) :
    lam = 1 ∨ |lam| = 1 / 2 := by
  have heigC : ∀ v : ZMod 27, P_mod27C (fun x => (f x : ℂ)) v = (lam : ℂ) * (f v : ℂ) := by
    intro v
    rw [P_mod27C_ofReal, heig v]
    push_cast
    rfl
  have hnzC : ∃ v : ZMod 27, (f v : ℂ) ≠ 0 := by
    obtain ⟨v, hv⟩ := hnz
    exact ⟨v, Complex.ofReal_ne_zero.mpr hv⟩
  rcases mod27C_spectrum_exact_modulus (fun x => (f x : ℂ)) (lam : ℂ) heigC hnzC with h1 | hnorm
  · left
    exact_mod_cast h1
  · right
    simpa [Complex.norm_real] using hnorm
 
/-! ### Section 6: Transient Reduction `3ℤ/3^jℤ ≅ ℤ/3^{j-1}ℤ`, Stabilization of `dim E_{±1/2}`, Growth of the Unit Spectrum -/
 
/--
Level-`j` coin-flip transfer operator over `ℂ` (general `j`, completing `P_mod9C` / `P_mod27C`).
-/
def P_levelC (j : ℕ) (f : ZMod (3 ^ j) → ℂ) (v : ZMod (3 ^ j)) : ℂ :=
  (1 / 2 : ℂ) * f ((2 : ZMod (3 ^ j))⁻¹ * v) +
  (1 / 2 : ℂ) * f ((2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1))
 
/-- `P_levelC j` as a `ℂ`-linear endomorphism of `ZMod (3 ^ j) → ℂ`. -/
def P_levelC_end (j : ℕ) : Module.End ℂ (ZMod (3 ^ j) → ℂ) where
  toFun f v := P_levelC j f v
  map_add' f g := by
    funext v
    simp only [P_levelC, Pi.add_apply]
    ring
  map_smul' c f := by
    funext v
    simp only [P_levelC, Pi.smul_apply, smul_eq_mul, RingHom.id_apply]
    ring
 
/-- Eigenspace `E_lam(P_j)` over `ℂ`, as the kernel of `P_levelC_end j - lam • 1`. -/
def eigenspaceC (j : ℕ) (lam : ℂ) : Submodule ℂ (ZMod (3 ^ j) → ℂ) :=
  LinearMap.ker (P_levelC_end j - lam • LinearMap.id)
 
/-- Membership in `eigenspaceC` unfolds to the pointwise eigen-equation. -/
theorem mem_eigenspaceC (j : ℕ) (lam : ℂ) (f : ZMod (3 ^ j) → ℂ) :
    f ∈ eigenspaceC j lam ↔ ∀ v : ZMod (3 ^ j), P_levelC j f v = lam * f v := by
  simp only [eigenspaceC, LinearMap.mem_ker, LinearMap.sub_apply,
    P_levelC_end, LinearMap.smul_apply, LinearMap.id_apply, smul_eq_mul,
    Pi.sub_apply, Pi.smul_apply]
  constructor
  · intro h v
    have hv := congrFun h v
    simpa [sub_eq_zero] using hv
  · intro h
    funext v
    show P_levelC j f v - lam * f v = 0
    rw [h v, sub_self]
 
/-! #### The transient isomorphism `3ℤ/3^jℤ ≅ ℤ/3^{j-1}ℤ` -/
 
/-- The `3`-multiplication map `ZMod (3 ^ (j-1)) → ZMod (3 ^ j)`, `y ↦ 3 * y.val`. (This is
additive but not induced by a ring hom: there is no ring hom `ZMod (3 ^ (j-1)) → ZMod (3 ^ j)`.) -/
def threeMul (j : ℕ) (_hj : 1 ≤ j) : ZMod (3 ^ (j - 1)) → ZMod (3 ^ j) :=
  fun y => 3 * ((y.val : ℕ) : ZMod (3 ^ j))

lemma three_pow_pred_mul (j : ℕ) (hj : 1 ≤ j) : 3 * 3 ^ (j - 1) = 3 ^ j := by
  rw [← pow_succ', Nat.sub_add_cancel hj]

/-- `3 * (t mod 3^(j-1)) ≡ 3 * t (mod 3^j)`. -/
lemma three_mul_mod_cast (j : ℕ) (hj : 1 ≤ j) (t : ℕ) :
    ((3 * (t % 3 ^ (j - 1)) : ℕ) : ZMod (3 ^ j)) = ((3 * t : ℕ) : ZMod (3 ^ j)) := by
  rw [ZMod.natCast_eq_natCast_iff', ← three_pow_pred_mul j hj, Nat.mul_mod_mul_left,
    Nat.mul_mod_mul_left, Nat.mod_mod]

/-- `threeMul` is injective: `3 * y.val < 3 ^ j`, so `3 * y.val` determines `y.val`. -/
theorem threeMul_injective (j : ℕ) (hj : 1 ≤ j) : Function.Injective (threeMul j hj) := by
  intro a b hab
  have hpow := three_pow_pred_mul j hj
  have ha : 3 * a.val < 3 ^ j := by have := ZMod.val_lt a; omega
  have hb : 3 * b.val < 3 ^ j := by have := ZMod.val_lt b; omega
  have h' : ((3 * a.val : ℕ) : ZMod (3 ^ j)) = ((3 * b.val : ℕ) : ZMod (3 ^ j)) := by
    push_cast
    exact hab
  rw [ZMod.natCast_eq_natCast_iff', Nat.mod_eq_of_lt ha, Nat.mod_eq_of_lt hb] at h'
  exact ZMod.val_injective _ (by omega)

/-- The image of `threeMul` is exactly the multiples of `3` in `ZMod (3 ^ j)`,
i.e. the transient subgroup `3ℤ/3^jℤ`. -/
theorem threeMul_range (j : ℕ) (hj : 1 ≤ j) :
    Set.range (threeMul j hj) = {x : ZMod (3 ^ j) | ∃ y : ZMod (3 ^ j), x = 3 * y} := by
  ext x
  constructor
  · rintro ⟨y, rfl⟩
    exact ⟨_, rfl⟩
  · rintro ⟨y, rfl⟩
    refine ⟨(y.val : ZMod (3 ^ (j - 1))), ?_⟩
    have key := three_mul_mod_cast j hj y.val
    push_cast at key
    rw [ZMod.natCast_zmod_val] at key
    simp only [threeMul, ZMod.val_natCast]
    exact key

/-- `threeMul` is additive. -/
lemma threeMul_add (j : ℕ) (hj : 1 ≤ j) (a b : ZMod (3 ^ (j - 1))) :
    threeMul j hj (a + b) = threeMul j hj a + threeMul j hj b := by
  have key := three_mul_mod_cast j hj (a.val + b.val)
  push_cast at key
  simp only [threeMul, ZMod.val_add]
  rw [key]
  ring

/-- The multiples of `3` in `ZMod (3 ^ j)`, as an additive subgroup. -/
def threeMulSubgroup (j : ℕ) : AddSubgroup (ZMod (3 ^ j)) :=
  (AddMonoidHom.mulLeft (3 : ZMod (3 ^ j))).range

/-- The transient reduction isomorphism `ℤ/3^{j-1}ℤ ≃ 3ℤ/3^jℤ`, as an additive equivalence
onto the subgroup of multiples of `3`. (Earlier versions used the subtype
`{x // ∃ y, x = 3 * y}`, which carries no additive structure.) -/
noncomputable def transientEquiv (j : ℕ) (hj : 1 ≤ j) :
    ZMod (3 ^ (j - 1)) ≃+ threeMulSubgroup j :=
  AddEquiv.ofBijective
    ({ toFun := fun y => ⟨threeMul j hj y, AddMonoidHom.mem_range.mpr ⟨((y.val : ℕ) : ZMod (3 ^ j)), rfl⟩⟩
       map_zero' := by
         apply Subtype.ext
         simp [threeMul]
       map_add' := fun a b => Subtype.ext (threeMul_add j hj a b) } :
      ZMod (3 ^ (j - 1)) →+ threeMulSubgroup j)
    ⟨fun a b hab => threeMul_injective j hj (congrArg Subtype.val hab), by
      rintro ⟨x, hx0⟩
      obtain ⟨y, rfl⟩ := AddMonoidHom.mem_range.mp hx0
      have hx : (3 : ZMod (3 ^ j)) * y ∈ Set.range (threeMul j hj) := by
        rw [threeMul_range j hj]
        exact ⟨y, rfl⟩
      obtain ⟨z, hz⟩ := hx
      exact ⟨z, Subtype.ext hz⟩⟩

/-! #### Why `dim E_{±1/2}(P_j) = 2` stabilizes -/
 
/-- Helper: `P_levelC` commutes with `Complex.ofReal` at every level `j`. -/
lemma P_levelC_ofReal (j : ℕ) (f : ZMod (3 ^ j) → ℝ) (v : ZMod (3 ^ j)) :
    P_levelC j (fun x => (f x : ℂ)) v = (P_level j f v : ℂ) := by
  simp only [P_levelC, P_level]
  push_cast
  rfl
 
/-- Helper: `LinearIndependent ℝ` of real functions implies `LinearIndependent ℂ` of their
`Complex.ofReal` embeddings. -/
lemma linearIndependent_ofReal {ι α : Type*} [Fintype ι] {v : ι → α → ℝ}
    (hv : LinearIndependent ℝ v) :
    LinearIndependent ℂ (fun i x => (v i x : ℂ)) := by
  rw [Fintype.linearIndependent_iff] at hv ⊢
  intro c hc
  have hre : ∀ x, ∑ i, (c i).re * v i x = 0 := by
    intro x
    have hx := congrArg Complex.re (congrFun hc x)
    simpa [Complex.add_re, Complex.mul_re] using hx
  have him : ∀ x, ∑ i, (c i).im * v i x = 0 := by
    intro x
    have hx := congrArg Complex.im (congrFun hc x)
    simpa [Complex.add_im, Complex.mul_im] using hx
  have hcre : ∀ i, (c i).re = 0 := hv (fun i => (c i).re) (funext fun x => by
    simpa only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply] using hre x)
  have hcim : ∀ i, (c i).im = 0 := hv (fun i => (c i).im) (funext fun x => by
    simpa only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply] using him x)
  intro i
  exact Complex.ext (by rw [hcre i, Complex.zero_re]) (by rw [hcim i, Complex.zero_im])
 
/- Real lifts from Section 3–4, viewed over `ℂ`: the two `+1/2` directions at every `j ≥ 2`. -/
/-- `dim E_{+1/2}(P_j) ≥ 2` over `ℂ` for all `j ≥ 2`. -/
theorem plus_half_dim_ge_two (j : ℕ) (hj : 2 ≤ j) :
    2 ≤ Module.finrank ℂ (eigenspaceC j (1 / 2 : ℂ)) := by
  let b : Fin 2 → (ZMod (3 ^ j) → ℂ) :=
    fun i x => (![lifted9 j hj witness9_zero, lifted9 j hj witness9_plus] i x : ℂ)
  have hb_li : LinearIndependent ℂ b :=
    linearIndependent_ofReal (plus_half_witnesses_linearIndependent j hj)
  have hb_mem : ∀ i : Fin 2, b i ∈ eigenspaceC j (1 / 2 : ℂ) := by
    intro i
    rw [mem_eigenspaceC]
    intro v
    fin_cases i
    · dsimp [b]
      rw [P_levelC_ofReal, lifted9_zero_is_eigenfunction j hj v]
      push_cast; rfl
    · dsimp [b]
      rw [P_levelC_ofReal, lifted9_plus_is_eigenfunction j hj v]
      push_cast; rfl
  let b' : Fin 2 → eigenspaceC j (1 / 2 : ℂ) := fun i => ⟨b i, hb_mem i⟩
  have hb'_li : LinearIndependent ℂ b' :=
    hb_li.of_comp (eigenspaceC j (1 / 2 : ℂ)).subtype
  simpa using hb'_li.fintype_card_le_finrank
 
/- Likewise for `-1/2`. -/
/-- `dim E_{-1/2}(P_j) ≥ 2` over `ℂ` for all `j ≥ 2`. -/
theorem minus_half_dim_ge_two (j : ℕ) (hj : 2 ≤ j) :
    2 ≤ Module.finrank ℂ (eigenspaceC j (-1 / 2 : ℂ)) := by
  let b : Fin 2 → (ZMod (3 ^ j) → ℂ) :=
    fun i x => (![f_lifted j (by omega), lifted9 j hj witness9_minus] i x : ℂ)
  have hb_li : LinearIndependent ℂ b :=
    linearIndependent_ofReal (minus_half_witnesses_linearIndependent j hj)
  have hb_mem : ∀ i : Fin 2, b i ∈ eigenspaceC j (-1 / 2 : ℂ) := by
    intro i
    rw [mem_eigenspaceC]
    intro v
    fin_cases i
    · dsimp [b]
      rw [P_levelC_ofReal, f_lifted_is_eigenfunction j (by omega) v]
      push_cast; rfl
    · dsimp [b]
      rw [P_levelC_ofReal, lifted9_minus_is_eigenfunction j hj v]
      push_cast; rfl
  let b' : Fin 2 → eigenspaceC j (-1 / 2 : ℂ) := fun i => ⟨b i, hb_mem i⟩
  have hb'_li : LinearIndependent ℂ b' :=
    hb_li.of_comp (eigenspaceC j (-1 / 2 : ℂ)).subtype
  simpa using hb'_li.fintype_card_le_finrank
 
/-
**CORRECTION (Notes_5): the lift claim below is FALSE for `j ≥ 3`.**
`eigenfunction_is_lift_from_level_two` (every `±1/2`-eigenfunction factors through
`projMod9`) is false: e.g. `1_{0}` on `ZMod 27` is a `+1/2`-eigenfunction
(`oneZero_is_plus_half_eigenfunction`) that is `1` at `0` and `0` at `9`,
while both `0` and `9` project to `0` in `ZMod 9` — so it cannot factor through
`projMod9`. The true statement is `dim E_{±1/2}(P_j) = j` (see `dim_eigenspace_half_eq_j`
below), with a basis given by the transient shells, not by level-2 lifts.
The old theorem is therefore replaced by its negation, proved by the counterexample.
-/
/-- Indicator of `{0}` in `ZMod (3 ^ j)`, over `ℂ`. -/
def oneZero (j : ℕ) (v : ZMod (3 ^ j)) : ℂ := if v = 0 then 1 else 0
 
/-- `1_{0}` is a `+1/2`-eigenfunction at every level `j ≥ 1`: the first branch
`2⁻¹ * v` is `0` iff `v = 0` (since `2⁻¹` is a unit), and the second branch
`2⁻¹ * (3 * v + 1)` is never `0` (since `3 * v + 1 ≡ 1 (mod 3)`). -/
theorem oneZero_is_plus_half_eigenfunction (j : ℕ) (hj : 1 ≤ j)
    (v : ZMod (3 ^ j)) :
    P_levelC j (oneZero j) v = (1 / 2 : ℂ) * oneZero j v := by
  have h2unit : IsUnit (2 : ZMod (3 ^ j)) := by
    rw [← ZMod.natCast_zmod_val (2 : ZMod (3 ^ j)), ZMod.isUnit_iff_coprime]
    have hval : ((2 : ZMod (3 ^ j)).val) = 2 := by
      have h2j : 2 < 3 ^ j := by
        have h3j : 3 ≤ 3 ^ j := by
          calc 3 = 3 ^ 1 := by norm_num
            _ ≤ 3 ^ j := Nat.pow_le_pow_right (by decide) hj
        omega
      rw [show (2 : ZMod (3 ^ j)) = ((2 : ℕ) : ZMod (3 ^ j)) by norm_num, ZMod.val_natCast,
        Nat.mod_eq_of_lt h2j]
    rw [hval]
    exact Nat.Coprime.pow_right j (by decide : Nat.Coprime 2 3)
  have hfirst : (2 : ZMod (3 ^ j))⁻¹ * v = 0 ↔ v = 0 := by
    constructor
    · intro h
      have : v = (2 : ZMod (3 ^ j)) * ((2 : ZMod (3 ^ j))⁻¹ * v) := by
        rw [← mul_assoc, two_mul_inv_two_pow j, one_mul]
      rw [h, mul_zero] at this
      exact this
    · intro h
      rw [h, mul_zero]
  have hsecond : (2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1) ≠ 0 := by
    intro h
    have h3v1 : (3 * v + 1 : ZMod (3 ^ j)) = 0 := by
      have : (3 * v + 1 : ZMod (3 ^ j)) =
          (2 : ZMod (3 ^ j)) * ((2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1)) := by
        rw [← mul_assoc, two_mul_inv_two_pow j, one_mul]
      rw [h, mul_zero] at this
      exact this
    have hproj := congrArg (projMod3 j hj) h3v1
    -- `projMod3 (3 * v) = 3 * projMod3 v = 0` in `ZMod 3`, so `hproj : (1 : ZMod 3) = 0`.
    rw [map_add, map_mul, map_ofNat, map_one, map_zero, show (3 : ZMod 3) = 0 by decide,
      zero_mul, zero_add] at hproj
    exact absurd hproj (by decide)
  simp only [P_levelC, oneZero]
  by_cases hv : v = 0
  · subst hv
    rw [if_pos (hfirst.mpr rfl), if_neg hsecond, if_pos (rfl : (0 : ZMod (3 ^ j)) = 0)]
    ring
  · rw [if_neg hv]
    have h1 : (2 : ZMod (3 ^ j))⁻¹ * v ≠ 0 := by
      intro h
      exact hv (hfirst.mp h)
    rw [if_neg h1, if_neg hsecond]
    ring
 
/-- The lift claim is FALSE: `1_{0}` on `ZMod 27` does not factor through `projMod9`. -/
theorem eigenfunction_is_lift_from_level_two_is_false :
    ¬ ∀ (j : ℕ) (hj : 2 ≤ j) (lam : ℂ), lam = 1 / 2 ∨ lam = -1 / 2 →
      ∀ (f : ZMod (3 ^ j) → ℂ), f ∈ eigenspaceC j lam →
        ∃ g : ZMod 9 → ℂ, ∀ v : ZMod (3 ^ j), f v = g (projMod9 j hj v) := by
  intro h
  have hf : oneZero 3 ∈ eigenspaceC 3 (1 / 2 : ℂ) := by
    rw [mem_eigenspaceC]
    intro v
    exact oneZero_is_plus_half_eigenfunction 3 (by norm_num) v
  obtain ⟨g, hg⟩ := h 3 (by norm_num) (1 / 2 : ℂ) (Or.inl rfl) (oneZero 3) hf
  have h0 := hg 0
  have h9 := hg 9
  -- Both `0` and `(9 : ZMod 27)` project to `0` in `ZMod 9`.
  have hproj9 : projMod9 3 (by norm_num : 2 ≤ 3) (9 : ZMod 27) = 0 := by decide
  have hproj0 : projMod9 3 (by norm_num : 2 ≤ 3) (0 : ZMod 27) = 0 := map_zero _
  rw [hproj0] at h0
  rw [hproj9] at h9
  -- `oneZero 3 0 = 1` but `oneZero 3 9 = 0`, while both equal `g 0`. Contradiction.
  have h1 : oneZero 3 (0 : ZMod 27) = 1 := if_pos rfl
  -- `(9 : ZMod 27) ≠ 0` since `27 ∤ 9`.
  have h2 : oneZero 3 (9 : ZMod 27) = 0 := if_neg (by decide)
  rw [h1] at h0
  rw [h2] at h9
  rw [← h0] at h9
  exact zero_ne_one h9
 
/- Upper bound: `dim E_{±1/2}(P_j) ≤ j`. The transient kernel splits into the
`j - 1` shells `3^k · (ZMod 3^{j-k})^×` plus `{0}`; each shell contributes at most
one dimension to each of `E_{±1/2}` (constant / alternating on the single
`2⁻¹`-cycle), `{0}` contributes at most one to `E_{+1/2}` and none to `E_{-1/2}`,
and the units contribute at most `0` to `E_{+1/2}` and at most `1` to `E_{-1/2}`
(closed by Notes_9: rank-nullity over the fiber-difference map). -/
/-- Base case `j = 1` (`ZMod 3`) upper bound: `finrank ℂ (eigenspaceC 1 lam) ≤ 1`. -/
lemma dim_eigenspace_half_le_one (lam : ℂ) (hlam : lam = 1 / 2 ∨ lam = -1 / 2) :
    Module.finrank ℂ (eigenspaceC 1 lam) ≤ 1 := by
  have hsub : eigenspaceC 1 lam ≤ Submodule.span ℂ
      (if lam = 1 / 2 then {oneZero 1}
       else {fun v => (f_lifted 1 (le_refl 1) v : ℂ)}) := by
    intro g hg
    rw [mem_eigenspaceC] at hg
    have e0 := hg 0; have e1 := hg 1; have e2 := hg 2
    have h2inv : (2 : ZMod 3)⁻¹ = 2 := ZMod.inv_eq_of_mul_eq_one _ 2 2 (by decide)
    simp only [P_levelC, pow_one, h2inv] at e0 e1 e2
    have b0 : (2 : ZMod 3) * 0 = 0 ∧ (2 : ZMod 3) * (3 * 0 + 1) = 2 := by decide
    have b1 : (2 : ZMod 3) * 1 = 2 ∧ (2 : ZMod 3) * (3 * 1 + 1) = 2 := by decide
    have b2 : (2 : ZMod 3) * 2 = 1 ∧ (2 : ZMod 3) * (3 * 2 + 1) = 2 := by decide
    rw [b0.1, b0.2] at e0
    rw [b1.1, b1.2] at e1
    rw [b2.1, b2.2] at e2
    rcases hlam with rfl | rfl
    · rw [if_pos rfl]
      have hg2 : g 2 = 0 := by linear_combination 2 * e0
      -- Corrected sign (Notes_9 had `2 * e1 - 2 * hg2`, residual `+g 1`).
      have hg1 : g 1 = 0 := by linear_combination -2 * e1 + 2 * hg2
      have hg_eq : g = g 0 • oneZero 1 := by
        funext v
        rcases (show ∀ w : ZMod (3 ^ 1), w = 0 ∨ w = 1 ∨ w = 2 by decide) v with rfl | rfl | rfl
        · show g 0 = g 0 * oneZero 1 0
          rw [show oneZero 1 0 = 1 from if_pos rfl, mul_one]
        · show g 1 = g 0 * oneZero 1 1
          rw [show oneZero 1 1 = 0 from if_neg (by decide), mul_zero, hg1]
        · show g 2 = g 0 * oneZero 1 2
          rw [show oneZero 1 2 = 0 from if_neg (by decide), mul_zero, hg2]
      rw [hg_eq]
      exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
    · rw [if_neg (by norm_num : (-1 / 2 : ℂ) ≠ 1 / 2)]
      have hg2 : g 2 = -2 * g 0 := by linear_combination 2 * e0
      -- Corrected coefficients (Notes_9 had `-2 * e1 - hg2`, residual `-3 * g 2 - 2 * g 0`).
      have hg1 : g 1 = 4 * g 0 := by linear_combination 2 * e1 - 2 * hg2
      have hg_eq : g = (2 * g 0) • (fun v => (f_lifted 1 (le_refl 1) v : ℂ)) := by
        funext v
        rcases (show ∀ w : ZMod (3 ^ 1), w = 0 ∨ w = 1 ∨ w = 2 by decide) v with rfl | rfl | rfl
        · show g 0 = 2 * g 0 * ((f_lifted 1 (le_refl 1) 0 : ℝ) : ℂ)
          rw [show f_lifted 1 (le_refl 1) 0 = 1 / 2 from rfl]
          push_cast <;> ring
        · show g 1 = 2 * g 0 * ((f_lifted 1 (le_refl 1) 1 : ℝ) : ℂ)
          rw [show f_lifted 1 (le_refl 1) 1 = 2 from rfl, hg1]
          push_cast <;> ring
        · show g 2 = 2 * g 0 * ((f_lifted 1 (le_refl 1) 2 : ℝ) : ℂ)
          rw [show f_lifted 1 (le_refl 1) 2 = -1 from rfl, hg2]
          push_cast <;> ring
      rw [hg_eq]
      exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
  have hfin := Submodule.finrank_mono hsub
  refine le_trans hfin ?_
  classical
  by_cases h : lam = 1 / 2
  · rw [if_pos h]
    exact (finrank_span_le_card _).trans (by simp)
  · rw [if_neg h]
    exact (finrank_span_le_card _).trans (by simp)
 
/-- Helper for the LTE step: `1 + 3 ^ (m + 1) ≤ 4 ^ (3 ^ m)`.
Notes_9 cited `Nat.add_mul_le_one_add_pow`, which does not exist; this is proved
directly by induction, cubing at each step. -/
lemma one_add_three_pow_le_four_pow (m : ℕ) : 1 + 3 ^ (m + 1) ≤ 4 ^ (3 ^ m) := by
  induction m with
  | zero => norm_num
  | succ m ih =>
    have hpow : 4 ^ (3 ^ (m + 1)) = (4 ^ (3 ^ m)) ^ 3 := by
      rw [pow_succ, pow_mul]
    rw [hpow]
    have hcube : 1 + 3 ^ (m + 2) ≤ (1 + 3 ^ (m + 1)) ^ 3 := by
      have he : 3 ^ (m + 2) = 3 * 3 ^ (m + 1) := by
        rw [show m + 2 = (m + 1) + 1 from rfl, pow_succ']
      have hexp : (1 + 3 ^ (m + 1)) ^ 3 =
          1 + 3 * 3 ^ (m + 1) + (3 * (3 ^ (m + 1)) ^ 2 + (3 ^ (m + 1)) ^ 3) := by ring
      omega
    calc 1 + 3 ^ (m + 2) ≤ (1 + 3 ^ (m + 1)) ^ 3 := hcube
      _ ≤ (4 ^ (3 ^ m)) ^ 3 := Nat.pow_le_pow_left ih 3
 
/-- Binomial / LTE congruence: `4 ^ (3 ^ m) ≡ 1 + 3 ^ (m + 1) [MOD 3 ^ (m + 2)]`. -/
lemma four_pow_three_pow_mod (m : ℕ) :
    4 ^ (3 ^ m) ≡ 1 + 3 ^ (m + 1) [MOD 3 ^ (m + 2)] := by
  induction m with
  | zero => decide
  | succ m ih =>
    obtain ⟨q, hq⟩ : 3 ^ (m + 2) ∣ 4 ^ (3 ^ m) - (1 + 3 ^ (m + 1)) :=
      (Nat.modEq_iff_dvd' (one_add_three_pow_le_four_pow m)).mp ih.symm
    rw [Nat.ModEq]
    have hpow_succ : 4 ^ (3 ^ (m + 1)) = (4 ^ (3 ^ m)) ^ 3 := by
      rw [pow_succ, pow_mul]
    have h1 : 4 ^ (3 ^ m) = 1 + 3 ^ (m + 1) + 3 ^ (m + 2) * q := by
      have hle := one_add_three_pow_le_four_pow m
      omega
    rw [hpow_succ, h1]
    -- Corrected cube expansion: Notes_9 had `3 ^ (2 * m + 1)` and `3 ^ (2 * m + 4) * q ^ 3`
    -- here; the correct terms are `3 ^ (2 * m)` and `3 ^ (2 * m + 3) * q ^ 3`
    -- (checked by expanding `(1 + 3a + 9aq)^3` with `a = 3 ^ m`).
    have hexp : (1 + 3 ^ (m + 1) + 3 ^ (m + 2) * q) ^ 3 =
        (1 + 3 ^ (m + 2)) + 3 ^ (m + 3) *
          (3 ^ m + 3 ^ (2 * m) + q + 2 * 3 ^ (m + 1) * q +
           3 ^ (2 * m + 2) * q + 3 ^ (m + 2) * q ^ 2 +
           3 ^ (2 * m + 3) * q ^ 2 + 3 ^ (2 * m + 3) * q ^ 3) := by
      have p1 : 3 ^ (m + 1) = 3 * 3 ^ m := by rw [pow_succ']
      have p2 : 3 ^ (m + 2) = 9 * 3 ^ m := by
        rw [show m + 2 = (m + 1) + 1 from rfl, pow_succ', p1]; ring
      have p3 : 3 ^ (m + 3) = 27 * 3 ^ m := by
        rw [show m + 3 = (m + 2) + 1 from rfl, pow_succ', p2]; ring
      have p20 : 3 ^ (2 * m) = (3 ^ m) ^ 2 := by rw [Nat.mul_comm 2 m, pow_mul]
      have p22 : 3 ^ (2 * m + 2) = 9 * (3 ^ m) ^ 2 := by rw [pow_add, p20]; ring
      have p23 : 3 ^ (2 * m + 3) = 27 * (3 ^ m) ^ 2 := by rw [pow_add, p20]; ring
      rw [p1, p2, p3, p20, p22, p23]
      ring
    rw [hexp, Nat.add_mul_mod_self_left]
 
/- Lower bound: `dim E_{±1/2}(P_j) ≥ j`, from the `j` shell basis functions
(`shellIndicator` for `+1/2`, `shellAlternating` + `f_lifted` for `-1/2`). -/
/- **Exact dimension (Notes_5, correcting the false `= 2`):**
`dim E_{+1/2}(P_j) = j` and `dim E_{-1/2}(P_j) = j` for all `j ≥ 1`.
At `j = 1` this is `1`, not `0` (Notes_5's `j = 1` claim is corrected below:
`1_{0}` IS a `+1/2`-eigenfunction in `ZMod 3`). At `j = 2` this recovers the
old `= 2`; at `j = 3` it gives `3`, with the third `+1/2` direction `1_{0}`
and the third `-1/2` direction `-1_{9} + 1_{18}`. -/
/-- Level-2 spanning: the `±1/2`-eigenspace at `j = 2` is spanned by the two
Section 4 witnesses. Proved by solving the 9 equations of `P_mod9C_eq`
(`linear_combination` chain); the `+1/2` case gives `g = g 0 • ψ₀ + g 3 • ψ₊`,
the `-1/2` case gives `g = (2 • g 0) • (g_witness ∘ projMod3) + (g 0 - g 3) • ψ₋`.
This is TRUE (it is the `j = 2` case of `dim_eigenspace_half_eq_j`); only the
`j ≥ 3` lift claim was false. -/
theorem level2_eigenspace_span (lam : ℂ) (hlam : lam = 1 / 2 ∨ lam = -1 / 2) :
    eigenspaceC 2 lam ≤ Submodule.span ℂ
      (if lam = 1 / 2 then
        {fun v => ((lifted9 2 (le_refl 2) witness9_zero v : ℝ) : ℂ),
         fun v => ((lifted9 2 (le_refl 2) witness9_plus v : ℝ) : ℂ)}
       else
        {fun v => ((f_lifted 2 (by omega) v : ℝ) : ℂ),
         fun v => ((lifted9 2 (le_refl 2) witness9_minus v : ℝ) : ℂ)}) := by
  intro g hg
  rw [mem_eigenspaceC] at hg
  have e0 := hg 0; have e1 := hg 1; have e2 := hg 2
  have e3 := hg 3; have e4 := hg 4; have e5 := hg 5
  have e6 := hg 6; have e7 := hg 7; have e8 := hg 8
  obtain ⟨p0, p1, p2, p3, p4, p5, p6, p7, p8⟩ := P_mod9C_eq g
  have hP9 : ∀ v : ZMod 9, P_levelC 2 g v = P_mod9C g v := fun _ => rfl
  simp only [hP9, p0, p1, p2, p3, p4, p5, p6, p7, p8] at e0 e1 e2 e3 e4 e5 e6 e7 e8
  -- `projMod9 2` is the identity on `ZMod (3 ^ 2) = ZMod 9` (for the `hg_eq` steps)
  have key9 : ∀ w : ZMod (3 ^ 2), w = 0 ∨ w = 1 ∨ w = 2 ∨ w = 3 ∨ w = 4 ∨ w = 5 ∨ w = 6 ∨ w = 7 ∨ w = 8 := by decide
  rcases hlam with rfl | rfl
  · rw [if_pos rfl]
    have hg5 : g 5 = 0 := by linear_combination 2 * e0
    have hg4 : g 4 = 0 := by linear_combination 2 * e8
    -- Notes_8 had `e4 + hg4` here (residual `-g4/2`); the correct coefficient is `(1/2) * hg4`.
    have hg2 : g 2 = 0 := by linear_combination e4 + (1 / 2 : ℂ) * hg4
    -- Notes_8 had `2 * e1 - hg5 - hg2` here (residual `2 * g 1`); the sign is flipped.
    have hg1 : g 1 = 0 := by linear_combination -2 * e1 + hg5 + hg2
    have hg8 : g 8 = 0 := by linear_combination 2 * e2 - hg1 + hg2
    have hg7 : g 7 = 0 := by linear_combination 2 * e5 - hg8 + hg5
    have hg6 : g 6 = g 3 := by linear_combination 2 * e3 - hg5
    have hg_eq : g = g 0 • (fun v => ((lifted9 2 (le_refl 2) witness9_zero v : ℝ) : ℂ)) +
        g 3 • (fun v => ((lifted9 2 (le_refl 2) witness9_plus v : ℝ) : ℂ)) := by
      funext v
      rcases key9 v with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
      · show g 0 = g 0 * ((lifted9 2 (le_refl 2) witness9_zero 0 : ℝ) : ℂ) +
            g 3 * ((lifted9 2 (le_refl 2) witness9_plus 0 : ℝ) : ℂ)
        rw [show lifted9 2 (le_refl 2) witness9_zero 0 = 1 from rfl,
          show lifted9 2 (le_refl 2) witness9_plus 0 = 0 from rfl]
        push_cast <;> ring
      · show g 1 = g 0 * ((lifted9 2 (le_refl 2) witness9_zero 1 : ℝ) : ℂ) +
            g 3 * ((lifted9 2 (le_refl 2) witness9_plus 1 : ℝ) : ℂ)
        rw [show lifted9 2 (le_refl 2) witness9_zero 1 = 0 from rfl,
          show lifted9 2 (le_refl 2) witness9_plus 1 = 0 from rfl, hg1]
        push_cast <;> ring
      · show g 2 = g 0 * ((lifted9 2 (le_refl 2) witness9_zero 2 : ℝ) : ℂ) +
            g 3 * ((lifted9 2 (le_refl 2) witness9_plus 2 : ℝ) : ℂ)
        rw [show lifted9 2 (le_refl 2) witness9_zero 2 = 0 from rfl,
          show lifted9 2 (le_refl 2) witness9_plus 2 = 0 from rfl, hg2]
        push_cast <;> ring
      · show g 3 = g 0 * ((lifted9 2 (le_refl 2) witness9_zero 3 : ℝ) : ℂ) +
            g 3 * ((lifted9 2 (le_refl 2) witness9_plus 3 : ℝ) : ℂ)
        rw [show lifted9 2 (le_refl 2) witness9_zero 3 = 0 from rfl,
          show lifted9 2 (le_refl 2) witness9_plus 3 = 1 from rfl]
        push_cast <;> ring
      · show g 4 = g 0 * ((lifted9 2 (le_refl 2) witness9_zero 4 : ℝ) : ℂ) +
            g 3 * ((lifted9 2 (le_refl 2) witness9_plus 4 : ℝ) : ℂ)
        rw [show lifted9 2 (le_refl 2) witness9_zero 4 = 0 from rfl,
          show lifted9 2 (le_refl 2) witness9_plus 4 = 0 from rfl, hg4]
        push_cast <;> ring
      · show g 5 = g 0 * ((lifted9 2 (le_refl 2) witness9_zero 5 : ℝ) : ℂ) +
            g 3 * ((lifted9 2 (le_refl 2) witness9_plus 5 : ℝ) : ℂ)
        rw [show lifted9 2 (le_refl 2) witness9_zero 5 = 0 from rfl,
          show lifted9 2 (le_refl 2) witness9_plus 5 = 0 from rfl, hg5]
        push_cast <;> ring
      · show g 6 = g 0 * ((lifted9 2 (le_refl 2) witness9_zero 6 : ℝ) : ℂ) +
            g 3 * ((lifted9 2 (le_refl 2) witness9_plus 6 : ℝ) : ℂ)
        rw [show lifted9 2 (le_refl 2) witness9_zero 6 = 0 from rfl,
          show lifted9 2 (le_refl 2) witness9_plus 6 = 1 from rfl, hg6]
        push_cast <;> ring
      · show g 7 = g 0 * ((lifted9 2 (le_refl 2) witness9_zero 7 : ℝ) : ℂ) +
            g 3 * ((lifted9 2 (le_refl 2) witness9_plus 7 : ℝ) : ℂ)
        rw [show lifted9 2 (le_refl 2) witness9_zero 7 = 0 from rfl,
          show lifted9 2 (le_refl 2) witness9_plus 7 = 0 from rfl, hg7]
        push_cast <;> ring
      · show g 8 = g 0 * ((lifted9 2 (le_refl 2) witness9_zero 8 : ℝ) : ℂ) +
            g 3 * ((lifted9 2 (le_refl 2) witness9_plus 8 : ℝ) : ℂ)
        rw [show lifted9 2 (le_refl 2) witness9_zero 8 = 0 from rfl,
          show lifted9 2 (le_refl 2) witness9_plus 8 = 0 from rfl, hg8]
        push_cast <;> ring
    rw [hg_eq]
    exact Submodule.add_mem _
      (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
      (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
  · have h_ne : (-1 / 2 : ℂ) ≠ 1 / 2 := by norm_num
    rw [if_neg h_ne]
    -- Notes_8's `-1/2` intermediates are mathematically false: from `e4`,
    -- `g 2 = (-1/2) * g 4`, so `g 4 = -2 * g 2`, NOT `g 4 = -g 2` as claimed;
    -- the true solution is `g 4 = 4 * g 0`, `g 8 = -2 * g 0`, `g 7 = 4 * g 0`
    -- (not `-g 2 / 2`). Rebuilt as a stepwise chain, each step verified by
    -- `linear_combination` against `P_mod9C_eq` (residual `0`).
    have hg5 : g 5 = -2 * g 0 := by linear_combination 2 * e0
    have hcj : g 2 = g 8 := by linear_combination e4 - e8
    have hbj : g 1 = -2 * g 8 := by linear_combination 2 * e2 - hcj
    have hij : g 7 = -2 * g 8 := by linear_combination 2 * e7 - hcj
    have hfj : g 5 = g 8 := by linear_combination 2 * e5 - hij
    have hg8 : g 8 = -2 * g 0 := by linear_combination hg5 - hfj
    have hg2 : g 2 = -2 * g 0 := by linear_combination hcj + hg8
    have hg1 : g 1 = 4 * g 0 := by linear_combination hbj - 2 * hg8
    have hg7 : g 7 = 4 * g 0 := by linear_combination hij - 2 * hg8
    have hg4 : g 4 = 4 * g 0 := by linear_combination 2 * e4 - 2 * hg2
    have hg6 : g 6 = 2 * g 0 - g 3 := by linear_combination 2 * e3 - hg5
    have hg_eq : g = (2 * g 0) • (fun v => ((f_lifted 2 (by omega) v : ℝ) : ℂ)) +
        (g 0 - g 3) • (fun v => ((lifted9 2 (le_refl 2) witness9_minus v : ℝ) : ℂ)) := by
      funext v
      rcases key9 v with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
      · show g 0 = 2 * g 0 * ((f_lifted 2 (by omega) 0 : ℝ) : ℂ) +
            (g 0 - g 3) * ((lifted9 2 (le_refl 2) witness9_minus 0 : ℝ) : ℂ)
        rw [show f_lifted 2 (by omega) 0 = 1 / 2 from rfl,
          show lifted9 2 (le_refl 2) witness9_minus 0 = 0 from rfl]
        push_cast <;> ring
      · show g 1 = 2 * g 0 * ((f_lifted 2 (by omega) 1 : ℝ) : ℂ) +
            (g 0 - g 3) * ((lifted9 2 (le_refl 2) witness9_minus 1 : ℝ) : ℂ)
        rw [show f_lifted 2 (by omega) 1 = 2 from rfl,
          show lifted9 2 (le_refl 2) witness9_minus 1 = 0 from rfl, hg1]
        push_cast <;> ring
      · show g 2 = 2 * g 0 * ((f_lifted 2 (by omega) 2 : ℝ) : ℂ) +
            (g 0 - g 3) * ((lifted9 2 (le_refl 2) witness9_minus 2 : ℝ) : ℂ)
        rw [show f_lifted 2 (by omega) 2 = -1 from rfl,
          show lifted9 2 (le_refl 2) witness9_minus 2 = 0 from rfl, hg2]
        push_cast <;> ring
      · show g 3 = 2 * g 0 * ((f_lifted 2 (by omega) 3 : ℝ) : ℂ) +
            (g 0 - g 3) * ((lifted9 2 (le_refl 2) witness9_minus 3 : ℝ) : ℂ)
        rw [show f_lifted 2 (by omega) 3 = 1 / 2 from rfl,
          show lifted9 2 (le_refl 2) witness9_minus 3 = -1 from rfl]
        push_cast <;> ring
      · show g 4 = 2 * g 0 * ((f_lifted 2 (by omega) 4 : ℝ) : ℂ) +
            (g 0 - g 3) * ((lifted9 2 (le_refl 2) witness9_minus 4 : ℝ) : ℂ)
        rw [show f_lifted 2 (by omega) 4 = 2 from rfl,
          show lifted9 2 (le_refl 2) witness9_minus 4 = 0 from rfl, hg4]
        push_cast <;> ring
      · show g 5 = 2 * g 0 * ((f_lifted 2 (by omega) 5 : ℝ) : ℂ) +
            (g 0 - g 3) * ((lifted9 2 (le_refl 2) witness9_minus 5 : ℝ) : ℂ)
        rw [show f_lifted 2 (by omega) 5 = -1 from rfl,
          show lifted9 2 (le_refl 2) witness9_minus 5 = 0 from rfl, hg5]
        push_cast <;> ring
      · show g 6 = 2 * g 0 * ((f_lifted 2 (by omega) 6 : ℝ) : ℂ) +
            (g 0 - g 3) * ((lifted9 2 (le_refl 2) witness9_minus 6 : ℝ) : ℂ)
        rw [show f_lifted 2 (by omega) 6 = 1 / 2 from rfl,
          show lifted9 2 (le_refl 2) witness9_minus 6 = 1 from rfl, hg6]
        push_cast <;> ring
      · show g 7 = 2 * g 0 * ((f_lifted 2 (by omega) 7 : ℝ) : ℂ) +
            (g 0 - g 3) * ((lifted9 2 (le_refl 2) witness9_minus 7 : ℝ) : ℂ)
        rw [show f_lifted 2 (by omega) 7 = 2 from rfl,
          show lifted9 2 (le_refl 2) witness9_minus 7 = 0 from rfl, hg7]
        push_cast <;> ring
      · show g 8 = 2 * g 0 * ((f_lifted 2 (by omega) 8 : ℝ) : ℂ) +
            (g 0 - g 3) * ((lifted9 2 (le_refl 2) witness9_minus 8 : ℝ) : ℂ)
        rw [show f_lifted 2 (by omega) 8 = -1 from rfl,
          show lifted9 2 (le_refl 2) witness9_minus 8 = 0 from rfl, hg8]
        push_cast <;> ring
    rw [hg_eq]
    exact Submodule.add_mem _
      (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
      (Submodule.smul_mem _ _ (Submodule.subset_span (by simp)))
 
 
/-- Level-2 bound: `finrank (eigenspaceC 2 lam) ≤ 2`. -/
theorem level2_eigenspace_finrank_le_two (lam : ℂ)
    (hlam : lam = 1 / 2 ∨ lam = -1 / 2) :
    Module.finrank ℂ (eigenspaceC 2 lam) ≤ 2 := by
  have hspan := level2_eigenspace_span lam hlam
  have hfin : Module.finrank ℂ (eigenspaceC 2 lam) ≤
      Module.finrank ℂ (Submodule.span ℂ
        (if lam = 1 / 2 then
          {fun v => ((lifted9 2 (le_refl 2) witness9_zero v : ℝ) : ℂ),
           fun v => ((lifted9 2 (le_refl 2) witness9_plus v : ℝ) : ℂ)}
         else
          {fun v => ((f_lifted 2 (by omega) v : ℝ) : ℂ),
           fun v => ((lifted9 2 (le_refl 2) witness9_minus v : ℝ) : ℂ)})) :=
    Submodule.finrank_mono hspan
  have hcard : Module.finrank ℂ (Submodule.span ℂ
      (if lam = 1 / 2 then
        {fun v => ((lifted9 2 (le_refl 2) witness9_zero v : ℝ) : ℂ),
         fun v => ((lifted9 2 (le_refl 2) witness9_plus v : ℝ) : ℂ)}
       else
        {fun v => ((f_lifted 2 (by omega) v : ℝ) : ℂ),
         fun v => ((lifted9 2 (le_refl 2) witness9_minus v : ℝ) : ℂ)})) ≤ 2 := by
    classical
    by_cases h : lam = 1 / 2
    · rw [if_pos h]
      refine (finrank_span_le_card _).trans ?_
      simp only [Set.toFinset_insert, Set.toFinset_singleton]
      exact (Finset.card_insert_le _ _).trans (by simp)
    · rw [if_neg h]
      refine (finrank_span_le_card _).trans ?_
      simp only [Set.toFinset_insert, Set.toFinset_singleton]
      exact (Finset.card_insert_le _ _).trans (by simp)
  exact le_trans hfin hcard
 
/-! #### Why the unit spectrum grows as `(1/2) • μ_{2·3^{j-1}}` -/
 
/-- The order `2 * 3 ^ (j - 1)` is nonzero (needed for the `Fintype` instance of `rootsOfUnity`). -/
instance instNeZeroTwoThreePow (j : ℕ) : NeZero (2 * 3 ^ (j - 1)) := ⟨by positivity⟩

/-- The group of `(2 * 3 ^ (j-1))`-th roots of unity in `ℂ`. -/
abbrev unitRoots (j : ℕ) : Subgroup ℂˣ :=
  rootsOfUnity (2 * 3 ^ (j - 1)) ℂ
 
/-- Cardinality: `|μ_{2·3^{j-1}}| = 2 * 3 ^ (j-1)`, stated with `Nat.card`. This Mathlib has no
`Fintype` instance on `rootsOfUnity n ℂ` (instance search failed both through the abbreviation
`unitRoots` and directly), so `Fintype.card` cannot be stated; `Nat.card` needs only the type. -/
theorem card_unitRoots (j : ℕ) (hj : 1 ≤ j) :
    Nat.card (unitRoots j) = 2 * 3 ^ (j - 1) := by
  first
  | exact Complex.card_rootsOfUnity (2 * 3 ^ (j - 1))
  | simpa [Nat.card_eq_fintype_card] using Complex.card_rootsOfUnity (2 * 3 ^ (j - 1))
  | exact (Complex.isPrimitiveRoot_exp (2 * 3 ^ (j - 1)) (NeZero.ne _)).card_rootsOfUnity
 
/-
**Growth of the unit spectrum.** The eigenvalues of `P_j` with `‖lam‖ = 1 / 2`
are exactly `(1 / 2) • μ_{2·3^{j-1}}`: every such `lam` satisfies
`(2 * lam) ^ (2 * 3 ^ (j-1)) = 1` (from the annihilating polynomial
`(X - 1)((2X)^{2·3^{j-1}} - 1)`, proved at `j = 2, 3` in Sections 4–5 and by the
same iterate-unfolding at general `j`), and conversely each `(1 / 2) * ζ`,
`ζ ∈ μ_{2·3^{j-1}}`, occurs. In particular the number of unit-modulus-normalized
eigenvalues grows as `2 * 3 ^ (j-1)`, while `dim E_{±1/2} = j` grows linearly
(CORRECTED: the old claim "`dim E_{±1/2} = 2` stays fixed" is false for `j ≥ 3`).
The extra roots `ζ ≠ ±1` give *new* eigenspaces, and the `±1/2` eigenspaces
themselves gain one dimension per level from the new transient shell
`3^{j-1} · (ZMod 3)^×` — the `3`-part is NOT exhausted by the level-2 lifts.
-/
/- `unit_spectrum_growth` is proved after the fiber section below (its proof needs
`fiberDiff_pow_totient`, which needs the fiber dynamics lemmas). See the full
proof at the end of Section 6. -/
 
 
/-! #### Corrected transient dynamics: units vs transient kernel (Notes_3, corrected) -/
 
/--
**Units are closed under both branches.** If `3 ∤ v` in `ZMod (3 ^ j)` (i.e.
`projMod3 j hj v ≠ 0`), then both `2⁻¹ * v` and `2⁻¹ * (3 * v + 1)` are units:
the first because `2⁻¹` is a unit mod 3, the second because `3 * v + 1 ≡ 1 (mod 3)`.
Hence `P_j` restricts to an autonomous operator `P_j^unit` on the units.
-/
theorem unit_closed_first_branch (j : ℕ) (hj : 1 ≤ j) (v : ZMod (3 ^ j))
    (hv : projMod3 j hj v ≠ 0) :
    projMod3 j hj ((2 : ZMod (3 ^ j))⁻¹ * v) ≠ 0 := by
  rw [map_mul, projMod3_inv_two j hj, ZMod.inv_eq_of_mul_eq_one 3 2 2 (by decide)]
  -- `2 * projMod3 v ≠ 0` since both factors are nonzero in the field `ZMod 3`.
  exact mul_ne_zero (by decide) hv
 
theorem unit_closed_second_branch (j : ℕ) (hj : 1 ≤ j) (v : ZMod (3 ^ j)) :
    projMod3 j hj ((2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1)) ≠ 0 := by
  -- `projMod3 (3 * v) = 3 * projMod3 v = 0` in `ZMod 3`, so this is `2⁻¹ * 1 = 2 ≠ 0`.
  rw [map_mul, map_add, map_mul, map_ofNat, map_one, projMod3_inv_two j hj,
    show (3 : ZMod 3) = 0 by decide, zero_mul, zero_add, ZMod.inv_eq_of_mul_eq_one 3 2 2 (by decide)]
  decide
 
/--
**CORRECT reduction on the transient part (replacing the false `P_{j-1}` claim).**
If `f` vanishes on the units, then on `v = 3 * y` the second branch drops out
(it lands in the units), and
`P_j f (3 * y) = (1/2) * f (3 * (2⁻¹ * y))`.
So `P_j` on the transient kernel is `(1/2) * (multiplication by 2⁻¹)` on the
`3`-part, NOT `P_{j-1}` — the `P_{j-1}` eigen-equation is never used.
-/
theorem P_levelC_on_transient (j : ℕ) (hj : 1 ≤ j)
    (f : ZMod (3 ^ j) → ℂ)
    (hf : ∀ v : ZMod (3 ^ j), projMod3 j hj v ≠ 0 → f v = 0)
    (y : ZMod (3 ^ j)) :
    P_levelC j f (3 * y) = (1 / 2 : ℂ) * f (3 * ((2 : ZMod (3 ^ j))⁻¹ * y)) := by
  have h2 : f ((2 : ZMod (3 ^ j))⁻¹ * (3 * (3 * y) + 1)) = 0 := by
    apply hf
    -- `3 * (3 * y) + 1 ≡ 1 (mod 3)`, so the second branch is a unit.
    have : projMod3 j hj (3 * (3 * y) + 1) = 1 := by
      rw [map_add, map_mul, map_ofNat, map_one, show (3 : ZMod 3) = 0 by decide, zero_mul, zero_add]
    rw [map_mul, projMod3_inv_two j hj, this, ZMod.inv_eq_of_mul_eq_one 3 2 2 (by decide)]
    decide
  simp only [P_levelC]
  rw [h2, mul_zero, add_zero]
  congr 1
  ring
 
/-- The transient kernel: functions vanishing on the units. -/
def transientKernel (j : ℕ) (hj : 1 ≤ j) : Submodule ℂ (ZMod (3 ^ j) → ℂ) :=
  { carrier := {f | ∀ v : ZMod (3 ^ j), projMod3 j hj v ≠ 0 → f v = 0}
    add_mem' := by intro f g hf hg v hv; rw [Pi.add_apply, hf v hv, hg v hv, add_zero]
    zero_mem' := by intro v _; rfl
    smul_mem' := by intro c f hf v hv; rw [Pi.smul_apply, hf v hv, smul_zero] }
 
/-!
**Multiplicity split (earlier statement, superseded).** The proved split is
`plus_half_multiplicity_split` / `minus_half_multiplicity_split` below (`0 + j` and `1 + (j - 1)`);
the totals `2` in the list below are correct only at `j = 2`.
The correct split, replacing the earlier restriction-based story, is:
- `λ = +1/2`: multiplicity `0` on the units + `2` on the transient kernel
  (from `ψ₀` and `ψ₊`), total `2`.
- `λ = -1/2`: multiplicity `1` on the units (from `g_witness (v mod 3)`) + `1`
  on the transient kernel (from `ψ₋` on `3 ↔ 6 (mod 9)`), total `2`.
The `+1/2`-not-on-units claim is the statement that `(2X - 1)` divides out of
the unit characteristic polynomial `(X - 1)((2X)^{2·3^{j-1}} - 1) / (2X - 1)`.
 
**Two corrections to Notes_3's closing sketch:**
1. The claimed fiber-difference identity
   `P_{j+1}(Δ_j f)(v) = (1/2) Δ_j f (2⁻¹ v)` is OFF by the `2⁻¹` factor on the
   shift: the first branch sends `v + 3^j ↦ 2⁻¹ v + 2⁻¹·3^j`, and
   `2⁻¹·3^j ≡ 2·3^j (mod 3^{j+1})`, NOT `3^j`. The correct identity is
   `P_{j+1}(Δ_j f)(v) = (1/2) [f(2⁻¹ v + 2·3^j) - f(2⁻¹ v)]`, i.e. the
   `2·3^j`-difference. The fiber system is therefore 2-dimensional
   (`Δ` and `Δ^{(2)}`), not 1-dimensional; closing it needs the `2×2` fiber
   matrix, not the scalar argument in Notes_3.
2. The step `δ(v + 3^j) = -δ(v)` in Notes_3 is unjustified: the fiber sum is
   `δ(v) + δ(v + 3^j) + δ(v + 2·3^j) = 0` (telescoping), which does NOT imply
   `δ(v + 3^j) = -δ(v)`. The `δ ≡ 0` conclusion does not follow from the
   argument as written.
The lift lemma itself is now DISPROVED (`eigenfunction_is_lift_from_level_two_is_false`),
not open; `unit_spectrum_growth` is proved at the end of Section 6
(`unit_spectrum_growth`, via the fiber dynamics). The remaining open items are
the `dim = j` upper bound (`dim_eigenspace_half_le_j`), the `-1/2` lower bound,
and the shell alternating construction.
-/
/-! #### `δ ≡ 0` needs two independent conditions per fiber (fiber-triple lemma) -/
 
/--
Top-digit fiber difference at level `j+1`: `δ(v) = f(v + 3^j) - f(v)`,
for `f` on `ZMod (3 ^ (j+1))`. The fiber over `v mod 3^j` is
`{v, v + 3^j, v + 2·3^j}`.
-/
def fiberDiff (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ) (v : ZMod (3 ^ (j + 1))) : ℂ :=
  f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) - f v
 
/-- Second fiber difference: shift by `2·3^j`. -/
def fiberDiff2 (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ) (v : ZMod (3 ^ (j + 1))) : ℂ :=
  f (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) - f v
 
/-- The fiber sum: `δ(v) + δ(v + 3^j) + δ(v + 2·3^j) = 0` (telescoping, since
`3·3^j = 3^{j+1} = 0` in `ZMod (3 ^ (j+1))`). This is ONE linear condition on
each fiber; `δ ≡ 0` needs TWO more independent ones. -/
theorem fiberDiff_sum (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ) (v : ZMod (3 ^ (j + 1))) :
    fiberDiff j f v + fiberDiff j f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) +
      fiberDiff j f (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) = 0 := by
  have h3 : (3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = 0 := by
    have hcast : (3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
        ((3 ^ (j + 1) : ℕ) : ZMod (3 ^ (j + 1))) := by
      push_cast
      ring
    rw [hcast]
    exact ZMod.natCast_self _
  have e1 : v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
      v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by ring
  have e2 : v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = v := by
    have : v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
        v + 3 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by ring
    rw [this, h3, add_zero]
  simp only [fiberDiff, e1, e2]
  ring
 
/-- `δ(v + 3^j)` in terms of the shift, for rewriting. -/
theorem fiberDiff2_eq (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ) (v : ZMod (3 ^ (j + 1))) :
    fiberDiff2 j f v = fiberDiff j f v + fiberDiff j f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) := by
  have e1 : v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
      v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by ring
  simp only [fiberDiff2, fiberDiff, e1]
  ring
 
/--
**Route 1 — invariance.** If `δ(v + 3^j) = δ(v)` for all `v`, then with the fiber
sum `δ(v) + δ(v + 3^j) + δ(v + 2·3^j) = 3·δ(v) = 0`, hence `δ ≡ 0` (since
`(3 : ℂ) ≠ 0`). Invariance supplies the two missing conditions
(`δ₁ = δ₀` and `δ₂ = δ₀`).
-/
theorem fiberDiff_eq_zero_of_invariance (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ)
    (hinv : ∀ v : ZMod (3 ^ (j + 1)),
      fiberDiff j f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) = fiberDiff j f v) :
    ∀ v : ZMod (3 ^ (j + 1)), fiberDiff j f v = 0 := by
  intro v
  have hsum := fiberDiff_sum j f v
  have h1 := hinv v
  have h2 : fiberDiff j f (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) = fiberDiff j f v := by
    have e1 : v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
        v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by ring
    rw [← e1, hinv]
    exact h1
  rw [h1, h2] at hsum
  have h3 : (3 : ℂ) * fiberDiff j f v = 0 := by linear_combination hsum
  exact (mul_eq_zero.mp h3).resolve_left (by norm_num)
 
/--
**Route 2 — vanishing twisted fiber sums.** Let `ω` satisfy `ω² + ω + 1 = 0`
(a primitive cube root of unity). If both twisted sums
`Σ_k ω^k δ(v + k·3^j)` and `Σ_k ω^{-k} δ(v + k·3^j)` vanish at every `v`,
then with the fiber sum the `3×3` Vandermonde system
`[[1,1,1],[1,ω,ω²],[1,ω²,ω]] · (δ₀,δ₁,δ₂) = 0` has nonzero determinant, so
`δ ≡ 0`. The two twisted vanishings are exactly the two missing conditions.
-/
theorem fiberDiff_eq_zero_of_twisted (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ)
    (ω : ℂ) (hω : ω ^ 2 + ω + 1 = 0)
    (hS1 : ∀ v : ZMod (3 ^ (j + 1)),
      fiberDiff j f v + ω * fiberDiff j f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) +
        ω ^ 2 * fiberDiff j f (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) = 0)
    (hS2 : ∀ v : ZMod (3 ^ (j + 1)),
      fiberDiff j f v + ω ^ 2 * fiberDiff j f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) +
        ω * fiberDiff j f (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) = 0) :
    ∀ v : ZMod (3 ^ (j + 1)), fiberDiff j f v = 0 := by
  -- Key step: at a fixed triple `(a, b, c)` with `a + b + c = 0`,
  -- `a + ω b + ω² c = 0`, `a + ω² b + ω c = 0`, we get `3a = 0`.
  have key : ∀ a b c : ℂ, a + b + c = 0 → a + ω * b + ω ^ 2 * c = 0 →
      a + ω ^ 2 * b + ω * c = 0 → a = 0 := by
    intro a b c h0 h1 h2
    have h3a : (3 : ℂ) * a = 0 := by linear_combination h0 + h1 + h2 - (b + c) * hω
    exact (mul_eq_zero.mp h3a).resolve_left (by norm_num)
  intro v
  have hsum := fiberDiff_sum j f v
  have h1 := hS1 v
  have h2 := hS2 v
  -- `key` applied to the triple `(δ(v), δ(v + 3^j), δ(v + 2·3^j))` gives `δ(v) = 0`.
  -- (The same argument at `v + 3^j` would give the cyclic companions; they are not
  -- needed since the goal is quantified over all `v`.)
  exact key _ _ _ hsum h1 h2
 
/--
**Route 3 — explicit second relation from the dynamics.**
For an eigenfunction `P_{j+1} f = lam • f`, subtracting the eigen-equation at
`v + 3^j` and at `v` gives, via the cancellation
`3(v + 3^j) + 1 ≡ 3v + 1 (mod 3^{j+1})` (the second branch drops out) and
`2⁻¹·3^j ≡ 2·3^j (mod 3^{j+1})`:
`Δ^{(2)}(2⁻¹ v) = 2·lam·δ(v)`, where `Δ^{(2)}` is the `2·3^j`-difference.
This is the dynamical second relation: it links `δ(w) + δ(w + 3^j)` (at
`w = 2⁻¹ v`) to `δ(2w)`, i.e. it is *cross-fiber*, not a second equation on the
same fiber. Closing `δ ≡ 0` from it therefore needs one more ingredient —
e.g. multiplication-invariance `δ(2w) = δ(w)` (proved below) — which turns it
into the same-fiber relation `δ(w + 3^j) = (2·lam - 1)·δ(w)`.
-/
theorem fiberDiff_dynamics_second_relation (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ)
    (lam : ℂ) (heig : ∀ v : ZMod (3 ^ (j + 1)), P_levelC (j + 1) f v = lam * f v)
    (v : ZMod (3 ^ (j + 1))) :
    fiberDiff2 j f ((2 : ZMod (3 ^ (j + 1)))⁻¹ * v) =
      2 * lam * fiberDiff j f v := by
  have h_inv_shift : (2 : ZMod (3 ^ (j + 1)))⁻¹ * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
      2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
    have h4 : (2 : ZMod (3 ^ (j + 1))) * (2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) =
        ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
      have h3pow : ((3 ^ (j + 1) : ℕ) : ZMod (3 ^ (j + 1))) = 0 := ZMod.natCast_self _
      have e : (2 : ZMod (3 ^ (j + 1))) * (2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) =
          ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) + ((3 ^ (j + 1) : ℕ) : ZMod (3 ^ (j + 1))) := by
        push_cast
        ring
      rw [e, h3pow, add_zero]
    calc (2 : ZMod (3 ^ (j + 1)))⁻¹ * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))
        = (2 : ZMod (3 ^ (j + 1)))⁻¹ * ((2 : ZMod (3 ^ (j + 1))) *
            (2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))))) := by rw [h4]
      _ = 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
          rw [← mul_assoc, inv_two_mul_two_pow (j + 1), one_mul]
  have h_shift2 : (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) + 1) =
      (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1) := by
    have h3 : 3 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = 0 := by
      have hcast : (3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
          ((3 ^ (j + 1) : ℕ) : ZMod (3 ^ (j + 1))) := by
        push_cast
        ring
      rw [hcast]
      exact ZMod.natCast_self _
    have e : 3 * (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) + 1 = 3 * v + 1 := by
      linear_combination h3
    rw [e]
  have hΔP : P_levelC (j + 1) f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) -
      P_levelC (j + 1) f v = lam * fiberDiff j f v := by
    rw [heig (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))), heig v]
    simp only [fiberDiff]
    ring
  have hP : P_levelC (j + 1) f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) -
      P_levelC (j + 1) f v =
      (1 / 2 : ℂ) * fiberDiff2 j f ((2 : ZMod (3 ^ (j + 1)))⁻¹ * v) := by
    simp only [P_levelC, fiberDiff2]
    have h_shift1 : (2 : ZMod (3 ^ (j + 1)))⁻¹ * (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) =
        (2 : ZMod (3 ^ (j + 1)))⁻¹ * v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
      rw [mul_add, h_inv_shift]
    rw [h_shift1, h_shift2]
    ring
  rw [hP] at hΔP
  linear_combination 2 * hΔP
 
/--
**Route 3, closed.** Dynamics (`fiberDiff_dynamics_second_relation`) plus
multiplication-invariance `δ(2w) = δ(w)` plus the fiber sum gives `δ ≡ 0`,
for `lam = ±1/2`: with `w = 2⁻¹ v`, the dynamics gives
`δ(w) + δ(w + 3^j) = 2·lam·δ(w)`, i.e. `δ(w + 3^j) = (2·lam - 1)·δ(w)`.
For `lam = +1/2` this is `δ(w + 3^j) = 0`, and the fiber sum plus the same
relation at `w + 3^j` forces `δ(w) = 0`; for `lam = -1/2` it is
`δ(w + 3^j) = -2·δ(w)`, and the fiber sum plus the same relation at `w + 3^j`
forces `3·δ(w) = 0`.
-/
theorem fiberDiff_eq_zero_of_dynamics_and_mult_invariance (j : ℕ)
    (f : ZMod (3 ^ (j + 1)) → ℂ) (lam : ℂ) (hlam : lam = 1 / 2 ∨ lam = -1 / 2)
    (heig : ∀ v : ZMod (3 ^ (j + 1)), P_levelC (j + 1) f v = lam * f v)
    (hmult : ∀ w : ZMod (3 ^ (j + 1)), fiberDiff j f (2 * w) = fiberDiff j f w) :
    ∀ v : ZMod (3 ^ (j + 1)), fiberDiff j f v = 0 := by
  intro v
  -- Apply the dynamics at `2 * v`, so `w = v` in the discussion above.
  have hdyn := fiberDiff_dynamics_second_relation j f lam heig (2 * v)
  have h2inv : (2 : ZMod (3 ^ (j + 1)))⁻¹ * (2 * v) = v := by
    rw [← mul_assoc, inv_two_mul_two_pow (j + 1), one_mul]
  rw [h2inv, fiberDiff2_eq, hmult v] at hdyn
  -- `hdyn : δ(v) + δ(v + 3^j) = 2·lam·δ(v)` (the `hmult v` rewrite is essential:
  -- the dynamics lemma gives `δ(2 * v)` on the RHS, and only `hmult` turns it into `δ(v)`).
  have hsum := fiberDiff_sum j f v
  -- Same relation at `v + 3^j`, using `hmult` to rewrite `δ(2(v + 3^j))`? The
  -- dynamics at `2 * (v + 3^j)` gives `δ(v + 3^j) + δ(v + 2·3^j) = 2·lam·δ(v + 3^j)`
  -- after `2⁻¹·2 = 1` and `hmult` at `v + 3^j`.
  have hdyn2 := fiberDiff_dynamics_second_relation j f lam heig (2 * (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))))
  have h2inv2 : (2 : ZMod (3 ^ (j + 1)))⁻¹ * (2 * (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))))) =
      v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
    rw [← mul_assoc, inv_two_mul_two_pow (j + 1), one_mul]
  rw [h2inv2, fiberDiff2_eq, hmult (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))))] at hdyn2
  have hshift : fiberDiff j f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) +
      fiberDiff j f (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) =
      2 * lam * fiberDiff j f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) := by
    -- `hdyn2` is `δ(v+3^j) + δ(v+3^j+3^j) = 2·lam·δ(v+3^j)` (after the `hmult`
    -- rewrite above); rewrite the middle term.
    have e1 : v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
        v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by ring
    rw [e1] at hdyn2
    exact hdyn2
  rcases hlam with rfl | rfl
  · -- `lam = +1/2`: `δ(v + 3^j) = 0` and `δ(v + 2·3^j) = 0`, so the fiber sum gives `δ(v) = 0`.
    have h1 : fiberDiff j f (v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) = 0 := by
      linear_combination hdyn
    have h2 : fiberDiff j f (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) = 0 := by
      linear_combination hshift
    linear_combination hsum - h1 - h2
  · -- `lam = -1/2`: `δ(v + 3^j) = -2·δ(v)` and `δ(v + 2·3^j) = δ(v)` from the fiber
    -- sum; the shifted relation gives `δ(v + 2·3^j) = -2·δ(v + 3^j) = 4·δ(v)`,
    -- hence `3·δ(v) = 0`.
    have h3 : (3 : ℂ) * fiberDiff j f v = 0 := by
      -- `hdyn - hshift + hsum = 3δ₀`: `(2δ₀ + δ₁) - (2δ₁ + δ₂) + (δ₀ + δ₁ + δ₂) = 3δ₀`.
      linear_combination hdyn - hshift + hsum
    exact (mul_eq_zero.mp h3).resolve_left (by norm_num)
 
 
/-! #### Transient shells, the two-step relation, and corrections to Notes_5 -/
 
/-- General projection `ZMod (3 ^ j) →+* ZMod (3 ^ k)` for `k ≤ j`. -/
def projModPow (j k : ℕ) (hk : k ≤ j) : ZMod (3 ^ j) →+* ZMod (3 ^ k) :=
  ZMod.castHom (pow_dvd_pow 3 hk) (ZMod (3 ^ k))
 
/-- `projModPow` sends `2⁻¹` to `2⁻¹` (for `1 ≤ k ≤ j`). -/
lemma projModPow_inv_two (j k : ℕ) (hk : k ≤ j) (hk1 : 1 ≤ k) :
    projModPow j k hk ((2 : ZMod (3 ^ j))⁻¹) = (2 : ZMod (3 ^ k))⁻¹ := by
  have h2j : 2 < 3 ^ j := by
    have h3j : 3 ≤ 3 ^ j := by
      calc 3 = 3 ^ 1 := by norm_num
        _ ≤ 3 ^ j := Nat.pow_le_pow_right (by decide) (by omega)
    omega
  have h2_j_unit : IsUnit (2 : ZMod (3 ^ j)) := by
    rw [← ZMod.natCast_zmod_val (2 : ZMod (3 ^ j)), ZMod.isUnit_iff_coprime]
    have hval : ((2 : ZMod (3 ^ j)).val) = 2 := by
      rw [show (2 : ZMod (3 ^ j)) = ((2 : ℕ) : ZMod (3 ^ j)) by norm_num, ZMod.val_natCast,
        Nat.mod_eq_of_lt h2j]
    rw [hval]
    exact Nat.Coprime.pow_right j (by decide : Nat.Coprime 2 3)
  have key : projModPow j k hk ((2 : ZMod (3 ^ j))⁻¹) * (2 : ZMod (3 ^ k)) = 1 := by
    rw [← map_ofNat (projModPow j k hk) 2, ← map_mul,
      ZMod.inv_mul_of_unit _ h2_j_unit, map_one]
  exact Eq.symm (ZMod.inv_eq_of_mul_eq_one _ _ _ (by rw [mul_comm]; exact key))
 
/-- `projModPow` evaluated via `ZMod.val`. -/
lemma projModPow_eq_val (j k : ℕ) (hk : k ≤ j) (w : ZMod (3 ^ j)) :
    projModPow j k hk w = ((w.val : ℕ) : ZMod (3 ^ k)) := by
  rw [projModPow, ZMod.castHom_apply, ZMod.cast_eq_val]
 
/--
Indicator of the `k`-th transient shell `3^k · (ZMod 3^{j-k})^×`, for `1 ≤ k`,
`k + 1 ≤ j`: `v` is in shell `k` iff `v ≡ 0 (mod 3^k)` but `v ≢ 0 (mod 3^{k+1})`.
The `j - 1` shells `k = 1, …, j - 1` plus `{0}` are the transient basis for `+1/2`.
-/
def shellIndicator (j k : ℕ) (hk1 : 1 ≤ k) (hkj : k + 1 ≤ j) (v : ZMod (3 ^ j)) : ℂ :=
  if projModPow j (k + 1) (by omega) v = 0 then 0
  else if projModPow j k (by omega) v = 0 then 1 else 0
 
/- Each shell indicator is a `+1/2`-eigenfunction: `2⁻¹` preserves the shell
(multiplication by a unit preserves `≡ 0 (mod 3^k)`), and `2⁻¹(3v + 1)` is a
unit, hence never in shell `k ≥ 1`. -/
/--
Each transient shell indicator `shellIndicator j k` (`1 ≤ k`, `k + 1 ≤ j`) is an exact
`+1/2`-eigenfunction of `P_levelC j` (Notes_6, with two fixes: `IsUnit.mul_val_inv`
does not exist — use `IsUnit.mul_inv_cancel`; the `projMod3`-factorization step is
replaced by a `projModPow_eq_val` + `Nat.dvd` argument, avoiding `ext1`):
* Multiplication by the unit `(2 : ZMod (3 ^ j))⁻¹` preserves divisibility by `3 ^ k` and
  `3 ^ (k + 1)` (hence preserves membership in shell `k`).
* The second branch `(2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1)` is a unit modulo `3` (by
  `unit_closed_second_branch`), so its projection modulo `3 ^ k` (`k ≥ 1`) cannot be `0`.
-/
theorem shellIndicator_is_plus_half_eigenfunction (j k : ℕ) (hk1 : 1 ≤ k)
    (hkj : k + 1 ≤ j) (v : ZMod (3 ^ j)) :
    P_levelC j (shellIndicator j k hk1 hkj) v =
      (1 / 2 : ℂ) * shellIndicator j k hk1 hkj v := by
  have h2unit : ∀ (m : ℕ) (hm : 1 ≤ m), IsUnit (2 : ZMod (3 ^ m)) := by
    intro m hm
    rw [← ZMod.natCast_zmod_val (2 : ZMod (3 ^ m)), ZMod.isUnit_iff_coprime]
    have hval : ((2 : ZMod (3 ^ m)).val) = 2 := by
      have h2m : 2 < 3 ^ m := by
        have h3m : 3 ≤ 3 ^ m := by
          calc 3 = 3 ^ 1 := by norm_num
            _ ≤ 3 ^ m := Nat.pow_le_pow_right (by decide) hm
        omega
      rw [show (2 : ZMod (3 ^ m)) = ((2 : ℕ) : ZMod (3 ^ m)) by norm_num, ZMod.val_natCast,
        Nat.mod_eq_of_lt h2m]
    rw [hval]
    exact Nat.Coprime.pow_right m (by decide : Nat.Coprime 2 3)
  -- Multiplication by `(2 : ZMod (3 ^ m))⁻¹` preserves `= 0`
  have h_inv_zero : ∀ (m : ℕ) (hm : 1 ≤ m) (x : ZMod (3 ^ m)),
      (2 : ZMod (3 ^ m))⁻¹ * x = 0 ↔ x = 0 := by
    intro m hm x
    constructor
    · intro h
      have : x = (2 : ZMod (3 ^ m)) * ((2 : ZMod (3 ^ m))⁻¹ * x) := by
        rw [← mul_assoc, ZMod.mul_inv_of_unit _ (h2unit m hm), one_mul]
      rw [h, mul_zero] at this
      exact this
    · intro h; rw [h, mul_zero]
  -- First branch preserves `shellIndicator j k`
  have h_first : shellIndicator j k hk1 hkj ((2 : ZMod (3 ^ j))⁻¹ * v) =
      shellIndicator j k hk1 hkj v := by
    simp only [shellIndicator, map_mul, projModPow_inv_two j (k + 1) (by omega) (by omega),
      projModPow_inv_two j k (by omega) hk1, h_inv_zero (k + 1) (by omega),
      h_inv_zero k hk1]
  -- Second branch is a unit modulo 3, so it is nonzero modulo `3 ^ k` (`k ≥ 1`)
  have h_second : shellIndicator j k hk1 hkj ((2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1)) = 0 := by
    set w := (2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1)
    have hw_unit : projMod3 j (by omega) w ≠ 0 := unit_closed_second_branch j (by omega) v
    have hw_k_ne : projModPow j k (by omega) w ≠ 0 := by
      intro hk0
      -- `projModPow j k w = 0` means `3 ^ k ∣ w.val` (via `projModPow_eq_val`),
      -- hence `3 ∣ w.val` (since `k ≥ 1`), hence `projMod3 w = 0` — contradiction.
      rw [projModPow_eq_val] at hk0
      have hdvd : (3 ^ k : ℕ) ∣ w.val :=
        (zmodNatCast_eq_zero_iff _ _).mp hk0
      have h3dvd : (3 : ℕ) ∣ w.val := by
        have h : (3 : ℕ) ∣ 3 ^ k := by
          calc (3 : ℕ) = 3 ^ 1 := by norm_num
            _ ∣ 3 ^ k := pow_dvd_pow 3 hk1
        exact Nat.dvd_trans h hdvd
      have h3zero : ((w.val : ℕ) : ZMod 3) = 0 :=
        (zmodNatCast_eq_zero_iff _ _).mpr h3dvd
      have hproj : projMod3 j (by omega) w = ((w.val : ℕ) : ZMod 3) := by
        rw [projMod3, ZMod.castHom_apply, ZMod.cast_eq_val]
      rw [hproj] at hw_unit
      exact hw_unit h3zero
    simp only [shellIndicator, if_neg hw_k_ne, ite_self]
  simp only [P_levelC, h_first, h_second]
  ring
 
/--
**Lower Bound `dim E_{+1/2}(P_j) ≥ j` for ALL `j ≥ 1` (Notes_6):**
The `j` functions `oneZero j` (`k = 0`) and `shellIndicator j (k + 1)` (`k = 0, ..., j - 2`)
are `+1/2`-eigenfunctions with pairwise disjoint supports (since `oneZero j` is supported on
`{0}` and `shellIndicator j m` is supported on `{v | 3^m ∣ v ∧ ¬ 3^{m+1} ∣ v}`), hence
linearly independent over `ℂ`. (The `ZMod.cast_natCast` steps in Notes_6 are
rewritten via `projModPow_eq_val` + `ZMod.val_natCast` + `Nat.mod_eq_of_lt`, using
only lemmas already in the file.)
-/
theorem plus_half_dim_ge_j (j : ℕ) (hj : 1 ≤ j) :
    j ≤ Module.finrank ℂ (eigenspaceC j (1 / 2 : ℂ)) := by
  let b : Fin j → (ZMod (3 ^ j) → ℂ) := fun idx =>
    if h0 : idx.val = 0 then oneZero j
    else shellIndicator j idx.val (by omega) (by omega)
  -- Each `b idx` is nonzero at the witness point `pt idx` and vanishes at the others.
  let pt : Fin j → ZMod (3 ^ j) := fun idx =>
    if idx.val = 0 then 0 else ((3 ^ idx.val : ℕ) : ZMod (3 ^ j))
  -- `projModPow` of a pure power `(3 ^ m : ZMod (3 ^ j))`: it is `0` mod `3 ^ n`
  -- iff `3 ^ n ∣ 3 ^ m`, i.e. iff `n ≤ m` (for `m < j`).
  have hproj_pow : ∀ (n m : ℕ) (hn : n ≤ j) (hm : m < j),
      projModPow j n hn ((3 ^ m : ℕ) : ZMod (3 ^ j)) =
        ((3 ^ m : ℕ) : ZMod (3 ^ n)) := by
    intro n m hn hm
    rw [projModPow_eq_val]
    have hval : ((3 ^ m : ℕ) : ZMod (3 ^ j)).val = 3 ^ m := by
      rw [ZMod.val_natCast, Nat.mod_eq_of_lt]
      exact Nat.pow_lt_pow_right (by decide) hm
    rw [hval]
  have hb_diag : ∀ idx : Fin j, b idx (pt idx) = 1 := by
    intro idx
    by_cases h0 : idx.val = 0
    · simp [b, pt, h0, oneZero]
    · simp only [b, pt, h0, dif_neg, ↓reduceIte, ↓reduceDIte, shellIndicator]
      have hk_zero : projModPow j idx.val (by omega) ((3 ^ idx.val : ℕ) : ZMod (3 ^ j)) = 0 := by
        rw [hproj_pow idx.val idx.val (by omega) idx.isLt]
        exact ZMod.natCast_self _
      have hk1_ne : projModPow j (idx.val + 1) (by omega) ((3 ^ idx.val : ℕ) : ZMod (3 ^ j)) ≠ 0 := by
        rw [hproj_pow (idx.val + 1) idx.val (by omega) idx.isLt,
          ne_eq, zmodNatCast_eq_zero_iff]
        intro hdvd
        have hle := Nat.le_of_dvd (by positivity) hdvd
        have hlt : 3 ^ idx.val < 3 ^ (idx.val + 1) :=
          Nat.pow_lt_pow_right (by decide) (Nat.lt_succ_self _)
        omega
      rw [if_neg hk1_ne, if_pos hk_zero]
  have hb_off : ∀ i k : Fin j, i ≠ k → b i (pt k) = 0 := by
    intro i k hik
    have hval_ne : i.val ≠ k.val := Fin.val_ne_of_ne hik
    by_cases hi0 : i.val = 0
    · have hk0 : k.val ≠ 0 := by omega
      simp only [b, pt, hi0, hk0, dif_pos, ↓reduceIte, ↓reduceDIte, oneZero, ite_eq_right_iff]
      intro hk_zero
      rw [zmodNatCast_eq_zero_iff] at hk_zero
      have hle := Nat.le_of_dvd (by positivity) hk_zero
      have hlt : 3 ^ k.val < 3 ^ j := Nat.pow_lt_pow_right (by decide) k.isLt
      omega
    · simp only [b, hi0, dif_neg, ↓reduceDIte]
      by_cases hk0 : k.val = 0
      · simp only [pt, hk0, ↓reduceIte, ↓reduceDIte, shellIndicator, map_zero, eq_self_iff_true, if_true]
      · simp only [pt, hk0, ↓reduceIte, ↓reduceDIte, shellIndicator]
        by_cases hilt : i.val < k.val
        · -- `i.val + 1 ≤ k.val`, so `3 ^ k.val` is divisible by `3 ^ (i.val + 1)`
          have hk1_zero : projModPow j (i.val + 1) (by omega) ((3 ^ k.val : ℕ) : ZMod (3 ^ j)) = 0 := by
            rw [hproj_pow (i.val + 1) k.val (by omega) k.isLt,
              zmodNatCast_eq_zero_iff]
            exact pow_dvd_pow 3 (by omega)
          rw [if_pos hk1_zero]
        · -- `k.val < i.val`, so `3 ^ i.val` does not divide `3 ^ k.val`
          have hk_ne : projModPow j i.val (by omega) ((3 ^ k.val : ℕ) : ZMod (3 ^ j)) ≠ 0 := by
            rw [hproj_pow i.val k.val (by omega) k.isLt,
              ne_eq, zmodNatCast_eq_zero_iff]
            intro hdvd
            have hle := Nat.le_of_dvd (by positivity) hdvd
            have hlt : 3 ^ k.val < 3 ^ i.val := Nat.pow_lt_pow_right (by decide) (by omega)
            omega
          rw [if_neg hk_ne, ite_eq_right_iff]
          intro _; rfl
  have hb_li : LinearIndependent ℂ b := by
    rw [Fintype.linearIndependent_iff]
    intro c hc idx
    have hpt := congrFun hc (pt idx)
    simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply] at hpt
    rw [Finset.sum_eq_single idx] at hpt
    · rw [hb_diag idx, mul_one] at hpt
      exact hpt
    · intro i _ hi_ne
      rw [hb_off i idx hi_ne, mul_zero]
    · intro hnotmem
      exact absurd (Finset.mem_univ idx) hnotmem
  have hb_mem : ∀ idx : Fin j, b idx ∈ eigenspaceC j (1 / 2 : ℂ) := by
    intro idx
    rw [mem_eigenspaceC]
    intro v
    by_cases h0 : idx.val = 0
    · simp only [b, h0, dif_pos, ↓reduceDIte]
      exact oneZero_is_plus_half_eigenfunction j hj v
    · simp only [b, h0, dif_neg, ↓reduceDIte]
      exact shellIndicator_is_plus_half_eigenfunction j idx.val (by omega) (by omega) v
  let b' : Fin j → eigenspaceC j (1 / 2 : ℂ) := fun idx => ⟨b idx, hb_mem idx⟩
  have hb'_li : LinearIndependent ℂ b' := hb_li.of_comp (eigenspaceC j (1 / 2 : ℂ)).subtype
  simpa using hb'_li.fintype_card_le_finrank
 
/- Existence of the shell alternating functions: on shell `k` (a single
`2⁻¹`-cycle of even length `2·3^{j-1-k}`, since `2` is a primitive root mod `3^{j-k}`),
there is a function with `f(2⁻¹ v) = -f(v)`, supported on shell `k`. Proved from the
cycle structure + discrete log. The explicit construction is `shellAlternating` below, and
`exists_shellAlternating` is proved. -/
/--
Explicit alternating `-1/2`-eigenfunction `ψ_{k,-}` supported on transient shell `k`
(`1 ≤ k`, `k + 1 ≤ j`): takes `-1` when `v ≡ 3^k (mod 3^{k+1})`, `+1` when
`v ≡ 2·3^k (mod 3^{k+1})`, and `0` otherwise. (Notes_7, corrected in one point:
the prose says `2⁻¹` "fixes all other residue classes" — that is FALSE pointwise,
e.g. `1 ↦ 5 (mod 9)`. What is true, and all the proof needs, is that `2⁻¹` swaps
the two support classes and preserves their complement *setwise*, since it is a
bijection mapping the 2-element support set to itself. The Lean proof below does
case analysis, never using pointwise fixing.)
-/
def shellAlternating (j k : ℕ) (hk1 : 1 ≤ k) (hkj : k + 1 ≤ j) (v : ZMod (3 ^ j)) : ℂ :=
  if projModPow j (k + 1) (by omega) v = ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) then -1
  else if projModPow j (k + 1) (by omega) v = ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) then 1
  else 0
 
/-- `shellAlternating j k` is supported inside shell `k` (`shellIndicator j k ≠ 0`).
(Notes_7's `h_factor` proof via `simp [projModPow, ...]` is replaced by
`ZMod.castHom_comp`, which is the exact transitivity statement; the unused
`h_mod_k` helper is dropped.) -/
lemma shellAlternating_support_in_shell (j k : ℕ) (hk1 : 1 ≤ k) (hkj : k + 1 ≤ j)
    (v : ZMod (3 ^ j)) (hv : shellAlternating j k hk1 hkj v ≠ 0) :
    shellIndicator j k hk1 hkj v ≠ 0 := by
  unfold shellAlternating at hv
  unfold shellIndicator
  have h1_ne : ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) ≠ 0 := by
    rw [ne_eq, zmodNatCast_eq_zero_iff]
    intro hdvd
    have hle := Nat.le_of_dvd (by positivity) hdvd
    have hlt : 3 ^ k < 3 ^ (k + 1) := Nat.pow_lt_pow_right (by decide) (Nat.lt_succ_self k)
    omega
  have h2_ne : ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) ≠ 0 := by
    rw [ne_eq, zmodNatCast_eq_zero_iff]
    intro hdvd
    have hprime : Nat.Prime 3 := by decide
    have hdvd' : 3 ^ (k + 1) ∣ 3 ^ k :=
      (Nat.Coprime.pow_left (k + 1) (by decide : Nat.Coprime 3 2)).dvd_of_dvd_mul_left hdvd
    have hle := Nat.le_of_dvd (by positivity) hdvd'
    have hlt : 3 ^ k < 3 ^ (k + 1) := Nat.pow_lt_pow_right (by decide) (Nat.lt_succ_self k)
    omega
  -- Show `projModPow j (k + 1) v ≠ 0` and `projModPow j k v = 0`
  have hk1_v : projModPow j (k + 1) (by omega) v ≠ 0 := by
    split_ifs at hv with c1 c2
    · rw [c1]; exact h1_ne
    · rw [c2]; exact h2_ne
    · exact absurd rfl hv
  have hk_v : projModPow j k (by omega) v = 0 := by
    have h_factor : projModPow j k (by omega) v =
        ZMod.castHom (pow_dvd_pow 3 (Nat.le_succ k)) (ZMod (3 ^ k))
          (projModPow j (k + 1) (by omega) v) := by
      rw [projModPow, projModPow, ← RingHom.comp_apply, ZMod.castHom_comp]
    rw [h_factor]
    split_ifs at hv with c1 c2
    · rw [c1, map_natCast, ZMod.natCast_self]
    · rw [c2, map_natCast, Nat.cast_mul, ZMod.natCast_self, mul_zero]
    · exact absurd rfl hv
  rw [if_neg hk1_v, if_pos hk_v]
  exact one_ne_zero
 
/-- First branch negates `shellAlternating j k` (extracted from Notes_7's
`shellAlternating_is_minus_half_eigenfunction` so `exists_shellAlternating` can
use it; the `set u := ...` is avoided — the proof works directly with
`projModPow j (k + 1) v`). -/
lemma shellAlternating_negates (j k : ℕ) (hk1 : 1 ≤ k) (hkj : k + 1 ≤ j)
    (v : ZMod (3 ^ j)) :
    shellAlternating j k hk1 hkj ((2 : ZMod (3 ^ j))⁻¹ * v) =
      -shellAlternating j k hk1 hkj v := by
  have h3pow : ((3 ^ (k + 1) : ℕ) : ZMod (3 ^ (k + 1))) = 0 := ZMod.natCast_self _
  -- Multiplication by `2⁻¹` swaps `3^k` and `2 * 3^k` modulo `3^{k+1}`
  have hswap1 : (2 : ZMod (3 ^ (k + 1)))⁻¹ * ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) =
      ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by
    have h4 : (2 : ZMod (3 ^ (k + 1))) * ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) =
        ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by
      have e : (2 : ZMod (3 ^ (k + 1))) * ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) =
          ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) + ((3 ^ (k + 1) : ℕ) : ZMod (3 ^ (k + 1))) := by
        push_cast; rw [pow_succ]; ring
      rw [e, h3pow, add_zero]
    calc (2 : ZMod (3 ^ (k + 1)))⁻¹ * ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1)))
        = (2 : ZMod (3 ^ (k + 1)))⁻¹ * ((2 : ZMod (3 ^ (k + 1))) *
            ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1)))) := by rw [h4]
      _ = ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by
          rw [← mul_assoc, inv_two_mul_two_pow (k + 1), one_mul]
  have hswap2 : (2 : ZMod (3 ^ (k + 1)))⁻¹ * ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) =
      ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by
    calc (2 : ZMod (3 ^ (k + 1)))⁻¹ * ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1)))
        = ((2 : ZMod (3 ^ (k + 1)))⁻¹ * 2) * ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by
          push_cast; ring
      _ = ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by rw [inv_two_mul_two_pow (k + 1), one_mul]
  -- First branch negates `shellAlternating j k`
  have hu_mul : projModPow j (k + 1) (by omega) ((2 : ZMod (3 ^ j))⁻¹ * v) =
      (2 : ZMod (3 ^ (k + 1)))⁻¹ * projModPow j (k + 1) (by omega) v := by
    rw [map_mul, projModPow_inv_two j (k + 1) (by omega) (by omega)]
  simp only [shellAlternating, hu_mul]
  have h_iff1 : (2 : ZMod (3 ^ (k + 1)))⁻¹ * projModPow j (k + 1) (by omega) v =
        ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) ↔
        projModPow j (k + 1) (by omega) v = ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by
    constructor
    · intro h
      calc projModPow j (k + 1) (by omega) v
          = (2 : ZMod (3 ^ (k + 1))) * ((2 : ZMod (3 ^ (k + 1)))⁻¹ *
              projModPow j (k + 1) (by omega) v) := by
            rw [← mul_assoc, two_mul_inv_two_pow (k + 1), one_mul]
        _ = (2 : ZMod (3 ^ (k + 1))) * ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by rw [h]
        _ = ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by push_cast; ring
    · intro h; rw [h, hswap2]
  have h_iff2 : (2 : ZMod (3 ^ (k + 1)))⁻¹ * projModPow j (k + 1) (by omega) v =
        ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) ↔
        projModPow j (k + 1) (by omega) v = ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by
    constructor
    · intro h
      calc projModPow j (k + 1) (by omega) v
          = (2 : ZMod (3 ^ (k + 1))) * ((2 : ZMod (3 ^ (k + 1)))⁻¹ *
              projModPow j (k + 1) (by omega) v) := by
            rw [← mul_assoc, two_mul_inv_two_pow (k + 1), one_mul]
        _ = (2 : ZMod (3 ^ (k + 1))) * ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by rw [h]
        _ = ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by
            have e : (2 : ZMod (3 ^ (k + 1))) * ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) =
                ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) + ((3 ^ (k + 1) : ℕ) : ZMod (3 ^ (k + 1))) := by
              push_cast; rw [pow_succ]; ring
            rw [e, h3pow, add_zero]
    · intro h; rw [h, hswap1]
  by_cases hc1 : projModPow j (k + 1) (by omega) v = ((3 ^ k : ℕ) : ZMod (3 ^ (k + 1)))
  · have hnc2 : ¬ projModPow j (k + 1) (by omega) v =
        ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1))) := by
      rw [hc1, ZMod.natCast_eq_natCast_iff']
      have hm1 : 3 ^ k % 3 ^ (k + 1) = 3 ^ k :=
        Nat.mod_eq_of_lt (Nat.pow_lt_pow_right (by decide) (Nat.lt_succ_self k))
      have hm2 : (2 * 3 ^ k) % 3 ^ (k + 1) = 2 * 3 ^ k := by
        apply Nat.mod_eq_of_lt
        have h3k : 0 < 3 ^ k := by positivity
        rw [pow_succ]; omega
      have h3k : 0 < 3 ^ k := by positivity
      rw [hm1, hm2]; omega
    rw [if_pos hc1, if_neg (mt h_iff1.mp hnc2), if_pos (h_iff2.mpr hc1)]
    ring
  · rw [if_neg hc1, if_neg (mt h_iff2.mp hc1)]
    by_cases hc2 : projModPow j (k + 1) (by omega) v = ((2 * 3 ^ k : ℕ) : ZMod (3 ^ (k + 1)))
    · rw [if_pos hc2, if_pos (h_iff1.mpr hc2)]
    · rw [if_neg hc2, if_neg (mt h_iff1.mp hc2), neg_zero]
 
/-- `shellAlternating j k` is an exact `-1/2`-eigenfunction of `P_levelC j`. -/
theorem shellAlternating_is_minus_half_eigenfunction (j k : ℕ) (hk1 : 1 ≤ k)
    (hkj : k + 1 ≤ j) (v : ZMod (3 ^ j)) :
    P_levelC j (shellAlternating j k hk1 hkj) v =
      (-1 / 2 : ℂ) * shellAlternating j k hk1 hkj v := by
  -- Second branch is a unit mod 3, hence outside shell `k ≥ 1`
  have h_second : shellAlternating j k hk1 hkj ((2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1)) = 0 := by
    by_contra hne
    have hsh := shellAlternating_support_in_shell j k hk1 hkj _ hne
    have hw_unit := unit_closed_second_branch j (by omega) v
    -- `shellIndicator` vanishes on units (same argument as in
    -- `shellIndicator_is_plus_half_eigenfunction`)
    set w := (2 : ZMod (3 ^ j))⁻¹ * (3 * v + 1)
    have hw_k_ne : projModPow j k (by omega) w ≠ 0 := by
      intro hk0
      rw [projModPow_eq_val] at hk0
      have hdvd : (3 ^ k : ℕ) ∣ w.val := (zmodNatCast_eq_zero_iff _ _).mp hk0
      have h3dvd : (3 : ℕ) ∣ w.val :=
        Nat.dvd_trans (by calc (3 : ℕ) = 3 ^ 1 := by norm_num
                            _ ∣ 3 ^ k := pow_dvd_pow 3 hk1) hdvd
      have h3zero : ((w.val : ℕ) : ZMod 3) = 0 :=
        (zmodNatCast_eq_zero_iff _ _).mpr h3dvd
      have hproj : projMod3 j (by omega) w = ((w.val : ℕ) : ZMod 3) := by
        rw [projMod3, ZMod.castHom_apply, ZMod.cast_eq_val]
      rw [hproj] at hw_unit
      exact hw_unit h3zero
    unfold shellIndicator at hsh
    rw [if_neg hw_k_ne, ite_self] at hsh
    exact hsh rfl
  simp only [P_levelC, shellAlternating_negates j k hk1 hkj v, h_second]
  ring
 
/-- **Closes `exists_shellAlternating` (Notes_7, strengthened):** Notes_7 proves the
`∨ True` escape hatch (`Or.inr trivial`), which is vacuous. The `∨ True` is dropped
here — `shellAlternating` genuinely satisfies `f(2⁻¹ v) = -f v` (via
`shellAlternating_negates`), so the strong statement holds. -/
theorem exists_shellAlternating (j k : ℕ) (hk1 : 1 ≤ k) (hkj : k + 1 ≤ j) :
    ∃ f : ZMod (3 ^ j) → ℂ,
      (∀ v, f v ≠ 0 → shellIndicator j k hk1 hkj v ≠ 0) ∧
      (∀ v, f ((2 : ZMod (3 ^ j))⁻¹ * v) = -f v) :=
  ⟨shellAlternating j k hk1 hkj,
   shellAlternating_support_in_shell j k hk1 hkj,
   shellAlternating_negates j k hk1 hkj⟩
 
/--
**Lower Bound `dim E_{-1/2}(P_j) ≥ j` for ALL `j ≥ 1` (Notes_7):**
Uses `b 0 = f_lifted j hj` (embedded in `ℂ`) and `b k = shellAlternating j k` for
`1 ≤ k < j`. The evaluation matrix `M_{i,k} = b_i(pt_k)` is *upper-triangular*,
not diagonal: `b_0(pt_k) = 1/2` for every `k` (since `3^k ≡ 0 (mod 3)`), while
`b_i(pt_0) = 0` for `i ≥ 1` and `b_i(pt_k) = 0` for `i, k ≥ 1`, `i ≠ k` (disjoint
shells). So evaluate at `pt_0 = 0` first to kill `c_0`, then at each `pt_idx`.
(The draft's `hb_off`, which leaves the `i = 0` case as an unproved placeholder,
is dropped — the upper-triangular finish below replaces it.)
-/
theorem minus_half_dim_ge_j (j : ℕ) (hj : 1 ≤ j) :
    j ≤ Module.finrank ℂ (eigenspaceC j (-1 / 2 : ℂ)) := by
  let b : Fin j → (ZMod (3 ^ j) → ℂ) := fun idx =>
    if h0 : idx.val = 0 then fun v => (f_lifted j hj v : ℂ)
    else shellAlternating j idx.val (by omega) (by omega)
  let pt : Fin j → ZMod (3 ^ j) := fun idx =>
    if idx.val = 0 then 0 else ((3 ^ idx.val : ℕ) : ZMod (3 ^ j))
  have hproj_pow : ∀ (n m : ℕ) (hn : n ≤ j) (hm : m < j),
      projModPow j n hn ((3 ^ m : ℕ) : ZMod (3 ^ j)) =
        ((3 ^ m : ℕ) : ZMod (3 ^ n)) := by
    intro n m hn hm
    rw [projModPow_eq_val]
    have hval : ((3 ^ m : ℕ) : ZMod (3 ^ j)).val = 3 ^ m := by
      rw [ZMod.val_natCast, Nat.mod_eq_of_lt]
      exact Nat.pow_lt_pow_right (by decide) hm
    rw [hval]
  have hb_diag : ∀ idx : Fin j, b idx (pt idx) ≠ 0 := by
    intro idx
    by_cases h0 : idx.val = 0
    · simp only [b, pt, h0, dif_pos, ↓reduceIte, ↓reduceDIte, f_lifted, projMod3_zero j hj, g_witness]
      norm_num
    · simp only [b, pt, h0, dif_neg, ↓reduceIte, ↓reduceDIte, shellAlternating]
      have h_eq : projModPow j (idx.val + 1) (by omega) ((3 ^ idx.val : ℕ) : ZMod (3 ^ j)) =
          ((3 ^ idx.val : ℕ) : ZMod (3 ^ (idx.val + 1))) :=
        hproj_pow (idx.val + 1) idx.val (by omega) idx.isLt
      rw [if_pos h_eq]
      norm_num
  have hb_li : LinearIndependent ℂ b := by
    rw [Fintype.linearIndependent_iff]
    intro c hc
    -- First show `c 0 = 0` by evaluating at `pt ⟨0, hj⟩ = 0`
    have hc0 : c ⟨0, hj⟩ = 0 := by
      have hpt0 := congrFun hc (pt ⟨0, hj⟩)
      simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply] at hpt0
      rw [Finset.sum_eq_single ⟨0, hj⟩] at hpt0
      · exact (mul_eq_zero.mp hpt0).resolve_right (hb_diag ⟨0, hj⟩)
      · intro i _ hi_ne
        have hi0 : i.val ≠ 0 := Fin.val_ne_of_ne hi_ne
        have hzero : b i (pt ⟨0, hj⟩) = 0 := by
          -- `shellAlternating` vanishes at `0`
          by_contra hne
          simp only [b, hi0, dif_neg, ↓reduceDIte] at hne
          have hsh := shellAlternating_support_in_shell j i.val (by omega) (by omega) _ hne
          simp [pt, shellIndicator] at hsh
        rw [hzero, mul_zero]
      · intro hnotmem; exact absurd (Finset.mem_univ _) hnotmem
    -- Now for `idx` with `idx.val ≠ 0`, evaluate at `pt idx` (where `c 0 * b 0 (pt idx) = 0` since `c 0 = 0`!)
    intro idx
    by_cases h0 : idx.val = 0
    · have : idx = ⟨0, hj⟩ := Fin.ext h0
      rw [this]; exact hc0
    · have hpt := congrFun hc (pt idx)
      simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul, Pi.zero_apply] at hpt
      rw [Finset.sum_eq_single idx] at hpt
      · exact (mul_eq_zero.mp hpt).resolve_right (hb_diag idx)
      · intro i _ hi_ne
        by_cases hi0 : i.val = 0
        · have : i = ⟨0, hj⟩ := Fin.ext hi0
          rw [this, hc0, zero_mul]
        · -- Both `i.val ≠ 0` and `idx.val ≠ 0` with `i ≠ idx`: disjoint shells!
          have hzero : b i (pt idx) = 0 := by
            by_contra hne
            simp only [b, hi0, dif_neg, ↓reduceDIte] at hne
            have hsh := shellAlternating_support_in_shell j i.val (by omega) (by omega) _ hne
            simp only [pt, h0, ↓reduceIte, ↓reduceDIte, shellIndicator] at hsh
            by_cases hilt : i.val < idx.val
            · have hk1_zero : projModPow j (i.val + 1) (by omega) ((3 ^ idx.val : ℕ) : ZMod (3 ^ j)) = 0 := by
                rw [hproj_pow (i.val + 1) idx.val (by omega) idx.isLt, zmodNatCast_eq_zero_iff]
                exact pow_dvd_pow 3 (by omega)
              rw [if_pos hk1_zero] at hsh
              exact hsh rfl
            · have hk_ne : projModPow j i.val (by omega) ((3 ^ idx.val : ℕ) : ZMod (3 ^ j)) ≠ 0 := by
                rw [hproj_pow i.val idx.val (by omega) idx.isLt, ne_eq, zmodNatCast_eq_zero_iff]
                intro hdvd
                have := Nat.le_of_dvd (by positivity) hdvd
                have := Nat.pow_lt_pow_right (by decide : 1 < 3) (by omega : idx.val < i.val)
                omega
              rw [if_neg hk_ne, ite_self] at hsh
              exact hsh rfl
          rw [hzero, mul_zero]
      · intro hnotmem; exact absurd (Finset.mem_univ idx) hnotmem
  have hb_mem : ∀ idx : Fin j, b idx ∈ eigenspaceC j (-1 / 2 : ℂ) := by
    intro idx
    rw [mem_eigenspaceC]
    intro v
    by_cases h0 : idx.val = 0
    · simp only [b, h0, dif_pos]
      rw [P_levelC_ofReal, f_lifted_is_eigenfunction j hj v]
      push_cast; rfl
    · simp only [b, h0, dif_neg]
      exact shellAlternating_is_minus_half_eigenfunction j idx.val (by omega) (by omega) v
  let b' : Fin j → eigenspaceC j (-1 / 2 : ℂ) := fun idx => ⟨b idx, hb_mem idx⟩
  have hb'_li : LinearIndependent ℂ b' := hb_li.of_comp (eigenspaceC j (-1 / 2 : ℂ)).subtype
  simpa using hb'_li.fintype_card_le_finrank
 
/-- Lower bound for both signs, now fully proved (moved here from its original
position because it depends on `plus_half_dim_ge_j` / `minus_half_dim_ge_j`,
which are proved in the shell section above). -/
theorem dim_eigenspace_half_ge_j (j : ℕ) (hj : 1 ≤ j) (lam : ℂ)
    (hlam : lam = 1 / 2 ∨ lam = -1 / 2) :
    j ≤ Module.finrank ℂ (eigenspaceC j lam) := by
  rcases hlam with rfl | rfl
  · exact plus_half_dim_ge_j j hj
  · exact minus_half_dim_ge_j j hj
 
/-- The `±1/2` eigenspaces on the units: `0` dimensions for `+1/2`
(`(2X - 1)` divides out of the unit characteristic polynomial) and `1` dimension
for `-1/2` (from `g_witness`). Open: needs the `P_j^unit` characteristic polynomial. -/
theorem unit_eigenspace_dim (j : ℕ) (hj : 1 ≤ j) :
    True := by
  trivial
 
/-
**Two-step relation (used by Notes_5).** For `lam = ±1/2`,
`δ((2⁻¹)^2 v) = δ(v)`: applying `fiberDiff_dynamics_second_relation` twice,
with the companion relation `Δ(2⁻¹ v) = 2·lam·Δ^{(2)}(v)` (proved the same way,
using `2⁻¹·2·3^j = 3^j` for the `Δ^{(2)}` shift), gives
`δ((2⁻¹)^2 v) = (2·lam)^2·δ(v) = δ(v)` since `(2·lam)^2 = 1`.
-/
/-- Companion dynamical relation for `fiberDiff2` (Notes_6):
`Δ_j f(2⁻¹ v) = 2 * lam * Δ_j^{(2)} f(v)`. Same proof shape as
`fiberDiff_dynamics_second_relation`, using `2⁻¹·2·3^j = 3^j` for the `Δ^{(2)}` shift
and `6·3^j = 0` for the second branch. -/
theorem fiberDiff2_dynamics_relation (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ)
    (lam : ℂ) (heig : ∀ v : ZMod (3 ^ (j + 1)), P_levelC (j + 1) f v = lam * f v)
    (v : ZMod (3 ^ (j + 1))) :
    fiberDiff j f ((2 : ZMod (3 ^ (j + 1)))⁻¹ * v) =
      2 * lam * fiberDiff2 j f v := by
  have h3pow : ((3 ^ (j + 1) : ℕ) : ZMod (3 ^ (j + 1))) = 0 := ZMod.natCast_self _
  have h_inv_shift2 :
      (2 : ZMod (3 ^ (j + 1)))⁻¹ * (2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) =
      ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
    calc (2 : ZMod (3 ^ (j + 1)))⁻¹ * (2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))))
        = ((2 : ZMod (3 ^ (j + 1)))⁻¹ * 2) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by ring
      _ = 1 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by rw [inv_two_mul_two_pow (j + 1)]
      _ = ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := one_mul _
  have h_shift2 :
      (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) + 1) =
      (2 : ZMod (3 ^ (j + 1)))⁻¹ * (3 * v + 1) := by
    have h6 : 6 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = 0 := by
      have e : 6 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
          2 * ((3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) := by ring
      have h3 : (3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = 0 := by
        have hcast : (3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
            ((3 ^ (j + 1) : ℕ) : ZMod (3 ^ (j + 1))) := by
          push_cast; ring
        rw [hcast, h3pow]
      rw [e, h3, mul_zero]
    have e : 3 * (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) + 1 = 3 * v + 1 := by
      linear_combination h6
    rw [e]
  have hΔP : P_levelC (j + 1) f (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) -
      P_levelC (j + 1) f v = lam * fiberDiff2 j f v := by
    rw [heig (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))), heig v]
    simp only [fiberDiff2]
    ring
  have hP : P_levelC (j + 1) f (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) -
      P_levelC (j + 1) f v =
      (1 / 2 : ℂ) * fiberDiff j f ((2 : ZMod (3 ^ (j + 1)))⁻¹ * v) := by
    simp only [P_levelC, fiberDiff]
    have h_shift1 :
        (2 : ZMod (3 ^ (j + 1)))⁻¹ * (v + 2 * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) =
        (2 : ZMod (3 ^ (j + 1)))⁻¹ * v + ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
      rw [mul_add, h_inv_shift2]
    rw [h_shift1, h_shift2]
    ring
  rw [hP] at hΔP
  linear_combination 2 * hΔP
 
/-- General 2-step fiber relation: `δ((2⁻¹)^2 * v) = (2 * lam)^2 * δ(v)`. -/
lemma fiberDiff_two_step_general (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ)
    (lam : ℂ) (heig : ∀ v : ZMod (3 ^ (j + 1)), P_levelC (j + 1) f v = lam * f v)
    (v : ZMod (3 ^ (j + 1))) :
    fiberDiff j f (((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ 2 * v) =
      (2 * lam) ^ 2 * fiberDiff j f v := by
  have h1 := fiberDiff2_dynamics_relation j f lam heig ((2 : ZMod (3 ^ (j + 1)))⁻¹ * v)
  have h2 := fiberDiff_dynamics_second_relation j f lam heig v
  have hmul : ((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ 2 * v =
      (2 : ZMod (3 ^ (j + 1)))⁻¹ * ((2 : ZMod (3 ^ (j + 1)))⁻¹ * v) := by ring
  rw [hmul, h1, h2]
  ring
 
/-- **Two-step relation at `lam = ±1/2` (closes the `fiberDiff_two_step` stub):** -/
theorem fiberDiff_two_step (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ) (lam : ℂ)
    (hlam : lam = 1 / 2 ∨ lam = -1 / 2)
    (heig : ∀ v : ZMod (3 ^ (j + 1)), P_levelC (j + 1) f v = lam * f v)
    (v : ZMod (3 ^ (j + 1))) :
    fiberDiff j f ((2 : ZMod (3 ^ (j + 1)))⁻¹ * ((2 : ZMod (3 ^ (j + 1)))⁻¹ * v)) =
      fiberDiff j f v := by
  have hsq : ((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ 2 * v =
      (2 : ZMod (3 ^ (j + 1)))⁻¹ * ((2 : ZMod (3 ^ (j + 1)))⁻¹ * v) := by ring
  rw [← hsq, fiberDiff_two_step_general j f lam heig v]
  rcases hlam with rfl | rfl <;> norm_num
 
/--
For any `j ≥ 1`, `lam = ±1/2`, and `f ∈ eigenspaceC (j + 1) lam`, the top-digit
fiber difference `fiberDiff j f` vanishes identically at every `v ∉ {0, 3^j, 2·3^j}`,
i.e., whenever `projModPow (j + 1) j (Nat.le_succ j) v ≠ 0`.
-/
lemma fiberDiff_eq_zero_of_proj_ne_zero (j : ℕ) (hj : 1 ≤ j)
    (lam : ℂ) (hlam : lam = 1 / 2 ∨ lam = -1 / 2)
    (f : ZMod (3 ^ (j + 1)) → ℂ) (hf : f ∈ eigenspaceC (j + 1) lam)
    (v : ZMod (3 ^ (j + 1)))
    (hv : projModPow (j + 1) j (Nat.le_succ j) v ≠ 0) :
    fiberDiff j f v = 0 := by
  rw [mem_eigenspaceC] at hf
  have hnot_j : ¬ (3 ^ j : ℕ) ∣ v.val := by
    intro hdvd
    apply hv
    rw [projModPow_eq_val, zmodNatCast_eq_zero_iff]
    exact hdvd
  have hv_ne : v.val ≠ 0 := by
    intro h0; rw [h0] at hnot_j; exact hnot_j (dvd_zero _)
  let k := padicValNat 3 v.val
  have hk_dvd : 3 ^ k ∣ v.val := pow_padicValNat_dvd
  have hk1_ndvd : ¬ 3 ^ (k + 1) ∣ v.val :=
    pow_succ_padicValNat_not_dvd hv_ne
  have hk_lt : k < j := by
    by_contra hge
    push_neg at hge
    exact hnot_j (dvd_trans (pow_dvd_pow 3 hge) hk_dvd)
  have h_iter : ∀ (n : ℕ) (x : ZMod (3 ^ (j + 1))),
      fiberDiff j f (((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * n) * x) = fiberDiff j f x := by
    intro n
    induction n with
    | zero => intro x; simp
    | succ n ih =>
      intro x
      have hsp : ((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * (n + 1)) * x =
          (2 : ZMod (3 ^ (j + 1)))⁻¹ * ((2 : ZMod (3 ^ (j + 1)))⁻¹ *
            (((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * n) * x)) := by
        ring
      rw [hsp, fiberDiff_two_step j f lam hlam hf, ih x]
  let m := j - 1 - k
  have hm_eq : m + 1 = j - k := by omega
  have hm2_eq : m + 2 = j + 1 - k := by omega
  have h4mod := four_pow_three_pow_mod m
  rw [hm_eq, hm2_eq] at h4mod
  obtain ⟨u, hu⟩ := hk_dvd
  have hu_ndvd : ¬ 3 ∣ u := by
    intro h3u
    apply hk1_ndvd
    obtain ⟨w, rfl⟩ := h3u
    exact ⟨w, by rw [hu, pow_succ']; ring⟩
  have h4mul_v : ((4 : ZMod (3 ^ (j + 1))) ^ (3 ^ m)) * v =
      v + (u : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
    have h4_nat : (4 ^ (3 ^ m) * v.val) % 3 ^ (j + 1) =
        ((1 + 3 ^ (j - k)) * v.val) % 3 ^ (j + 1) := by
      rw [hu]
      -- Scale `h4mod` by `u` (same modulus), then by `3 ^ k` (modulus scales too).
      have hcong : (3 ^ k * (u * (4 ^ (3 ^ m)))) ≡
          (3 ^ k * (u * (1 + 3 ^ (j - k)))) [MOD 3 ^ k * 3 ^ (j + 1 - k)] :=
        Nat.ModEq.mul_left' (3 ^ k) (Nat.ModEq.mul_left u h4mod)
      rw [Nat.ModEq] at hcong
      have e3 : 3 ^ (j + 1) = 3 ^ k * 3 ^ (j + 1 - k) := by
        rw [← pow_add]; congr 1; omega
      rw [e3]
      have e1 : 4 ^ (3 ^ m) * (3 ^ k * u) = 3 ^ k * (u * 4 ^ (3 ^ m)) := by ring
      have e2 : (1 + 3 ^ (j - k)) * (3 ^ k * u) = 3 ^ k * (u * (1 + 3 ^ (j - k))) := by ring
      rw [e1, e2]
      exact hcong
    have hv_cast : ((v.val : ℕ) : ZMod (3 ^ (j + 1))) = v := ZMod.natCast_zmod_val v
    have h_eq_nat : ((4 ^ (3 ^ m) * v.val : ℕ) : ZMod (3 ^ (j + 1))) =
        (((1 + 3 ^ (j - k)) * v.val : ℕ) : ZMod (3 ^ (j + 1))) := by
      rw [ZMod.natCast_eq_natCast_iff]
      exact h4_nat
    push_cast at h_eq_nat
    rw [hv_cast] at h_eq_nat
    rw [h_eq_nat]
    have h_shift_term : ((3 ^ (j - k) : ℕ) : ZMod (3 ^ (j + 1))) * v =
        (u : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
      rw [← hv_cast, hu]
      push_cast
      rw [← mul_assoc, ← pow_add, Nat.sub_add_cancel (by omega : k ≤ j)]
      ring
    calc (1 + (3 : ZMod (3 ^ (j + 1))) ^ (j - k)) * v
        = v + ((3 ^ (j - k) : ℕ) : ZMod (3 ^ (j + 1))) * v := by push_cast; ring
      _ = v + (u : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by rw [h_shift_term]
  have h4_inv : ∀ x : ZMod (3 ^ (j + 1)),
      fiberDiff j f (((4 : ZMod (3 ^ (j + 1))) ^ (3 ^ m)) * x) = fiberDiff j f x := by
    intro x
    have h4eq : ((4 : ZMod (3 ^ (j + 1))) ^ (3 ^ m)) *
        (((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * 3 ^ m) * x) = x := by
      have h4_2 : (4 : ZMod (3 ^ (j + 1))) = (2 : ZMod (3 ^ (j + 1))) ^ 2 := by norm_num
      rw [h4_2, ← pow_mul, ← mul_assoc, ← mul_pow, two_mul_inv_two_pow (j + 1), one_pow, one_mul]
    -- Notes_9's `conv_rhs => rw [← h4eq]` does not match (the `4 ^ ·` factor sits
    -- outside); instead use `h_iter` at the point `4 ^ · * x` and the swapped product.
    have hswap : ((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * 3 ^ m) *
        ((4 : ZMod (3 ^ (j + 1))) ^ (3 ^ m) * x) = x := by
      rw [← mul_assoc, mul_comm (((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * 3 ^ m))
        ((4 : ZMod (3 ^ (j + 1))) ^ (3 ^ m)), mul_assoc]
      exact h4eq
    calc fiberDiff j f ((4 : ZMod (3 ^ (j + 1))) ^ (3 ^ m) * x)
        = fiberDiff j f (((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * 3 ^ m) *
            ((4 : ZMod (3 ^ (j + 1))) ^ (3 ^ m) * x)) := by
          rw [h_iter (3 ^ m)]
      _ = fiberDiff j f x := by rw [hswap]
  have h4_3j : ((4 : ZMod (3 ^ (j + 1))) ^ (3 ^ m)) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
      ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
    have h3zero : (3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = 0 := by
      have hcast : (3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
          ((3 ^ (j + 1) : ℕ) : ZMod (3 ^ (j + 1))) := by push_cast; ring
      rw [hcast]; exact ZMod.natCast_self _
    have h4_1 : (4 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
        ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
      have e : (4 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
          ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) +
            (3 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by ring
      rw [e, h3zero, add_zero]
    induction (3 ^ m) with
    | zero => simp
    | succ n ihn => rw [pow_succ (4 : ZMod (3 ^ (j + 1))) n, mul_assoc, h4_1, ihn]
  set s := ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))
  have h3s : (3 : ZMod (3 ^ (j + 1))) * s = 0 := by
    have hcast : (3 : ZMod (3 ^ (j + 1))) * s =
        ((3 ^ (j + 1) : ℕ) : ZMod (3 ^ (j + 1))) := by dsimp [s]; push_cast; ring
    rw [hcast]; exact ZMod.natCast_self _
  have hu_mod : u % 3 = 1 ∨ u % 3 = 2 := by
    have hlt := Nat.mod_lt u (by decide : 0 < 3)
    have hne0 : u % 3 ≠ 0 := Nat.dvd_iff_mod_eq_zero.not.mp hu_ndvd
    omega
  have hu_s : (u : ZMod (3 ^ (j + 1))) * s = ((u % 3 : ℕ) : ZMod (3 ^ (j + 1))) * s := by
    have hdiv_mod : u = 3 * (u / 3) + u % 3 := (Nat.div_add_mod u 3).symm
    conv_lhs => rw [hdiv_mod]
    push_cast
    calc ((3 : ZMod (3 ^ (j + 1))) * (u / 3 : ℕ) + (u % 3 : ℕ)) * s
        = (u / 3 : ℕ) * ((3 : ZMod (3 ^ (j + 1))) * s) + (u % 3 : ℕ) * s := by ring
      _ = (u % 3 : ℕ) * s := by rw [h3s, mul_zero, zero_add]
  have hsum := fiberDiff_sum j f v
  have h_inv_v := h4_inv v
  have h_inv_vs := h4_inv (v + s)
  rw [h4mul_v, hu_s] at h_inv_v
  have h4mul_vs : ((4 : ZMod (3 ^ (j + 1))) ^ (3 ^ m)) * (v + s) =
      v + s + ((u % 3 : ℕ) : ZMod (3 ^ (j + 1))) * s := by
    rw [mul_add, h4mul_v, hu_s, h4_3j]; ring
  rw [h4mul_vs] at h_inv_vs
  rcases hu_mod with hm1 | hm2
  · rw [hm1, Nat.cast_one, one_mul] at h_inv_v h_inv_vs
    have he1 : v + s + s = v + 2 * s := by ring
    rw [he1] at h_inv_vs
    rw [h_inv_v] at h_inv_vs
    rw [h_inv_v, h_inv_vs] at hsum
    have h3 : (3 : ℂ) * fiberDiff j f v = 0 := by linear_combination hsum
    exact (mul_eq_zero.mp h3).resolve_left (by norm_num)
  · rw [hm2, Nat.cast_ofNat] at h_inv_v h_inv_vs
    have he2 : v + s + 2 * s = v := by
      have : v + s + 2 * s = v + 3 * s := by ring
      rw [this, h3s, add_zero]
    rw [he2] at h_inv_vs
    rw [h_inv_v, ← h_inv_vs] at hsum
    have h3 : (3 : ℂ) * fiberDiff j f v = 0 := by linear_combination hsum
    exact (mul_eq_zero.mp h3).resolve_left (by norm_num)
 
/-- **Euler Iteration on Fibers:** `(2 * lam)^(2 * 3^j) * Δ_j f(v) = Δ_j f(v)`.
Iterate `fiberDiff_two_step_general` `3^j` times, then use Euler's theorem:
`(2⁻¹)^(2·3^j) = (2⁻¹)^(φ(3^{j+1})) = 1` in `ZMod (3^{j+1})`. -/
lemma fiberDiff_pow_totient (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ)
    (lam : ℂ) (heig : ∀ v : ZMod (3 ^ (j + 1)), P_levelC (j + 1) f v = lam * f v)
    (v : ZMod (3 ^ (j + 1))) :
    (2 * lam) ^ (2 * 3 ^ j) * fiberDiff j f v = fiberDiff j f v := by
  have h_iter : ∀ (k : ℕ) (u : ZMod (3 ^ (j + 1))),
      fiberDiff j f (((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * k) * u) =
      (2 * lam) ^ (2 * k) * fiberDiff j f u := by
    intro k
    induction k with
    | zero => intro u; simp
    | succ k ih =>
      intro u
      have hpow_split : ((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * (k + 1)) * u =
          ((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ 2 * (((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * k) * u) := by
        ring
      rw [hpow_split, fiberDiff_two_step_general j f lam heig, ih u, Nat.mul_succ, pow_add]
      ring
  have h_tot : Nat.totient (3 ^ (j + 1)) = 2 * 3 ^ j := by
    rw [Nat.totient_prime_pow (by decide : Nat.Prime 3) (by omega : 0 < j + 1)]
    simp only [Nat.add_sub_cancel]
    ring
  have h_unit : IsUnit ((2 : ZMod (3 ^ (j + 1)))⁻¹) :=
    ⟨⟨(2 : ZMod (3 ^ (j + 1)))⁻¹, 2, inv_two_mul_two_pow (j + 1), two_mul_inv_two_pow (j + 1)⟩, rfl⟩
  have h_euler : ((2 : ZMod (3 ^ (j + 1)))⁻¹) ^ (2 * 3 ^ j) = 1 := by
    rw [← h_tot]
    have h := congrArg Units.val (ZMod.pow_totient h_unit.unit)
    rwa [Units.val_pow_eq_pow_val, IsUnit.unit_spec, Units.val_one] at h
  have h_spec := h_iter (3 ^ j) v
  rw [h_euler, one_mul] at h_spec
  exact h_spec.symm
 
/-- If `fiberDiff j f = 0` everywhere, then `f` is constant on fibers of
`projModPow (j + 1) j` (Notes_6, with the `ker_castHom` / `k.natAbs` step replaced:
the kernel element is obtained as a `ℕ`-multiple of `3^j` via `projModPow_eq_val`
+ `zmodNatCast_eq_zero_iff`, so no `ℤ` sign issue arises). -/
lemma eq_of_projModPow_eq_of_fiberDiff_zero (j : ℕ) (f : ZMod (3 ^ (j + 1)) → ℂ)
    (hdiff : ∀ v : ZMod (3 ^ (j + 1)), fiberDiff j f v = 0)
    {u w : ZMod (3 ^ (j + 1))}
    (hp : projModPow (j + 1) j (Nat.le_succ j) u = projModPow (j + 1) j (Nat.le_succ j) w) :
    f u = f w := by
  have hshift : ∀ (k : ℕ) (x : ZMod (3 ^ (j + 1))),
      f (x + (k : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) = f x := by
    intro k
    induction k with
    | zero => intro x; simp
    | succ k ih =>
      intro x
      have hk := hdiff (x + (k : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))))
      simp only [fiberDiff, sub_eq_zero] at hk
      have heq : x + ((k + 1 : ℕ) : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) =
          x + (k : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) +
            ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
        push_cast; ring
      rw [heq, hk, ih x]
  -- `u - w` is a multiple of `3 ^ j`: `projModPow (u - w) = 0` means `3 ^ j ∣ (u - w).val`.
  have hker : (3 ^ j : ℕ) ∣ (u - w).val := by
    have h0 : projModPow (j + 1) j (Nat.le_succ j) (u - w) = 0 := by
      rw [map_sub, hp, sub_self]
    rw [projModPow_eq_val] at h0
    exact (zmodNatCast_eq_zero_iff _ _).mp h0
  obtain ⟨k, hk⟩ := hker
  have h1 : u - w = ((3 ^ j * k : ℕ) : ZMod (3 ^ (j + 1))) := by
    have hval : ((u - w).val : ZMod (3 ^ (j + 1))) = u - w := ZMod.natCast_zmod_val (u - w)
    rw [← hval, hk]
  have hu : u = w + (k : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
    have hcast : ((3 ^ j * k : ℕ) : ZMod (3 ^ (j + 1))) =
        (k : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
      push_cast; ring
    rw [← hcast]
    linear_combination h1
  rw [hu]
  exact hshift k w
 
/--
Upper Bound dim E_{±1/2}(P_j) ≤ j for ALL j ≥ 1 (closes the final hole!):
By induction on j ≥ 1:
 
Base j = 1: dim_eigenspace_half_le_one.
 
Step j → j + 1: Consider D : eigenspaceC (j + 1) lam →ₗ[ℂ] (ZMod (3 ^ (j + 1)) → ℂ),
f ↦ fiberDiff j f.
 
LinearMap.ker D embeds into eigenspaceC j lam via eq_of_projModPow_eq_of_fiberDiff_zero,
so finrank (ker D) ≤ j by the induction hypothesis.
 
LinearMap.range D is supported on the single fiber {0, 3^j, 2·3^j} (by
fiberDiff_eq_zero_of_proj_ne_zero) and satisfies δ(0) + δ(3^j) + δ(2·3^j) = 0 and
δ(2·3^j) = (2 * lam) * δ(3^j) (from fiberDiff_dynamics_second_relation at v = 0),
which forces range D to be at most 1-dimensional (spanned by fiberDiff j (oneZero (j + 1))
at lam = +1/2 and by fiberDiff j (shellAlternating (j + 1) j ...) at lam = -1/2).
 
Rank-nullity gives finrank (eigenspaceC (j + 1) lam) ≤ 1 + j = j + 1.
-/
theorem dim_eigenspace_half_le_j (j : ℕ) (hj : 1 ≤ j) (lam : ℂ)
    (hlam : lam = 1 / 2 ∨ lam = -1 / 2) :
    Module.finrank ℂ (eigenspaceC j lam) ≤ j := by
  induction j, hj using Nat.le_induction with
  | base =>
    exact dim_eigenspace_half_le_one lam hlam
  | succ j hj ih =>
    let D : eigenspaceC (j + 1) lam →ₗ[ℂ] (ZMod (3 ^ (j + 1)) → ℂ) :=
      { toFun := fun f => fiberDiff j f.1
        map_add' := fun f g => by funext v; simp [fiberDiff]; ring
        map_smul' := fun c f => by funext v; simp [fiberDiff]; ring }
    let L : eigenspaceC j lam →ₗ[ℂ] eigenspaceC (j + 1) lam :=
      { toFun := fun g => ⟨fun v => g.1 (projModPow (j + 1) j (Nat.le_succ j) v), by
          rw [mem_eigenspaceC]
          intro v
          have hg := (mem_eigenspaceC j lam g.1).mp g.2 (projModPow (j + 1) j (Nat.le_succ j) v)
          simp only [P_levelC, map_mul, map_add, map_ofNat, map_one,
            projModPow_inv_two (j + 1) j (Nat.le_succ j) hj] at hg ⊢
          exact hg⟩
        map_add' := fun _ _ => rfl
        map_smul' := fun _ _ => rfl }
    have hker_le : LinearMap.ker D ≤ LinearMap.range L := by
      intro f hf
      rw [LinearMap.mem_ker] at hf
      have hdiff : ∀ v, fiberDiff j f.1 v = 0 := fun v => congrFun hf v
      have hsurj : Function.Surjective (projModPow (j + 1) j (Nat.le_succ j)) :=
        ZMod.castHom_surjective (pow_dvd_pow 3 (Nat.le_succ j))
      let g : ZMod (3 ^ j) → ℂ := fun r => f.1 (Function.surjInv hsurj r)
      have hfg : ∀ v : ZMod (3 ^ (j + 1)),
          f.1 v = g (projModPow (j + 1) j (Nat.le_succ j) v) := fun v =>
        eq_of_projModPow_eq_of_fiberDiff_zero j f.1 hdiff
          (Function.surjInv_eq hsurj (projModPow (j + 1) j (Nat.le_succ j) v)).symm
      have hg_mem : g ∈ eigenspaceC j lam := by
        rw [mem_eigenspaceC]
        intro r
        obtain ⟨v, rfl⟩ := hsurj r
        have hint : P_levelC (j + 1) f.1 v =
            P_levelC j g (projModPow (j + 1) j (Nat.le_succ j) v) := by
          simp only [P_levelC, hfg, map_mul, map_add, map_ofNat, map_one,
            projModPow_inv_two (j + 1) j (Nat.le_succ j) hj]
        rw [← hint, (mem_eigenspaceC (j + 1) lam f.1).mp f.2 v, hfg v]
      exact ⟨⟨g, hg_mem⟩, Subtype.ext (funext (fun v => (hfg v).symm))⟩
    have hfin_ker : Module.finrank ℂ (LinearMap.ker D) ≤ j :=
      le_trans (Submodule.finrank_mono hker_le) (le_trans (LinearMap.finrank_range_le L) ih)
    let s := ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))
    have h3s : (3 : ZMod (3 ^ (j + 1))) * s = 0 := by
      have hcast : (3 : ZMod (3 ^ (j + 1))) * s =
          ((3 ^ (j + 1) : ℕ) : ZMod (3 ^ (j + 1))) := by dsimp [s]; push_cast; ring
      rw [hcast]; exact ZMod.natCast_self _
    have h2s_ne_0 : 2 * s ≠ 0 := by
      dsimp [s]
      have : ((2 : ZMod (3 ^ (j + 1))) * ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1)))) =
          ((2 * 3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by push_cast; ring
      rw [this, zmodNatCast_eq_zero_iff]
      intro hdvd
      have hdvd' : 3 ^ (j + 1) ∣ 3 ^ j :=
        (Nat.Coprime.pow_left (j + 1) (by decide : Nat.Coprime 3 2)).dvd_of_dvd_mul_left hdvd
      have := Nat.le_of_dvd (by positivity) hdvd'
      have := Nat.pow_lt_pow_right (by decide : 1 < 3) (Nat.lt_succ_self j)
      omega
    have hs_ne_0 : s ≠ 0 := by
      dsimp [s]; rw [zmodNatCast_eq_zero_iff]
      intro hdvd
      have := Nat.le_of_dvd (by positivity) hdvd
      have := Nat.pow_lt_pow_right (by decide : 1 < 3) (Nat.lt_succ_self j)
      omega
    have h2s_ne_s : 2 * s ≠ s := by
      intro h; apply hs_ne_0; linear_combination h
    have hrange_le : LinearMap.range D ≤ Submodule.span ℂ
        (if lam = 1 / 2 then {fiberDiff j (oneZero (j + 1))}
         else {fiberDiff j (shellAlternating (j + 1) j hj (le_refl (j + 1)))}) := by
      rintro _ ⟨f, rfl⟩
      have hfeig := (mem_eigenspaceC (j + 1) lam f.1).mp f.2
      have hdyn0 := fiberDiff_dynamics_second_relation j f.1 lam hfeig 0
      rw [mul_zero, fiberDiff2_eq, zero_add] at hdyn0
      have hsum0 := fiberDiff_sum j f.1 0
      rw [zero_add, zero_add] at hsum0
      have hvanish : ∀ v : ZMod (3 ^ (j + 1)),
          v ≠ 0 → v ≠ s → v ≠ 2 * s → fiberDiff j f.1 v = 0 := by
        intro v hv0 hvs hv2s
        apply fiberDiff_eq_zero_of_proj_ne_zero j hj lam hlam f.1 f.2 v
        intro hp0
        rw [projModPow_eq_val, zmodNatCast_eq_zero_iff] at hp0
        obtain ⟨q, hq⟩ := hp0
        have hq_lt : q < 3 := by
          have hv_lt : v.val < 3 ^ (j + 1) := ZMod.val_lt v
          have h3j : 3 ^ (j + 1) = 3 ^ j * 3 := by rw [pow_succ]
          rw [hq, h3j] at hv_lt
          exact Nat.lt_of_mul_lt_mul_left hv_lt
        have hv_cast : ((v.val : ℕ) : ZMod (3 ^ (j + 1))) = v := ZMod.natCast_zmod_val v
        interval_cases q
        · apply hv0; rw [← hv_cast, hq]; simp
        · apply hvs; rw [← hv_cast, hq]; dsimp [s]; push_cast; ring
        · apply hv2s; rw [← hv_cast, hq]; dsimp [s]; push_cast; ring
      rcases hlam with rfl | rfl
      · rw [if_pos rfl]
        have hδs : fiberDiff j f.1 s = 0 := by linear_combination hdyn0
        have hδ2s : fiberDiff j f.1 (2 * s) = -fiberDiff j f.1 0 := by
          linear_combination hsum0 - hδs
        have h_eq : D f = (-fiberDiff j f.1 0) • fiberDiff j (oneZero (j + 1)) := by
          funext v
          by_cases hv0 : v = 0
          · subst hv0
            show fiberDiff j f.1 0 =
              -fiberDiff j f.1 0 * (oneZero (j + 1) (0 + s) - oneZero (j + 1) 0)
            rw [zero_add, show oneZero (j + 1) s = 0 from if_neg hs_ne_0,
              show oneZero (j + 1) 0 = 1 from if_pos rfl]
            ring
          · by_cases hvs : v = s
            · subst hvs
              have he2 : s + s = 2 * s := by ring
              show fiberDiff j f.1 s =
                -fiberDiff j f.1 0 * (oneZero (j + 1) (s + s) - oneZero (j + 1) s)
              rw [hδs, he2, show oneZero (j + 1) (2 * s) = 0 from if_neg h2s_ne_0,
                show oneZero (j + 1) s = 0 from if_neg hs_ne_0]
              ring
            · by_cases hv2s : v = 2 * s
              · subst hv2s
                have he3 : 2 * s + s = 0 := by
                  have : 2 * s + s = 3 * s := by ring
                  rw [this, h3s]
                show fiberDiff j f.1 (2 * s) =
                  -fiberDiff j f.1 0 * (oneZero (j + 1) (2 * s + s) - oneZero (j + 1) (2 * s))
                rw [hδ2s, he3, show oneZero (j + 1) 0 = 1 from if_pos rfl,
                  show oneZero (j + 1) (2 * s) = 0 from if_neg h2s_ne_0]
                ring
              · have hv_zero := hvanish v hv0 hvs hv2s
                have hvs_ne0 : v + s ≠ 0 := by
                  intro h; apply hv2s
                  have : v + s + 2 * s = 2 * s := by rw [h, zero_add]
                  have h3' : v + s + 2 * s = v := by
                    have : v + s + 2 * s = v + 3 * s := by ring
                    rw [this, h3s, add_zero]
                  rw [← h3', this]
                show fiberDiff j f.1 v =
                  -fiberDiff j f.1 0 * (oneZero (j + 1) (v + s) - oneZero (j + 1) v)
                rw [hv_zero, show oneZero (j + 1) (v + s) = 0 from if_neg hvs_ne0,
                  show oneZero (j + 1) v = 0 from if_neg hv0]
                ring
        rw [h_eq]
        exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
      · rw [if_neg (by norm_num : (-1 / 2 : ℂ) ≠ 1 / 2)]
        have hδs : fiberDiff j f.1 s = -2 * fiberDiff j f.1 0 := by linear_combination hdyn0
        have hδ2s : fiberDiff j f.1 (2 * s) = fiberDiff j f.1 0 := by
          linear_combination hsum0 - hδs
        let ψ := shellAlternating (j + 1) j hj (le_refl (j + 1))
        have hψ0 : ψ 0 = 0 := by
          dsimp [ψ, shellAlternating]
          have h1 : (0 : ZMod (3 ^ (j + 1))) ≠ s := hs_ne_0.symm
          have h2 : (0 : ZMod (3 ^ (j + 1))) ≠ 2 * s := h2s_ne_0.symm
          -- Ascribe the same facts at the unfolded casts: the `if` conditions in
          -- `shellAlternating` mention `((3 ^ j : ℕ) : ZMod _)` / `((2 * 3 ^ j : ℕ) : ZMod _)`,
          -- not the `let`-bound `s`, so `if_neg h1` would have to unfold the `let`.
          have h1' : (0 : ZMod (3 ^ (j + 1))) ≠ ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := h1
          have h2' : (0 : ZMod (3 ^ (j + 1))) ≠ ((2 * 3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := by
            rw [show ((2 * 3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = 2 * s by dsimp [s]; push_cast; ring]
            exact h2
          have hp0 : projModPow (j + 1) (j + 1) (le_refl _) 0 = 0 := map_zero _
          rw [hp0, if_neg h1', if_neg h2']
        have hψs : ψ s = -1 := by
          dsimp [ψ, shellAlternating]
          have hps : projModPow (j + 1) (j + 1) (le_refl _) s = s := by
            simp [projModPow]
          rw [hps, if_pos rfl]
        have hψ2s : ψ (2 * s) = 1 := by
          dsimp [ψ, shellAlternating]
          have hp2s : projModPow (j + 1) (j + 1) (le_refl _) (2 * s) = 2 * s := by
            simp [projModPow]
          have h2eq : ((2 * 3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = 2 * s := by
            dsimp [s]; push_cast; ring
          have h2s' : 2 * s ≠ ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := h2s_ne_s
          rw [hp2s, h2eq, if_neg h2s', if_pos rfl]
        have hψ_other : ∀ w : ZMod (3 ^ (j + 1)), w ≠ s → w ≠ 2 * s → ψ w = 0 := by
          intro w hws hw2s
          dsimp [ψ, shellAlternating]
          have hpw : projModPow (j + 1) (j + 1) (le_refl _) w = w := by simp [projModPow]
          have h2eq : ((2 * 3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) = 2 * s := by
            dsimp [s]; push_cast; ring
          have hws' : w ≠ ((3 ^ j : ℕ) : ZMod (3 ^ (j + 1))) := hws
          rw [hpw, h2eq, if_neg hws', if_neg hw2s]
        have h_eq : D f = (-fiberDiff j f.1 0) • fiberDiff j ψ := by
          funext v
          by_cases hv0 : v = 0
          · subst hv0
            show fiberDiff j f.1 0 = -fiberDiff j f.1 0 * (ψ (0 + s) - ψ 0)
            rw [zero_add, hψs, hψ0]
            ring
          · by_cases hvs : v = s
            · subst hvs
              have he2 : s + s = 2 * s := by ring
              show fiberDiff j f.1 s = -fiberDiff j f.1 0 * (ψ (s + s) - ψ s)
              rw [hδs, he2, hψ2s, hψs]
              ring
            · by_cases hv2s : v = 2 * s
              · subst hv2s
                have he3 : 2 * s + s = 0 := by
                  have : 2 * s + s = 3 * s := by ring
                  rw [this, h3s]
                show fiberDiff j f.1 (2 * s) = -fiberDiff j f.1 0 * (ψ (2 * s + s) - ψ (2 * s))
                rw [hδ2s, he3, hψ0, hψ2s]
                ring
              · have hv_zero := hvanish v hv0 hvs hv2s
                have hvs_ne_s : v + s ≠ s := by
                  intro h; apply hv0; linear_combination h
                have hvs_ne_2s : v + s ≠ 2 * s := by
                  intro h; apply hvs; linear_combination h
                show fiberDiff j f.1 v = -fiberDiff j f.1 0 * (ψ (v + s) - ψ v)
                rw [hv_zero, hψ_other (v + s) hvs_ne_s hvs_ne_2s, hψ_other v hvs hv2s]
                ring
        rw [h_eq]
        exact Submodule.smul_mem _ _ (Submodule.subset_span (Set.mem_singleton _))
    have hfin_range : Module.finrank ℂ (LinearMap.range D) ≤ 1 := by
      have hfin := Submodule.finrank_mono hrange_le
      refine le_trans hfin ?_
      classical
      by_cases h : lam = 1 / 2
      · rw [if_pos h]
        exact (finrank_span_le_card _).trans (by simp)
      · rw [if_neg h]
        exact (finrank_span_le_card _).trans (by simp)
    have hrk := LinearMap.finrank_range_add_finrank_ker D
    omega
 
/-- **Exact dimension (Notes_5, correcting the false `= 2`):**
`dim E_{+1/2}(P_j) = j` and `dim E_{-1/2}(P_j) = j` for all `j ≥ 1`.
At `j = 1` this is `1`, not `0` (Notes_5's `j = 1` claim is corrected below:
`1_{0}` IS a `+1/2`-eigenfunction in `ZMod 3`). At `j = 2` this recovers the
old `= 2`; at `j = 3` it gives `3`, with the third `+1/2` direction `1_{0}`
and the third `-1/2` direction the shell alternating function on shell `1`.
Proved from the upper bound `dim_eigenspace_half_le_j` and the lower bound
`dim_eigenspace_half_ge_j`, both proved above; the equality is unconditional. -/
theorem dim_eigenspace_half_eq_j (j : ℕ) (hj : 1 ≤ j) (lam : ℂ)
    (hlam : lam = 1 / 2 ∨ lam = -1 / 2) :
    Module.finrank ℂ (eigenspaceC j lam) = j :=
  le_antisymm (dim_eigenspace_half_le_j j hj lam hlam)
    (dim_eigenspace_half_ge_j j hj lam hlam)
 
theorem plus_half_multiplicity_split (j : ℕ) (hj : 1 ≤ j) :
    Module.finrank ℂ (eigenspaceC j (1 / 2 : ℂ)) = 0 + j := by
  -- `+1/2`: `0` on the units (via `(2X - 1)` dividing out) + `j` on the transient
  -- kernel (`1_{0}` + the `j - 1` shell indicators). The old `0 + 2` was false for `j ≥ 3`.
  rw [zero_add]
  exact dim_eigenspace_half_eq_j j hj (1 / 2 : ℂ) (Or.inl rfl)
 
theorem minus_half_multiplicity_split (j : ℕ) (hj : 1 ≤ j) :
    Module.finrank ℂ (eigenspaceC j (-1 / 2 : ℂ)) = 1 + (j - 1) := by
  -- `-1/2`: `1` on the units (from `g_witness`) + `j - 1` on the transient kernel
  -- (the `j - 1` shell alternating functions). The old `1 + 1` was false for `j ≥ 3`.
  rw [dim_eigenspace_half_eq_j j hj (-1 / 2 : ℂ) (Or.inr rfl)]
  omega
 
/-- Base case `j = 1` (`ZMod 3`) for `unit_spectrum_growth`. (Notes_6's
`linear_combination` coefficients are corrected here: expanding them shows the
as-written coefficients leave an uncanceled `f 1` / `f 2` term. The correct
coefficients are derived by solving the `3 × 3` system:
`v = 0`: `(-2*(lam-1)*(2*lam+1))*h0 - h1 - (2*lam)*h2`;
`v = 1`: `(-(2*lam-1)^2)*h1 + (-2*(2*lam-1))*h2`;
`v = 2`: `(-(2*lam-1))*h1 + (-2*lam*(2*lam-1))*h2`.) -/
lemma unit_spectrum_growth_base (lam : ℂ) (f : ZMod 3 → ℂ)
    (hf : f ∈ eigenspaceC 1 lam) (hnz : ∃ v : ZMod 3, f v ≠ 0) :
    lam = 1 ∨ (2 * lam) ^ (2 * 3 ^ (1 - 1)) = 1 := by
  rw [mem_eigenspaceC] at hf
  have h0 := hf 0; have h1 := hf 1; have h2 := hf 2
  have h2inv : (2 : ZMod 3)⁻¹ = 2 := ZMod.inv_eq_of_mul_eq_one _ 2 2 (by decide)
  simp only [P_levelC, pow_one, h2inv] at h0 h1 h2
  have b0 : (2 : ZMod 3) * 0 = 0 ∧ (2 : ZMod 3) * (3 * 0 + 1) = 2 := by decide
  have b1 : (2 : ZMod 3) * 1 = 2 ∧ (2 : ZMod 3) * (3 * 1 + 1) = 2 := by decide
  have b2 : (2 : ZMod 3) * 2 = 1 ∧ (2 : ZMod 3) * (3 * 2 + 1) = 2 := by decide
  rw [b0.1, b0.2] at h0
  rw [b1.1, b1.2] at h1
  rw [b2.1, b2.2] at h2
  have hpoly_f : ∀ v : ZMod 3, ((lam - 1) * ((2 * lam) ^ 2 - 1)) * f v = 0 := by
    intro v
    rcases (show ∀ w : ZMod 3, w = 0 ∨ w = 1 ∨ w = 2 by decide) v with rfl | rfl | rfl
    · linear_combination (-2 * (lam - 1) * (2 * lam + 1)) * h0 - h1 - (2 * lam) * h2
    · linear_combination (-(2 * lam - 1) ^ 2) * h1 + (-2 * (2 * lam - 1)) * h2
    · linear_combination (-(2 * lam - 1)) * h1 + (-2 * lam * (2 * lam - 1)) * h2
  obtain ⟨v₀, hv₀⟩ := hnz
  have hroot : (lam - 1) * ((2 * lam) ^ 2 - 1) = 0 :=
    (mul_eq_zero.mp (hpoly_f v₀)).resolve_right hv₀
  rcases mul_eq_zero.mp hroot with h1' | h2'
  · left; exact sub_eq_zero.mp h1'
  · right
    simpa using sub_eq_zero.mp h2'
 
/--
**Growth of the unit spectrum (complete induction on `j ≥ 1`, Notes_6).**
Every complex eigenvalue `lam` of `P_j` satisfies `lam = 1` or `(2 * lam) ^ (2 * 3 ^ (j - 1)) = 1`,
proving `|λ₂(P_j)| = 1 / 2` across the entire infinite tower `j ≥ 1`.
Induction step: if some `fiberDiff j f v₀ ≠ 0`, Euler's theorem on fibers
(`fiberDiff_pow_totient`) forces the root condition; otherwise `f` is a lift
from level `j` (`eq_of_projModPow_eq_of_fiberDiff_zero`) and the induction
hypothesis applies. (The `hg_eig` / `hint` block, garbled by formatting in
Notes_6, is reconstructed cleanly here.)
-/
theorem unit_spectrum_growth (j : ℕ) (hj : 1 ≤ j) (lam : ℂ)
    (f : ZMod (3 ^ j) → ℂ) (hf : f ∈ eigenspaceC j lam) (hnz : ∃ v, f v ≠ 0) :
    lam = 1 ∨ (2 * lam) ^ (2 * 3 ^ (j - 1)) = 1 := by
  induction j, hj using Nat.le_induction with
  | base =>
    exact unit_spectrum_growth_base lam f hf hnz
  | succ j hj ih =>
    rw [mem_eigenspaceC] at hf
    by_cases hdiff_nz : ∃ v₀ : ZMod (3 ^ (j + 1)), fiberDiff j f v₀ ≠ 0
    · right
      obtain ⟨v₀, hv₀⟩ := hdiff_nz
      have heul := fiberDiff_pow_totient j f lam hf v₀
      have hfac : ((2 * lam) ^ (2 * 3 ^ j) - 1) * fiberDiff j f v₀ = 0 := by
        linear_combination heul
      have hroot := (mul_eq_zero.mp hfac).resolve_right hv₀
      simpa using sub_eq_zero.mp hroot
    · push_neg at hdiff_nz
      have hsurj : Function.Surjective (projModPow (j + 1) j (Nat.le_succ j)) :=
        ZMod.castHom_surjective (pow_dvd_pow 3 (Nat.le_succ j))
      let g : ZMod (3 ^ j) → ℂ := fun r => f (Function.surjInv hsurj r)
      have hfg : ∀ v : ZMod (3 ^ (j + 1)),
          f v = g (projModPow (j + 1) j (Nat.le_succ j) v) := by
        intro v
        exact eq_of_projModPow_eq_of_fiberDiff_zero j f hdiff_nz
          (Function.surjInv_eq hsurj (projModPow (j + 1) j (Nat.le_succ j) v)).symm
      have hg_eig : g ∈ eigenspaceC j lam := by
        rw [mem_eigenspaceC]
        intro r
        obtain ⟨v, rfl⟩ := hsurj r
        have hint : P_levelC (j + 1) f v =
            P_levelC j g (projModPow (j + 1) j (Nat.le_succ j) v) := by
          simp only [P_levelC, hfg, map_mul, map_add, map_ofNat, map_one,
            projModPow_inv_two (j + 1) j (Nat.le_succ j) hj]
        rw [← hint, hf v, hfg v]
      have hg_nz : ∃ r : ZMod (3 ^ j), g r ≠ 0 := by
        obtain ⟨v₀, hv₀⟩ := hnz
        refine ⟨projModPow (j + 1) j (Nat.le_succ j) v₀, ?_⟩
        rw [← hfg v₀]
        exact hv₀
      rcases ih g hg_eig hg_nz with h1 | hprev
      · left; exact h1
      · right
        have hpow_exp : 2 * 3 ^ (j + 1 - 1) = (2 * 3 ^ (j - 1)) * 3 := by
          have : j + 1 - 1 = j := Nat.add_sub_cancel j 1
          rw [this]
          conv_lhs => rw [← Nat.sub_add_cancel hj, pow_succ]
          ring
        rw [hpow_exp, pow_mul, hprev, one_pow]
 
/--
**Corrections to Notes_5's own argument (the conclusion `dim = j` is right;
three details need fixing):**
 
1. **The shift is by `c·3^j`, not always by `3^j`.** Notes_5 claims
   `(2⁻¹)^{2·3^{j-1}} u = u + 3^j` on units. The LTE computation gives
   `4^{3^{j-1}} ≡ 1 + 3^j (mod 3^{j+1})`, hence
   `(2⁻¹)^{2·3^{j-1}} = 4^{-3^{j-1}} ≡ 1 - 3^j (mod 3^{j+1})`, so
   `(2⁻¹)^{2·3^{j-1}} u = u - u·3^j = u + c·3^j` with `c = -(u mod 3) mod 3 ∈ {1, 2}`.
   The conclusion `δ ≡ 0` on units still follows (using that the shift preserves
   `u mod 3`, so the same argument applies at `u + 3^j`, plus the fiber sum),
   but it needs this `c` bookkeeping — the bare claim `δ(u + 3^j) = δ(u)` does
   not follow directly.
 
2. **Projection to the same `mod 9` value does NOT imply constancy on the fiber.**
   Notes_5 (P20) suggests that because `0, 3^j, 2·3^j` all project to `0 mod 9`,
   they cannot carry a new direction. That is backwards: `1_{0}` on `ZMod 27`
   is `1` at `0` and `0` at `9, 18`, so it is NOT constant on the fiber
   `{0, 9, 18}` and does NOT factor through `mod 9` — which is exactly why it
   is a new direction. The fiber being a single `mod 9` class is the *reason*
   the lift claim fails, not a reason it holds.
 
3. **`j = 1`: `dim E_{+1/2}(P_1) = 1`, not `0`.** Notes_5 (P51) claims `0` with
   the parenthetical "`14(3·0+1) = 2 ≠ 0` in `ZMod 3`". But that computation
   is the second branch at `v = 0`, which is `2⁻¹·1 = 2 ≠ 0`, so it contributes
   `1_{0}(2) = 0` — it does NOT break the eigenfunction:
   `P_1(1_{0})(0) = (1/2)·1 + (1/2)·0 = 1/2`. So `1_{0}` IS a `+1/2`-eigenfunction
   in `ZMod 3`, and `dim E_{±1/2}(P_1) = 1 = j`. The formula `dim = j` holds for
   all `j ≥ 1`, with no exception at `j = 1`.
 
4. **`(2X - 1)^3 (2X + 1)^3` in `χ_{P_3}`** is a *consequence* of the shell
   decomposition (`+1/2` mult `3`, `-1/2` mult `3`), not something "found
   earlier" — Sections 4–5 proved the annihilating polynomial, not the
   characteristic polynomial. The remaining `χ_{P_3}` exponents come from the
   units (`(1/2)·ζ`, `ζ^{18} = 1`) plus the shells (`(1/2)·ζ`, `ζ^{6} = 1`
   on shell `1`, `ζ^2 = 1` on shell `2`), with multiplicities from the
   block-triangular shell decomposition.
-/
theorem notes5_corrections_recorded : True := trivial
 
/-! ### Section 7: Non-Archimedean Wilson Tower, Block-Spin RG Fixed Point & Spectral Stability (`PadicWilsonBridge`)
 
This section unifies the 3-adic Collatz transfer operator tower `{P_collatz j}_{j ≥ 1}` with
discrete non-Archimedean Wilson lattice gauge observables (`PadicWilsonFamily 3 G`) and
block-spin renormalization group (RG) decimation (`rgMap`), all in `PadicWilsonBridge.lean`:
 
1. **Projective Tower & Locally Constant Observables (Sections 1–3 of `PadicWilsonBridge`):**
   Inflation `liftStep 3 j` embeds coarse observables `ZMod (3 ^ j) → ℂ` into fine observables
   `ZMod (3 ^ (j + 1)) → ℂ` as exact Bruhat–Schwartz test functions (`IsLocallyConstantAtLevel 3 j`),
   preserving normalized Haar expectations (`haarExpectation_liftStep`) and intertwining with
   the transfer operator (`P_collatz_intertwines_liftStep`).
 
2. **Continuum UV/IR Limit Bridge (Sections 4–5 of `PadicWilsonBridge`):**
   For any 3-adic `PadicWilsonFamily 3 G` whose 1-point gauge moment stabilizes at precision `3 ^ N₀`,
   `P_collatz`-evolved observables stabilize in the ultraviolet mesh limit (`padicWilson_collatz_uv_stabilized`),
   and eigenmodes of eigenvalue `λ` scale the continuum limit by `λ` (`padicWilson_collatz_eigenmode_limit`).
 
3. **Block-Spin RG Fixed Point & No Relevant Directions (Sections 6–7 of `PadicWilsonBridge`):**
   Under block-spin decimation `rgMap j T := downAvg 3 j ∘ T ∘ liftStep 3 j`, the Collatz family
   is an exact fixed point (`rgMap_fixed_point : rgMap j (P_collatz (j + 1)) = P_collatz j`).
   By induction on `j ≥ 1` (`spectrum_classification_proved`), every eigenvalue `λ ≠ 1` of
   `P_collatz j` has the form `(1 / 2) * ζ` with `ζ ^ (2 * 3 ^ (j - 1)) = 1`, hence `‖λ‖ = 1 / 2 < 1`
   (`no_relevant_directions`). Thus the Collatz RG fixed point has **no relevant directions**
   at any finite 3-adic precision. (Interpretation, not a theorem of either file: a
   decimation-compatible deformation `P_{j+1}(β)` would have to break intertwining to produce a
   gap of dimensional-transmutation type `1 - |λ₁| ~ 3⁻ʲ Λ_YM`.)
 
`P_collatz_eq_P_levelC` below identifies `PadicWilsonBridge.P_collatz j` with this file's
`P_levelC j` definitionally, so every `PadicWilsonBridge` theorem about `P_collatz` applies to
`P_levelC` by rewriting with it.
-/
 
/-- `PadicWilsonBridge.P_collatz j` and `P_levelC j` are the same operator (identical definitions). -/
lemma P_collatz_eq_P_levelC (j : ℕ) : PadicWilsonBridge.P_collatz j = P_levelC j := rfl
 
/-- Block-spin RG fixed point stated directly for `CollatzTransfer.P_levelC`:
`rgMap j (P_levelC (j + 1)) = P_levelC j` for all `j ≥ 1`. -/
theorem rgMap_P_levelC_fixed_point (j : ℕ) (hj : 1 ≤ j) :
    PadicWilsonBridge.rgMap j (P_levelC (j + 1)) = P_levelC j := by
  rw [← P_collatz_eq_P_levelC (j + 1), ← P_collatz_eq_P_levelC j]
  exact PadicWilsonBridge.rgMap_fixed_point j hj
 
/--
**Master Unification Theorem for `CollatzTransfer.P_levelC`:**
At every level `j ≥ 1`:
1. **RG Fixed Point:** Block-spin decimation sends `P_levelC (j + 1)` to `P_levelC j`.
2. **No Relevant Directions:** Every non-stationary eigenvalue `λ ≠ 1` of `P_levelC j`
   satisfies `‖λ‖ = 1 / 2` and is RG-irrelevant (`PadicWilsonBridge.IsIrrelevantEigenvalue λ`).
3. **Wilson Continuum Limit:** For any 3-adic `PadicWilsonFamily 3 G` stabilized at scale `j`,
   the UV continuum limit (`N → ∞`) of a `P_levelC`-evolved eigenmode `g` with eigenvalue `λ`
   exists and equals `λ` times the coarse Wilson expectation of `g`.
-/
theorem P_levelC_padic_wilson_rg_unification
    {j : ℕ} (hj : 1 ≤ j) :
    -- (1) Exact block-spin RG fixed point across levels
    (PadicWilsonBridge.rgMap j (P_levelC (j + 1)) = P_levelC j) ∧
    -- (2) Every non-stationary eigenmode at level `j` has `‖λ‖ = 1/2` and is RG-irrelevant
    (∀ (lam : ℂ) (f : ZMod (3 ^ j) → ℂ),
      P_levelC j f = lam • f → f ≠ 0 → lam ≠ 1 →
      ‖lam‖ = 1 / 2 ∧ PadicWilsonBridge.IsIrrelevantEigenvalue lam) ∧
    -- (3) Continuum UV limit of 1-point Wilson expectations scales by `λ`
    (∀ {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]
      (C : PadicWilsonBridge.PadicWilsonFamily 3 G)
      (hir0 : C.irLevel 0 = 0)
      (huv : ∀ N, C.uvLevel N = N)
      (v : Fin 1 → C.Token)
      (M₀ : ZMod (3 ^ j) → ℂ)
      (hM : ∀ (N : ℕ) (hN : j ≤ N) (x : PadicWilsonBridge.PadicPoints 1 3 (C.totalLevel N 0)),
        C.finiteMoment N 0 v x =
        PadicWilsonBridge.embed1Pt (C.totalLevel N 0)
          (PadicWilsonBridge.liftPow 3 (C.totalLevel N 0) j
            (by simp [PadicWilsonBridge.PadicWilsonFamily.totalLevel, hir0, huv, hN]) M₀) x)
      (g : ZMod (3 ^ j) → ℂ) (lam : ℂ)
      (heig : ∀ u : ZMod (3 ^ j), P_levelC j g u = lam * g u),
      let t : ∀ N, PadicWilsonBridge.PadicPoints 1 3 (C.totalLevel N 0) → ℂ := fun N =>
        if hN : j ≤ N then
          PadicWilsonBridge.embed1Pt (C.totalLevel N 0)
            (P_levelC (C.totalLevel N 0)
              (PadicWilsonBridge.liftPow 3 (C.totalLevel N 0) j
                (by simp [PadicWilsonBridge.PadicWilsonFamily.totalLevel, hir0, huv, hN]) g))
       else 0
      Filter.Tendsto (fun N => C.smear N 0 v (t N)) Filter.atTop
        (nhds (lam * C.smear j 0 v (PadicWilsonBridge.embed1Pt (C.totalLevel j 0)
          (PadicWilsonBridge.liftPow 3 (C.totalLevel j 0) j
            (by simp [PadicWilsonBridge.PadicWilsonFamily.totalLevel, hir0, huv]) g))))) := by
  simpa only [P_collatz_eq_P_levelC] using
    (PadicWilsonBridge.collatz_padic_wilson_rg_unification hj)
-/
