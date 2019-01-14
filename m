Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2690540ywd;
        Sun, 13 Jan 2019 22:20:39 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7FWi3kCadKM2PyKD1ve7ZnqQ+5RpdM+V75T/Zi6XysruDcGkfUpPllFPOIGsIHbbIRAvra
X-Received: by 2002:a17:902:1105:: with SMTP id d5mr23291918pla.47.1547446839699;
        Sun, 13 Jan 2019 22:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547446839; cv=none;
        d=google.com; s=arc-20160816;
        b=nOfVyx+s7Jj7rowP+iAbBTOnGLtxXjdD5nsWGIM2FJjexL+KJChjQel7GvISOQcO29
         h3AeZIWOljkq2cqRg5aqldi84BUQq3xqa0DoqEaVdeqlQCiOOcLF5K3IPDBnOrxbKpEM
         bjP3S1yM3k/p/w6KS7GwHqO51L5gIy1R+yCE5jxTQbZQ1DV5QRCTj/bDuU1tRSrJeWgE
         UN3U2Ib0NEEbrJm/l80AxBXBzihoTd/icoP5jHIto/AffFf9Ynj69PbaMNz77/VOyFlL
         rYH/eeExaAby2BVvcBKT5lIO7nG5uHemlKmH6VDe5lEze4IoV1NVSXRDnCgfKxOg15y9
         m7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=PanvgFVvbaNvQ81fD833bwwJr03whgsyGd1Z3xJT7eM=;
        b=RiMu1lsHJesEBytNbvj98r+UEZKqLNSP3LwLjC+Ln7ZPrCbmKqrXoTWzEpM2wesEi+
         jgAKwefjcbLiw+taSyDlpQ9O4Wc9oGYimC7PLEOJNdHvMwl/t2h31RKsmXOW87E62whR
         D3kiOF2iBvPlOMfJBGWxV79wj8dIhIUpq4nEsBgzzo4wR89VWpyA7hq6JTK3C9XMyw/S
         mLSYxlRvfwSRDjAbL2EoUw63eNF7R7PRx5YQpp+r6VU2JnoywDPs4BwJXUlQDEq/Und9
         eF3FeDUPMofeEi2+7VHw6ZuEd732uepVj7GIOplr3X0CMfW70NZXTV4E7nGSsLAHOWXL
         VbTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id l24si8585137pgj.171.2019.01.13.22.20.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 22:20:39 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328E96E22E;
	Mon, 14 Jan 2019 06:20:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFE16E22E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 06:20:37 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2019 22:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,476,1539673200"; 
 d="asc'?scan'208";a="117892482"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by orsmga003.jf.intel.com with ESMTP; 13 Jan 2019 22:20:36 -0800
Date: Mon, 14 Jan 2019 14:09:14 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Hang Yuan <hang.yuan@linux.intel.com>
Subject: Re: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio
 regions
Message-ID: <20190114060914.GB11631@zhen-hp.sh.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
 <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
 <20190114035645.GX11631@zhen-hp.sh.intel.com>
 <44564146-3284-14d9-8679-891d874fa7b5@linux.intel.com>
 <20190114050557.GZ11631@zhen-hp.sh.intel.com>
 <f9de100c-be8e-617d-3a69-ae47feb4488a@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <f9de100c-be8e-617d-3a69-ae47feb4488a@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0409995685=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0409995685==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dLXnlYbDJNCwF3YM"
Content-Disposition: inline


