Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp230032ywo;
        Fri, 12 Apr 2019 00:30:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJUGh24XURW8f/UnvM7OoQLJGlIDtcHvphcunMC1ad90RE2xqK5oQztHCBDs8su7h5nRNP
X-Received: by 2002:a17:902:8a8a:: with SMTP id p10mr55585785plo.8.1555054252380;
        Fri, 12 Apr 2019 00:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555054252; cv=none;
        d=google.com; s=arc-20160816;
        b=QmQb6igiCQgcuyhS2KBmCO4jPPCPYtmY8q/Wfg4ZVkSwBVnV/kBB1QJeFEmsX9Z3+T
         EoYApGOlmI6Pe7nfVRlXzGOxd0rayURLzcM5QDwyXxLCE/AlHOKuzCabPuKWEnDl1rFz
         tWuSUMPoTa5zW2QarlLnSrM2XSQoVx1qdYL1QWOp7+a+KiOVOQiE92gFgbamdmPMIrT/
         kQ1owTmuXDJ3kHNwJAORvO/n2P8bZ7ZJycVEIWA1udKjje53pKjnfdjVvqn+wR7AmqX1
         r9/sknRZGHc/MxvCufHk4D0tzBW/IPcBxGlJ273vf6fkdbw8XIrG1ZsNaI+2/e30HMho
         y84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=QN0vWUNXVzBUOuZ1ibrqoPmaGynGO2HSlfwMAtMhDNE=;
        b=ytkyj87dJQO2aTLVsdLnjMo2Ry5S/SvsB0f+1+ACjj849k8OLEstiex0YflW5iVW3j
         n3WydcDi2Gk2a/lrVEh6cMWgYotVjIkMuIL/gCcnnVN9QFZ+gFCsm1pox7CstOhCB3NA
         uNXKaPWPQUva5mkog3h1ROhEebxh1z480HNmmjrRNDacNVDQjy3s9C0CMe5Q+wQop3cI
         x84laNn5jNdXgCu70ShQ9skZMYVMJWN1JJg/QJzjsdPmo0dbQpQgp5pMAv6GZpXYPP6M
         5ZkLd0760oUkh3UPzofkHrRXbKx0CLBW30GipoXVYc6qEvcVNZH0trdJw8es2O6osIKB
         3HxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 207si20912539pgc.266.2019.04.12.00.30.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2019 00:30:52 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FE089A1A;
	Fri, 12 Apr 2019 07:30:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE8E89A1A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 07:30:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Apr 2019 00:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,340,1549958400"; 
 d="asc'?scan'208";a="133649460"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga008.jf.intel.com with ESMTP; 12 Apr 2019 00:30:47 -0700
Date: Fri, 12 Apr 2019 15:19:24 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PATCH V2 1/6] drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t
Message-ID: <20190412071924.GK17995@zhen-hp.sh.intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-2-aleksei.gimbitskii@intel.com>
 <91e9a249-f15d-b5cd-a718-51097de4637f@intel.com>
 <F3B0350DF4CB6849A642218320DE483D7D9F95F5@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <F3B0350DF4CB6849A642218320DE483D7D9F95F5@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: "Gimbitskii, Aleksei" <aleksei.gimbitskii@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Xu, Colin" <colin.xu@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============1371101925=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1371101925==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LMmSgwdUwKH/sMG1"
Content-Disposition: inline


--LMmSgwdUwKH/sMG1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.12 06:20:26 +0000, Wang, Zhi A wrote:
> Also, the other reason to remove the typedef is:
> https://yarchive.net/comp/linux/typedefs.html
>=20
> i915 has already removed almost all of them because of this.
>=20

Remove typedef is ok, I think everyone agree but would be better still keep=
 enum type.

>=20
> -----Original Message-----
> From: Wang, Zhi A=20
> Sent: Friday, April 12, 2019 8:44 AM
> To: Xu, Colin <colin.xu@intel.com>; Gimbitskii, Aleksei <aleksei.gimbitsk=
ii@intel.com>; Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Subject: RE: [PATCH V2 1/6] drm/i915/gvt: Remove typedef intel_gvt_gtt_ty=
pe_t
>=20
> I think klocwork is going a bit too far actually. It always takes the ful=
l range would be used if we go enumeration type. For option 2, I guess we h=
ave to add a lot of useless check of GTT_TYPE_INVALID in every place we are=
 going to use the enumeration as array index, which looks very ugly.
