Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2907985ywo;
        Sun, 7 Apr 2019 19:38:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHpTvs42lplrXcdFXHU3x+Di4ceWRmkzFk18NPoSvfmCmK3t2+p9akijXswK11HVyklmjm
X-Received: by 2002:aa7:8190:: with SMTP id g16mr27331292pfi.92.1554691107069;
        Sun, 07 Apr 2019 19:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554691107; cv=none;
        d=google.com; s=arc-20160816;
        b=tRTxH1CFNTudJygglaOCT2lMbx7z/a6487VipVN5O9BBptMwUhh4raGe8GMptW8Rmf
         3O9quHZSO9gBlgTO6f7EpHZT3Z89fFUWp764lQyKzgyfjZMTrWjgmg/gQujplZN0rQD/
         jUaPGpynr/2cldesAsj9As94WS35qmB4dAl8A9EULfIZZkH4Q6CI3Ej23VezejtghuGz
         V3sBzoMtIcn5Isp6rmPQwNTsZx2fdFpPVwNQ6wfu2fElccwXmqBh28syzUIx49ZBDc8j
         RHKK2Rbrq2qwds2nVkZkuRGcWn9gnUV0xybaiC2B/EG8yMNWZIvHihEmgexW5cEpSUYi
         icwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=FMs0c+Wr+hR7sRJsd9gMBNtlq1dLHBUsGHi2zCl/SbM=;
        b=HmDggssZv55W7a+VFVKRN70E8bvLYe10Addr6BbKoLC2VgfjmnnGtT/bwzlv2+LwU9
         NyCT05dP8RHrw1ljcEJcUIJIZT7oAkThfXQ/tGLAudMSb8KO8Xi0TIFlmkFJmO0hhou4
         VpiD14KbngZ5AEV8JdamZytNoyp0vmpyUrr0LRTRHXeA0wNxz2xJjNhR/qmEVVt/Ettn
         rO4cokIzjLnJQ8mG1AQf3HleH2wMfY2rAknr7lIyWn/YHKVgwP3mWqIQ8eBV3RcUyphx
         ZEzb/OWMr4+kNkx2idkPwZZUHSyzXiTPO3p5GNcHno9rZw1/1eIYB13QtOfX+V7s3NMZ
         AASw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id l34si24988496pgb.574.2019.04.07.19.38.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2019 19:38:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B495D892F2;
	Mon,  8 Apr 2019 02:38:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6AF891D4;
 Mon,  8 Apr 2019 02:38:24 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Apr 2019 19:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,323,1549958400"; 
 d="asc'?scan'208";a="138374932"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga008.fm.intel.com with ESMTP; 07 Apr 2019 19:38:24 -0700
Date: Mon, 8 Apr 2019 10:27:09 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915/gvt: Prevent use-after-free in
 ppgtt_free_all_spt()
Message-ID: <20190408022709.GT2322@zhen-hp.sh.intel.com>
References: <20190404073056.12407-1-chris@chris-wilson.co.uk>
 <20190404074834.GS2322@zhen-hp.sh.intel.com>
 <155436551568.7532.6039435513500149424@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <155436551568.7532.6039435513500149424@skylake-alporthouse-com>
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============2056858392=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2056858392==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tgGnixv3tJWXBxdL"
Content-Disposition: inline


--tgGnixv3tJWXBxdL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.04 09:11:55 +0100, Chris Wilson wrote:
> Quoting Zhenyu Wang (2019-04-04 08:48:34)
> > On 2019.04.04 08:30:56 +0100, Chris Wilson wrote:
> > > ppgtt_free_all_spt() iterates the radixtree as it is deleting it,
> > > forgoing all protection against the leaves being freed in the process
> > > (leaving the iter pointing into the void).
> > >=20
> > > A minimal fix seems to be to use the available post_shadow_list to
> > > decompose the tree into a list prior to destroying the radixtree.
> > >=20
> > > Alerted by the sparse warnings:
> > >=20
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9: warning: incorrect type in assi=
gnment (different address spaces)
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9:    expected void **slot
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9:    got void [noderef] <asn:4> **
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9: warning: incorrect type in assi=
gnment (different address spaces)
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9:    expected void **slot
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9:    got void [noderef] <asn:4> **
> > > drivers/gpu/drm/i915/gvt/gtt.c:758:45: warning: incorrect type in arg=
ument 1 (different address spaces)
> > > drivers/gpu/drm/i915/gvt/gtt.c:758:45:    expected void [noderef] <as=
n:4> **slot
> > > drivers/gpu/drm/i915/gvt/gtt.c:758:45:    got void **slot
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9: warning: incorrect type in argu=
ment 1 (different address spaces)
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9:    expected void [noderef] <asn=
:4> **slot
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9:    got void **slot
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9: warning: incorrect type in assi=
gnment (different address spaces)
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9:    expected void **slot
> > > drivers/gpu/drm/i915/gvt/gtt.c:757:9:    got void [noderef] <asn:4> **
> > >=20
> > > This would also have been loudly warning if run through CI for the
> > > invalid RCU dereferences.
> > >=20
> > > Fixes: b6c126a39345 ("drm/i915/gvt: Manage shadow pages with radix tr=
ee")
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Changbin Du <changbin.du@intel.com>
> > > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/gtt.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gv=
t/gtt.c
> > > index cf133ef03873..9814773882ec 100644
> > > --- a/drivers/gpu/drm/i915/gvt/gtt.c
> > > +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> > > @@ -750,14 +750,20 @@ static void ppgtt_free_spt(struct intel_vgpu_pp=
gtt_spt *spt)
> > > =20
> > >  static void ppgtt_free_all_spt(struct intel_vgpu *vgpu)
> > >  {
> > > -     struct intel_vgpu_ppgtt_spt *spt;
> > > +     struct intel_vgpu_ppgtt_spt *spt, *spn;
> > >       struct radix_tree_iter iter;
> > > -     void **slot;
> > > +     LIST_HEAD(all_spt);
> > > +     void __rcu **slot;
> > > =20
> > > +     rcu_read_lock();
> > >       radix_tree_for_each_slot(slot, &vgpu->gtt.spt_tree, &iter, 0) {
> > >               spt =3D radix_tree_deref_slot(slot);
> > > -             ppgtt_free_spt(spt);
> > > +             list_move(&spt->post_shadow_list, &all_spt);
> > >       }
> > > +     rcu_read_unlock();
> > > +
> > > +     list_for_each_entry_safe(spt, spn, &all_spt, post_shadow_list)
> > > +             ppgtt_free_spt(spt);
> > >  }
> > >
> >=20
> > As we ensure to flush post shadow list, so this is safe to reuse.
>=20
> Phew! I looked, couldn't see that it would be used at this point, so
> hoped for the best.
> =20
> > Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
>=20
> Will you take both of these patches through your tree?

Yes.

Thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--tgGnixv3tJWXBxdL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKqxfQAKCRCxBBozTXgY
J3brAJ0WFNeqAFFRQQ4jSVrV+wClquowZACfTQ7RIiUZ1b1A1UssmuQDORuQ/7A=
=h/z2
-----END PGP SIGNATURE-----

--tgGnixv3tJWXBxdL--

--===============2056858392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2056858392==--