--dLXnlYbDJNCwF3YM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.14 13:34:33 +0800, Hang Yuan wrote:
> On 1/14/19 1:05 PM, Zhenyu Wang wrote:
> > On 2019.01.14 13:02:24 +0800, Hang Yuan wrote:
> > > On 1/14/19 11:56 AM, Zhenyu Wang wrote:
> > > > On 2019.01.10 19:04:45 +0800, hang.yuan@linux.intel.com wrote:
> > > > > From: Hang Yuan <hang.yuan@linux.intel.com>
> > > > >=20
> > > > > Add one hypercall to free VFIO region memory. Also call it in vgpu
> > > > > destroy.
> > > > >=20
> > > > > Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/i915/gvt/hypercall.h |  1 +
> > > > >    drivers/gpu/drm/i915/gvt/kvmgt.c     | 15 +++++++++++++++
> > > > >    drivers/gpu/drm/i915/gvt/mpt.h       | 14 ++++++++++++++
> > > > >    drivers/gpu/drm/i915/gvt/vgpu.c      |  1 +
> > > > >    4 files changed, 31 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/d=
rm/i915/gvt/hypercall.h
> > > > > index 5079886..2ab4138 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> > > > > +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> > > > > @@ -67,6 +67,7 @@ struct intel_gvt_mpt {
> > > > >    	int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
> > > > >    			     bool map);
> > > > >    	int (*set_opregion)(void *vgpu);
> > > > > +	void (*clean_regions)(void *vgpu);
> > > > >    	int (*get_vfio_device)(void *vgpu);
> > > > >    	void (*put_vfio_device)(void *vgpu);
> > > > >    	bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);
> > > >=20
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i=
915/gvt/kvmgt.c
> > > > > index a19e684..8c30dc3 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > > > @@ -493,6 +493,20 @@ static int kvmgt_set_opregion(void *p_vgpu)
> > > > >    	return ret;
> > > > >    }
> > > > > +static void kvmgt_clean_regions(void *p_vgpu)
> > > > > +{
> > > > > +	int i;
> > > > > +	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> > > > > +
> > > > > +	for (i =3D 0; i < vgpu->vdev.num_regions; i++)
> > > > > +		if (vgpu->vdev.region[i].ops->release)
> > > > > +			vgpu->vdev.region[i].ops->release(vgpu,
> > > > > +					&vgpu->vdev.region[i]);
> > > > > +	vgpu->vdev.num_regions =3D 0;
> > > > > +	kfree(vgpu->vdev.region);
> > > > > +	vgpu->vdev.region =3D NULL;
> > > > > +}
> > > >=20
> > > > It looks a little overkill to put this requiremnt on all hypervisor,
> > > > as VFIO region is KVMGT only thing, e.g might not be valid for othe=
r hypervisor.
> > > > And looks our region.ops.release is never actually useful, what we =
need
> > > > is to free up vgpu regions, maybe just at detach vgpu time to let h=
ypervisor
> > > > do any cleanup required.
> > > >=20
> > > Henry:Since there is already hypercall 'set_opregion', I use hypercal=
l as
> > > well to do region clean for opregion and edid region to have consiste=
nt
> > > interface between gvt and hypervisor. 'clean_regions' will also be ca=
lled if
> > > failure in vgpu create. So I didn't implement it in vgpu detach.
> > >=20
> >=20
> > "set_opregion" hypercall means hypervisor might have different ways to
> > expose opregion, e.g through vfio region, etc. So that makes sense for a
> > mpt interface. But here only care about cleanup of VFIO region, and both
> > opregion and edid region's release function is noop..
> >=20
> Henry: So do you mean to expose the functions (clean_regions/set_edid) in
> kvmgt instead of hypercall if the function is only valid for KVM?
>=20

For clean region here, for me it looks we just need to fix it by clean
vgpu regions in detach call, and for set_edid one mpt interface is ok
and region cleanup in detach would also work in error handling path.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--dLXnlYbDJNCwF3YM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXDwniQAKCRCxBBozTXgY
J0CSAKCQlIotMwE1eKCQ5Nc/ol3zc5re/gCggZljt+/mZjur3M85rcMb84CrkJo=
=HxtM
-----END PGP SIGNATURE-----

--dLXnlYbDJNCwF3YM--

--===============0409995685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0409995685==--