>=20
> I'd like to go practical. We need the enumeration for sure and we check t=
he GTT_TYPE_INVALID in the place we think necessary and let clockwork be ha=
ppy and also not make the code ugly.
>=20
> -----Original Message-----
> From: Xu, Colin
> Sent: Friday, April 12, 2019 4:29 AM
> To: Gimbitskii, Aleksei <aleksei.gimbitskii@intel.com>; Wang, Zhi A <zhi.=
a.wang@intel.com>; Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Subject: Re: [PATCH V2 1/6] drm/i915/gvt: Remove typedef intel_gvt_gtt_ty=
pe_t
>=20
> Seems like V2 of this patch doesn't get updated?
>=20
> Hi Zhi, Zhenyu, from architecture point of view, what kind of change is b=
etter?
> - Change parameter type from enum type to int looks "cheat" klocwork stat=
ic analysis, but lose natural protection since any int could be passed into=
 the function.
> - If we keep using enum type as the function parameter, we may need extra=
ct check so that klocwork static analysis will consider as safe.
> Any comments? I prefer the latter.
>=20
> On 2019-04-11 18:46, Aleksei Gimbitskii wrote:
> > The klocwork static code analyzer takes the enumeration as the full=20
> > range of intel_gvt_gtt_type_t. But the full range of=20
> > intel_gvt_gtt_type_t will never be used in full range. For example,=20
> > the GTT_TYPE_INVALID will never be used as an index of an array. So we=
=20
> > will not use it as a type but only the enumeration.
> >
> > This patch fixed the critial issues #483, #551, #665 reported by=20
> > klockwork.
> >
> > Signed-off-by: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gvt/gtt.c | 12 ++++++------
> >   drivers/gpu/drm/i915/gvt/gtt.h | 14 +++++++-------
> >   2 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c=20
> > b/drivers/gpu/drm/i915/gvt/gtt.c index 88ed2e9df253..8dcb6223b985
> > 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > @@ -805,7 +805,7 @@ static int reclaim_one_ppgtt_mm(struct intel_gvt=20
> > *gvt);
> >  =20
> >   /* Allocate shadow page table without guest page. */
> >   static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
> > -		struct intel_vgpu *vgpu, intel_gvt_gtt_type_t type)
> > +		struct intel_vgpu *vgpu, int type)
> >   {
> >   	struct device *kdev =3D &vgpu->gvt->dev_priv->drm.pdev->dev;
> >   	struct intel_vgpu_ppgtt_spt *spt =3D NULL; @@ -855,7 +855,7 @@ stati=
c=20
> > struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
> >  =20
> >   /* Allocate shadow page table associated with specific gfn. */
> >   static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt_gfn(
> > -		struct intel_vgpu *vgpu, intel_gvt_gtt_type_t type,
> > +		struct intel_vgpu *vgpu, int type,
> >   		unsigned long gfn, bool guest_pde_ips)
> >   {
> >   	struct intel_vgpu_ppgtt_spt *spt;
> > @@ -930,7 +930,7 @@ static int ppgtt_invalidate_spt_by_shadow_entry(str=
uct intel_vgpu *vgpu,
> >   {
> >   	struct intel_gvt_gtt_pte_ops *ops =3D vgpu->gvt->gtt.pte_ops;
> >   	struct intel_vgpu_ppgtt_spt *s;
> > -	intel_gvt_gtt_type_t cur_pt_type;
> > +	int cur_pt_type;
> >  =20
> >   	GEM_BUG_ON(!gtt_type_is_pt(get_next_pt_type(e->type)));
> >  =20
> > @@ -1849,7 +1849,7 @@ static void vgpu_free_mm(struct intel_vgpu_mm *mm)
> >    * Zero on success, negative error code in pointer if failed.
> >    */
> >   struct intel_vgpu_mm *intel_vgpu_create_ppgtt_mm(struct intel_vgpu *v=
gpu,
> > -		intel_gvt_gtt_type_t root_entry_type, u64 pdps[])
> > +		int root_entry_type, u64 pdps[])
> >   {
> >   	struct intel_gvt *gvt =3D vgpu->gvt;
> >   	struct intel_vgpu_mm *mm;
> > @@ -2303,7 +2303,7 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct int=
el_vgpu *vgpu,
> >   }
> >  =20
> >   static int alloc_scratch_pages(struct intel_vgpu *vgpu,
> > -		intel_gvt_gtt_type_t type)
> > +		int type)
> >   {
> >   	struct intel_vgpu_gtt *gtt =3D &vgpu->gtt;
> >   	struct intel_gvt_gtt_pte_ops *ops =3D vgpu->gvt->gtt.pte_ops; @@
> > -2588,7 +2588,7 @@ struct intel_vgpu_mm *intel_vgpu_find_ppgtt_mm(struc=
t intel_vgpu *vgpu,
> >    * Zero on success, negative error code if failed.
> >    */
> >   struct intel_vgpu_mm *intel_vgpu_get_ppgtt_mm(struct intel_vgpu *vgpu,
> > -		intel_gvt_gtt_type_t root_entry_type, u64 pdps[])
> > +		int root_entry_type, u64 pdps[])
> >   {
> >   	struct intel_vgpu_mm *mm;
> >  =20
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.h=20
> > b/drivers/gpu/drm/i915/gvt/gtt.h index 32c573aea494..645ddc1bd223
> > 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> > @@ -95,7 +95,7 @@ struct intel_gvt_gtt {
> >   	unsigned long scratch_mfn;
> >   };
> >  =20
> > -typedef enum {
> > +enum {
> >   	GTT_TYPE_INVALID =3D -1,
> >  =20
> >   	GTT_TYPE_GGTT_PTE,
> > @@ -124,7 +124,7 @@ typedef enum {
> >   	GTT_TYPE_PPGTT_PML4_PT,
> >  =20
> >   	GTT_TYPE_MAX,
> > -} intel_gvt_gtt_type_t;
> > +};
> >  =20
> >   enum intel_gvt_mm_type {
> >   	INTEL_GVT_MM_GGTT,
> > @@ -148,7 +148,7 @@ struct intel_vgpu_mm {
> >  =20
> >   	union {
> >   		struct {
> > -			intel_gvt_gtt_type_t root_entry_type;
> > +			int root_entry_type;
> >   			/*
> >   			 * The 4 PDPs in ring context. For 48bit addressing,
> >   			 * only PDP0 is valid and point to PML4. For 32it @@ -169,7
> > +169,7 @@ struct intel_vgpu_mm {
> >   };
> >  =20
> >   struct intel_vgpu_mm *intel_vgpu_create_ppgtt_mm(struct intel_vgpu *v=
gpu,
> > -		intel_gvt_gtt_type_t root_entry_type, u64 pdps[]);
> > +		int root_entry_type, u64 pdps[]);
> >  =20
> >   static inline void intel_vgpu_mm_get(struct intel_vgpu_mm *mm)
> >   {
> > @@ -233,7 +233,7 @@ struct intel_vgpu_ppgtt_spt {
> >   	struct intel_vgpu *vgpu;
> >  =20
> >   	struct {
> > -		intel_gvt_gtt_type_t type;
> > +		int type;
> >   		bool pde_ips; /* for 64KB PTEs */
> >   		void *vaddr;
> >   		struct page *page;
> > @@ -241,7 +241,7 @@ struct intel_vgpu_ppgtt_spt {
> >   	} shadow_page;
> >  =20
> >   	struct {
> > -		intel_gvt_gtt_type_t type;
> > +		int type;
> >   		bool pde_ips; /* for 64KB PTEs */
> >   		unsigned long gfn;
> >   		unsigned long write_cnt;
> > @@ -267,7 +267,7 @@ struct intel_vgpu_mm *intel_vgpu_find_ppgtt_mm(stru=
ct intel_vgpu *vgpu,
> >   		u64 pdps[]);
> >  =20
> >   struct intel_vgpu_mm *intel_vgpu_get_ppgtt_mm(struct intel_vgpu *vgpu,
> > -		intel_gvt_gtt_type_t root_entry_type, u64 pdps[]);
> > +		int root_entry_type, u64 pdps[]);
> >  =20
> >   int intel_vgpu_put_ppgtt_mm(struct intel_vgpu *vgpu, u64 pdps[]);
> >  =20
>=20
> --
> Best Regards,
> Colin Xu
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--LMmSgwdUwKH/sMG1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXLA7/AAKCRCxBBozTXgY
J7coAJ44bKF3GBB1hxJmSxafT3XchV5MCACeI6MCnZ+A4xIoseDsUlcWkv8o4oM=
=PQfu
-----END PGP SIGNATURE-----

--LMmSgwdUwKH/sMG1--

--===============1371101925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1371101925==--
