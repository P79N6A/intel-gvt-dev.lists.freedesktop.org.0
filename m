Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp7574781ywo;
        Thu, 11 Apr 2019 19:18:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyu9JqUsDZjUCrqFFKXdts8SphPvg05zxR06GjO97LZ1SIgvyGx1diEL7FtM6/Tr95K3uyz
X-Received: by 2002:a17:902:9884:: with SMTP id s4mr54368576plp.179.1555035511272;
        Thu, 11 Apr 2019 19:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555035511; cv=none;
        d=google.com; s=arc-20160816;
        b=rJQe0HJm+KpGyrbbb8DyFUvmQlzTdvAkGfBxHeGQxmh92+KuZeRXEY/yYKaYj1K919
         hJHt5zZVoZuxtjqwHfCO5nFzJsFx3wucIf5Qw65owOYV7HDxhnoo/q03GfYqhU1qw6k2
         TDX/U36J60QNMed9aNNOzln7jdslVtf4krUfwzfePslMe/407KuDifDIwYFF6+m9bGkg
         QTdykj4MKbFRLnS0h8TjE3oWVWhkrYHTP4hNDY0ag36Ve8GcwazbTAvtwoc1vVOQh2iE
         tZb2yK/XH01TTId/LVr+IIXtmGzNeb56rXjOhOfGaEf7jmL51yMjU1RHfWe4ltZLrsFR
         jY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=JmrVDtqfsFFMNwrc98guVToCXaGRh4vI45U7M9aUa6w=;
        b=A95fXClHpISGBcCpUNcIxL8h2ZiDUj6leHT5dIS0Jp5T5R0CIgu25cfjpYSyuQ43PO
         hMi8v9wvB882LgS+tJ1RdscToluStJ6uTQT+Nj+Re2GySBy08Y3UVqWTzVLzlSszxkHS
         OrzpX2VyeKx1RdrtZ8howd+LcIOU9PXY+PKQnH0vxMDf5vCiVC5jnX2+ge688d0ruing
         k1ShBsT5lM2VsJeIyWBazKAe9S2TwWLEnKpLKJwsjPHzBZCjAQPOIxWs0RSJOYDPPIsh
         rqadj8OQ4a+GOw0S9MThrQJ2cGooDUzq5V5iZgBRFnOwWq4Oj2unaEAquXk85nKAC3PE
         NXyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v6si17562594plp.296.2019.04.11.19.18.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 19:18:31 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B7A896EB;
	Fri, 12 Apr 2019 02:18:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CD2896EB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 12 Apr 2019 02:18:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 19:18:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,339,1549958400"; 
 d="asc'?scan'208";a="150163187"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga002.jf.intel.com with ESMTP; 11 Apr 2019 19:18:25 -0700
Date: Fri, 12 Apr 2019 10:07:04 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <Colin.Xu@intel.com>
Subject: Re: [PATCH V2 1/6] drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t
Message-ID: <20190412020704.GI17995@zhen-hp.sh.intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
 <20190411104631.7627-2-aleksei.gimbitskii@intel.com>
 <91e9a249-f15d-b5cd-a718-51097de4637f@intel.com>
MIME-Version: 1.0
In-Reply-To: <91e9a249-f15d-b5cd-a718-51097de4637f@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1802587080=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1802587080==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mPYgjWmOFizS0g23"
Content-Disposition: inline


--mPYgjWmOFizS0g23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.12 09:29:24 +0800, Colin Xu wrote:
> Seems like V2 of this patch doesn't get updated?
>=20
> Hi Zhi, Zhenyu, from architecture point of view, what kind of change is b=
etter?
> - Change parameter type from enum type to int looks "cheat" klocwork stat=
ic analysis,
> but lose natural protection since any int could be passed into the functi=
on.
> - If we keep using enum type as the function parameter, we may need extra=
ct check
> so that klocwork static analysis will consider as safe.
> Any comments? I prefer the latter.
>

yeah, keeping enum type should be saner, what's the warning from klocwork?
Could we check type to be correct enum value to fix that?

