Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2651428ywd;
        Sun, 13 Jan 2019 21:17:22 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5IzwXlOYEzfmroe5+4aNDdxK/iTk3n8fdSDrPQnUusx8IhTAK4JEN79D2k41PviMOhUsk+
X-Received: by 2002:a62:c28e:: with SMTP id w14mr23873813pfk.115.1547443042339;
        Sun, 13 Jan 2019 21:17:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547443042; cv=none;
        d=google.com; s=arc-20160816;
        b=zb7eFCo2uW1cLCcNM2Z47DEoVbbTk3NeI2D/31t8sxLCHyZeNa3zJfyvv59oJ5/XYT
         1vzJcQE0y6OsQbhoAx1xktY2VATEdHHwzZ/+n3vTT1CrjfiHAvnKc6mAGmB0n72ngOFV
         6tf5lUHWXadNwCMDFboxPR1JRlKEGt7RU3G3x+Uj/4IZzXN1iEdcdIsB4L26azO4xakV
         lov0pMIWLcOBUXU+lxwPpzYCc3DLDUxOu7BSsDmii09VCtxYh/aiWlaWkoNTmEd8cyq8
         Nbe0p96Vmvv3z8lxHM8CFW7aiA7E007MPFZbC/TD/Bf2IYZ3jOcVEVDoA92KRRYkPKei
         sOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=7uDORjOe0xXjifK6SHcXGHjCgk+6BfKqV81P7rG2yzA=;
        b=DHnXr9LHDcGAnHCGkOOZ9jF81iStMWjbpqhN8+HTAlJxZfP+mllE4LnP4tjOFl3Epm
         6US/5SzCxSnzQPYppByA0ejgMpPqXsoj0oSrL1EWmzUWKXl09OE81LhoCKVfMguqtsPJ
         QNNX++bYuqSuielZ5X5+rO03ZaTaMxcwAODehUH42Do5HU+2rq2H5EV5M3xmweUC4egn
         mKa0lyRkt+gemmt4FNSdSnFaexKZSTgei0Nuj6zAIirw8r0G6x6ZoiaCIM8NdgGph+rx
         gzO+cygANjywDLXbBIZGKkEKHdSY4puiHseR13b2/AyeMdSo2qj3EoU5Fq8mcEvarlHv
         ocyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id d8si4410534pln.128.2019.01.13.21.17.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 21:17:22 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7766E020;
	Mon, 14 Jan 2019 05:17:21 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67BCD6E020
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 05:17:21 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2019 21:17:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,476,1539673200"; 
 d="asc'?scan'208";a="135561976"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2019 21:17:20 -0800
Date: Mon, 14 Jan 2019 13:05:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Hang Yuan <hang.yuan@linux.intel.com>
Subject: Re: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio
 regions
Message-ID: <20190114050557.GZ11631@zhen-hp.sh.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
 <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
 <20190114035645.GX11631@zhen-hp.sh.intel.com>
 <44564146-3284-14d9-8679-891d874fa7b5@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <44564146-3284-14d9-8679-891d874fa7b5@linux.intel.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, kraxel@redhat.com
Content-Type: multipart/mixed; boundary="===============0423165696=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0423165696==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84mZ5ifxO1MoKVCL"
Content-Disposition: inline


--84mZ5ifxO1MoKVCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.14 13:02:24 +0800, Hang Yuan wrote:
> On 1/14/19 11:56 AM, Zhenyu Wang wrote:
> > On 2019.01.10 19:04:45 +0800, hang.yuan@linux.intel.com wrote:
> > > From: Hang Yuan <hang.yuan@linux.intel.com>
> > >=20
> > > Add one hypercall to free VFIO region memory. Also call it in vgpu
> > > destroy.
> > >=20
> > > Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gvt/hypercall.h |  1 +
> > >   drivers/gpu/drm/i915/gvt/kvmgt.c     | 15 +++++++++++++++
> > >   drivers/gpu/drm/i915/gvt/mpt.h       | 14 ++++++++++++++
> > >   drivers/gpu/drm/i915/gvt/vgpu.c      |  1 +
> > >   4 files changed, 31 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm/i=
915/gvt/hypercall.h
> > > index 5079886..2ab4138 100644
> > > --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> > > +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> > > @@ -67,6 +67,7 @@ struct intel_gvt_mpt {
> > >   	int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
> > >   			     bool map);
> > >   	int (*set_opregion)(void *vgpu);
> > > +	void (*clean_regions)(void *vgpu);
> > >   	int (*get_vfio_device)(void *vgpu);
> > >   	void (*put_vfio_device)(void *vgpu);
> > >   	bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);
> >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/=
gvt/kvmgt.c
> > > index a19e684..8c30dc3 100644
> > > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > @@ -493,6 +493,20 @@ static int kvmgt_set_opregion(void *p_vgpu)
> > >   	return ret;
> > >   }
> > > +static void kvmgt_clean_regions(void *p_vgpu)
> > > +{
> > > +	int i;
> > > +	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> > > +
> > > +	for (i =3D 0; i < vgpu->vdev.num_regions; i++)
> > > +		if (vgpu->vdev.region[i].ops->release)
> > > +			vgpu->vdev.region[i].ops->release(vgpu,
> > > +					&vgpu->vdev.region[i]);
> > > +	vgpu->vdev.num_regions =3D 0;
> > > +	kfree(vgpu->vdev.region);
> > > +	vgpu->vdev.region =3D NULL;
> > > +}
> >=20
> > It looks a little overkill to put this requiremnt on all hypervisor,
> > as VFIO region is KVMGT only thing, e.g might not be valid for other hy=
pervisor.
> > And looks our region.ops.release is never actually useful, what we need
> > is to free up vgpu regions, maybe just at detach vgpu time to let hyper=
visor
> > do any cleanup required.
> >=20
> Henry:Since there is already hypercall 'set_opregion', I use hypercall as
> well to do region clean for opregion and edid region to have consistent
> interface between gvt and hypervisor. 'clean_regions' will also be called=
 if
