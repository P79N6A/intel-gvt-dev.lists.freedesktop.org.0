Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2653629ywd;
        Sun, 13 Jan 2019 21:20:40 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7SMy0DQekVEx3eGVpW4IFphpM6mmxjxo2O8pYBZYe6J5UWmaHiTQBwgUGMrB8KFtGT8TYl
X-Received: by 2002:a62:1d8f:: with SMTP id d137mr23697021pfd.11.1547443240843;
        Sun, 13 Jan 2019 21:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547443240; cv=none;
        d=google.com; s=arc-20160816;
        b=mn/0+NfeRZtG95aDAa0MRjvzRl9n6JBMQsxhJLwony0uar3Sj7/lJQz9Cgv1KnUJKP
         JznCmNfdcM8hXIB9tureqjljqA10ZR1ph5vEso1EvTHHsK9T0WmFBtmArjH0IfbMZ1jY
         U5qIfma94QYbMbkVFLorrfqUhLYNEXp9btDjCcugkcCglA07yH5y/AaJV1jEBusJ/b6Z
         2Rv6dxG2zmEnTbHPChqCBgfMVJvhxnqRkA57SmzzfPToxj0szYzs1DeZ6CcDsNLZXH4Z
         Iuw1Zb+pAk14V2L+6gT9mq2zwCckTit7Whn2ef+7VKopLqsrGG7jo1vNfIchNNYbq0r+
         dDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=aPzp8qii8NvhuePFFrAe/AGTJh6zp3UWihh0AXUU9F4=;
        b=IneSi6Z1iCPtDSYdrUiMm30IwTsnj67ONiWa/xYf28TnpJfejsDMCr/y8rdIn8PK2d
         YhJw1bwjBX26QZMJFnfCn3nPnfkZJoZUSPaarrBj0sgpkiP9cYykl02hqQQRNPMXY0v0
         CsPHiOBlQr8pge9ByT5x/6uKLq1S8TumPtEUdwEv1qGXu8R8xmb6fM1TDhvHLJ/jxwet
         aW6pX0dWFhB++sAYkOtMm59MlFKDEm1+yBqbE1nfrymgezvtwBXtZozkw6rSoYoRweMx
         OVUp+dfFzaanAfMQLc99Ry/DfPhiAba+YmxnHgx33oR/uVapNOTXG4YZCnB562Wlf2EI
         x2oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id w5si27986921plp.208.2019.01.13.21.20.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 21:20:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712866E020;
	Mon, 14 Jan 2019 05:20:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7396E020
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 05:20:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2019 21:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,476,1539673200"; 
 d="asc'?scan'208";a="108010745"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.8])
 by orsmga006.jf.intel.com with ESMTP; 13 Jan 2019 21:20:37 -0800
Date: Mon, 14 Jan 2019 13:09:14 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Hang Yuan <hang.yuan@linux.intel.com>
Subject: Re: [PATCH v1 1/4] drm/i915/gvt: add one hypercall to clean vfio
 regions
Message-ID: <20190114050914.GA11631@zhen-hp.sh.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
 <1547118288-1001-2-git-send-email-hang.yuan@linux.intel.com>
 <20190114035645.GX11631@zhen-hp.sh.intel.com>
 <44564146-3284-14d9-8679-891d874fa7b5@linux.intel.com>
 <20190114050557.GZ11631@zhen-hp.sh.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190114050557.GZ11631@zhen-hp.sh.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0584808175=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0584808175==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Er1qpsOqk0l6oMce"
Content-Disposition: inline