> On 2019-04-11 18:46, Aleksei Gimbitskii wrote:
> > The klocwork static code analyzer takes the enumeration as the full ran=
ge
> > of intel_gvt_gtt_type_t. But the full range of intel_gvt_gtt_type_t will
> > never be used in full range. For example, the GTT_TYPE_INVALID will nev=
er
> > be used as an index of an array. So we will not use it as a type but on=
ly
> > the enumeration.
> >=20
> > This patch fixed the critial issues #483, #551, #665 reported by
> > klockwork.
> >=20
> > Signed-off-by: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
> > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gvt/gtt.c | 12 ++++++------
> >   drivers/gpu/drm/i915/gvt/gtt.h | 14 +++++++-------
> >   2 files changed, 13 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/=
gtt.c
> > index 88ed2e9df253..8dcb6223b985 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > @@ -805,7 +805,7 @@ static int reclaim_one_ppgtt_mm(struct intel_gvt *g=
vt);
> >   /* Allocate shadow page table without guest page. */
> >   static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
> > -		struct intel_vgpu *vgpu, intel_gvt_gtt_type_t type)
> > +		struct intel_vgpu *vgpu, int type)
> >   {
> >   	struct device *kdev =3D &vgpu->gvt->dev_priv->drm.pdev->dev;
> >   	struct intel_vgpu_ppgtt_spt *spt =3D NULL;
> > @@ -855,7 +855,7 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_alloc_spt(
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
> >   	GEM_BUG_ON(!gtt_type_is_pt(get_next_pt_type(e->type)));
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
> >   static int alloc_scratch_pages(struct intel_vgpu *vgpu,
> > -		intel_gvt_gtt_type_t type)
> > +		int type)
> >   {
> >   	struct intel_vgpu_gtt *gtt =3D &vgpu->gtt;
> >   	struct intel_gvt_gtt_pte_ops *ops =3D vgpu->gvt->gtt.pte_ops;
> > @@ -2588,7 +2588,7 @@ struct intel_vgpu_mm *intel_vgpu_find_ppgtt_mm(st=
ruct intel_vgpu *vgpu,
> >    * Zero on success, negative error code if failed.
> >    */
> >   struct intel_vgpu_mm *intel_vgpu_get_ppgtt_mm(struct intel_vgpu *vgpu,
> > -		intel_gvt_gtt_type_t root_entry_type, u64 pdps[])
> > +		int root_entry_type, u64 pdps[])
> >   {
> >   	struct intel_vgpu_mm *mm;
> > diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/=
gtt.h
> > index 32c573aea494..645ddc1bd223 100644
> > --- a/drivers/gpu/drm/i915/gvt/gtt.h
> > +++ b/drivers/gpu/drm/i915/gvt/gtt.h
> > @@ -95,7 +95,7 @@ struct intel_gvt_gtt {
> >   	unsigned long scratch_mfn;
> >   };
> > -typedef enum {
> > +enum {
> >   	GTT_TYPE_INVALID =3D -1,
> >   	GTT_TYPE_GGTT_PTE,
> > @@ -124,7 +124,7 @@ typedef enum {
> >   	GTT_TYPE_PPGTT_PML4_PT,
> >   	GTT_TYPE_MAX,
> > -} intel_gvt_gtt_type_t;
> > +};
> >   enum intel_gvt_mm_type {
> >   	INTEL_GVT_MM_GGTT,
> > @@ -148,7 +148,7 @@ struct intel_vgpu_mm {
> >   	union {
> >   		struct {
> > -			intel_gvt_gtt_type_t root_entry_type;
> > +			int root_entry_type;
> >   			/*
> >   			 * The 4 PDPs in ring context. For 48bit addressing,
> >   			 * only PDP0 is valid and point to PML4. For 32it
> > @@ -169,7 +169,7 @@ struct intel_vgpu_mm {
> >   };
> >   struct intel_vgpu_mm *intel_vgpu_create_ppgtt_mm(struct intel_vgpu *v=
gpu,
> > -		intel_gvt_gtt_type_t root_entry_type, u64 pdps[]);
> > +		int root_entry_type, u64 pdps[]);
> >   static inline void intel_vgpu_mm_get(struct intel_vgpu_mm *mm)
> >   {
> > @@ -233,7 +233,7 @@ struct intel_vgpu_ppgtt_spt {
> >   	struct intel_vgpu *vgpu;
> >   	struct {
> > -		intel_gvt_gtt_type_t type;
> > +		int type;
> >   		bool pde_ips; /* for 64KB PTEs */
> >   		void *vaddr;
> >   		struct page *page;
> > @@ -241,7 +241,7 @@ struct intel_vgpu_ppgtt_spt {
> >   	} shadow_page;
> >   	struct {
> > -		intel_gvt_gtt_type_t type;
> > +		int type;
> >   		bool pde_ips; /* for 64KB PTEs */
> >   		unsigned long gfn;
> >   		unsigned long write_cnt;
> > @@ -267,7 +267,7 @@ struct intel_vgpu_mm *intel_vgpu_find_ppgtt_mm(stru=
ct intel_vgpu *vgpu,
> >   		u64 pdps[]);
> >   struct intel_vgpu_mm *intel_vgpu_get_ppgtt_mm(struct intel_vgpu *vgpu,
> > -		intel_gvt_gtt_type_t root_entry_type, u64 pdps[]);
> > +		int root_entry_type, u64 pdps[]);
> >   int intel_vgpu_put_ppgtt_mm(struct intel_vgpu *vgpu, u64 pdps[]);
>=20
> --=20
> Best Regards,
> Colin Xu
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--mPYgjWmOFizS0g23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXK/yyAAKCRCxBBozTXgY
J539AKCUZoKHTSTFFw+NrZK0b74CgAxZNQCgl6rtb+cEUKKTv9lRD4lxsIjeL0g=
=3eDj
-----END PGP SIGNATURE-----

--mPYgjWmOFizS0g23--

--===============1802587080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1802587080==--