> failure in vgpu create. So I didn't implement it in vgpu detach.
>

"set_opregion" hypercall means hypervisor might have different ways to
expose opregion, e.g through vfio region, etc. So that makes sense for a
mpt interface. But here only care about cleanup of VFIO region, and both
opregion and edid region's release function is noop..

> > > +
> > >   static void kvmgt_put_vfio_device(void *vgpu)
> > >   {
> > >   	if (WARN_ON(!((struct intel_vgpu *)vgpu)->vdev.vfio_device))
> > > @@ -1874,6 +1888,7 @@ static struct intel_gvt_mpt kvmgt_mpt =3D {
> > >   	.dma_map_guest_page =3D kvmgt_dma_map_guest_page,
> > >   	.dma_unmap_guest_page =3D kvmgt_dma_unmap_guest_page,
> > >   	.set_opregion =3D kvmgt_set_opregion,
> > > +	.clean_regions =3D kvmgt_clean_regions,
> > >   	.get_vfio_device =3D kvmgt_get_vfio_device,
> > >   	.put_vfio_device =3D kvmgt_put_vfio_device,
> > >   	.is_valid_gfn =3D kvmgt_is_valid_gfn,
> > > diff --git a/drivers/gpu/drm/i915/gvt/mpt.h b/drivers/gpu/drm/i915/gv=
t/mpt.h
> > > index 9b4225d..1a07994 100644
> > > --- a/drivers/gpu/drm/i915/gvt/mpt.h
> > > +++ b/drivers/gpu/drm/i915/gvt/mpt.h
> > > @@ -314,6 +314,20 @@ static inline int intel_gvt_hypervisor_set_opreg=
ion(struct intel_vgpu *vgpu)
> > >   }
> > >   /**
> > > + * intel_gvt_hypervisor_clean_regions - Clean regions for guest
> > > + * @vgpu: a vGPU
> > > + *
> > > + */
> > > +static inline void intel_gvt_hypervisor_clean_regions(struct intel_v=
gpu *vgpu)
> > > +{
> > > +	if (!intel_gvt_host.mpt->clean_regions)
> > > +		return;
> > > +
> > > +	intel_gvt_host.mpt->clean_regions(vgpu);
> > > +}
> > > +
> > > +
> > > +/**
> > >    * intel_gvt_hypervisor_get_vfio_device - increase vfio device ref =
count
> > >    * @vgpu: a vGPU
> > >    *
> > > diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/g=
vt/vgpu.c
> > > index e1c860f8..c5eb565 100644
> > > --- a/drivers/gpu/drm/i915/gvt/vgpu.c
> > > +++ b/drivers/gpu/drm/i915/gvt/vgpu.c
> > > @@ -276,6 +276,7 @@ void intel_gvt_destroy_vgpu(struct intel_vgpu *vg=
pu)
> > >   	WARN(vgpu->active, "vGPU is still active!\n");
> > > +	intel_gvt_hypervisor_clean_regions(vgpu);
> > >   	intel_gvt_debugfs_remove_vgpu(vgpu);
> > >   	intel_vgpu_clean_sched_policy(vgpu);
> > >   	intel_vgpu_clean_submission(vgpu);
> > > --=20
> > > 2.7.4
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--84mZ5ifxO1MoKVCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXDwYtQAKCRCxBBozTXgY
J9+ZAJ9UhfbJBVSvBGLiR3RZ93WGDuEZfACfZcc06L8ar9MXSFEyO7+k14y6UZo=
=2rEQ
-----END PGP SIGNATURE-----

--84mZ5ifxO1MoKVCL--

--===============0423165696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0423165696==--