--Er1qpsOqk0l6oMce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.01.14 13:05:57 +0800, Zhenyu Wang wrote:
> On 2019.01.14 13:02:24 +0800, Hang Yuan wrote:
> > On 1/14/19 11:56 AM, Zhenyu Wang wrote:
> > > On 2019.01.10 19:04:45 +0800, hang.yuan@linux.intel.com wrote:
> > > > From: Hang Yuan <hang.yuan@linux.intel.com>
> > > >=20
> > > > Add one hypercall to free VFIO region memory. Also call it in vgpu
> > > > destroy.
> > > >=20
> > > > Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
> > > > ---
> > > >   drivers/gpu/drm/i915/gvt/hypercall.h |  1 +
> > > >   drivers/gpu/drm/i915/gvt/kvmgt.c     | 15 +++++++++++++++
> > > >   drivers/gpu/drm/i915/gvt/mpt.h       | 14 ++++++++++++++
> > > >   drivers/gpu/drm/i915/gvt/vgpu.c      |  1 +
> > > >   4 files changed, 31 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/i915/gvt/hypercall.h b/drivers/gpu/drm=
/i915/gvt/hypercall.h
> > > > index 5079886..2ab4138 100644
> > > > --- a/drivers/gpu/drm/i915/gvt/hypercall.h
> > > > +++ b/drivers/gpu/drm/i915/gvt/hypercall.h
> > > > @@ -67,6 +67,7 @@ struct intel_gvt_mpt {
> > > >   	int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
> > > >   			     bool map);
> > > >   	int (*set_opregion)(void *vgpu);
> > > > +	void (*clean_regions)(void *vgpu);
> > > >   	int (*get_vfio_device)(void *vgpu);
> > > >   	void (*put_vfio_device)(void *vgpu);
> > > >   	bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);
> > >=20
> > > > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i91=
5/gvt/kvmgt.c
> > > > index a19e684..8c30dc3 100644
> > > > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > > > @@ -493,6 +493,20 @@ static int kvmgt_set_opregion(void *p_vgpu)
> > > >   	return ret;
> > > >   }
> > > > +static void kvmgt_clean_regions(void *p_vgpu)
> > > > +{
> > > > +	int i;
> > > > +	struct intel_vgpu *vgpu =3D (struct intel_vgpu *)p_vgpu;
> > > > +
> > > > +	for (i =3D 0; i < vgpu->vdev.num_regions; i++)
> > > > +		if (vgpu->vdev.region[i].ops->release)
> > > > +			vgpu->vdev.region[i].ops->release(vgpu,
> > > > +					&vgpu->vdev.region[i]);
> > > > +	vgpu->vdev.num_regions =3D 0;
> > > > +	kfree(vgpu->vdev.region);
> > > > +	vgpu->vdev.region =3D NULL;
> > > > +}
> > >=20
> > > It looks a little overkill to put this requiremnt on all hypervisor,
> > > as VFIO region is KVMGT only thing, e.g might not be valid for other =
hypervisor.
> > > And looks our region.ops.release is never actually useful, what we ne=
ed
> > > is to free up vgpu regions, maybe just at detach vgpu time to let hyp=
ervisor
> > > do any cleanup required.
> > >=20
> > Henry:Since there is already hypercall 'set_opregion', I use hypercall =
as
> > well to do region clean for opregion and edid region to have consistent
> > interface between gvt and hypervisor. 'clean_regions' will also be call=
ed if
> > failure in vgpu create. So I didn't implement it in vgpu detach.
> >
>=20
> "set_opregion" hypercall means hypervisor might have different ways to
> expose opregion, e.g through vfio region, etc. So that makes sense for a
> mpt interface. But here only care about cleanup of VFIO region, and both
> opregion and edid region's release function is noop..
>=20

And as this one is an issue fix patch instead of vfio edid related,
pls split it as a fix one.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Er1qpsOqk0l6oMce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXDwZegAKCRCxBBozTXgY
J1DXAJ9rfbThFJmbBMQLSdg+hSwrf+4c4gCdH0/MNJrwHmc9SC8fnyYe7rpark4=
=P/t6
-----END PGP SIGNATURE-----

--Er1qpsOqk0l6oMce--

--===============0584808175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0584808175==--
