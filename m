Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp422649ywb;
        Fri, 22 Mar 2019 01:28:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxGaCA71uQ/IgPmZqO+eZUaTpRflYfjkGe2gZ4dAvUxQFLOun6yVM+2h0h2NqZSNTiMDh6
X-Received: by 2002:a63:6142:: with SMTP id v63mr7641480pgb.342.1553243328386;
        Fri, 22 Mar 2019 01:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553243328; cv=none;
        d=google.com; s=arc-20160816;
        b=0jxA4Q5asYTsoQIJi9c0zuGeDCNoekCt9HV+UkpeRxhv5oDW4ewKI6toRv8XqrOYRT
         fAeyxGzSS6tU4T4PT/pt6sQ//GVQ7hMkzwtQ0R1de8q/oGWqI5ff9M6NUUhLCGPp5jeV
         xAvQQtAGIb/Uf36xyLJbc30948WDN6T9ALAyrox0VtCYHAqT0njlh9jme98MZdyJlToM
         BDuxqriY5NKw/txoWAEzePew74w40xyI84gGdxAjkIJ6wFmwkmLxOTsKLR5M7YhVCEq3
         c6A5FaWdvn7gyU6UueASSWJENB2PMPbJ+mSt+uC931NsLzYtzk2fugmM3txSxduDH4SW
         Lrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=vvSNidJ4b70GrfuuChjhT/0zQxg3ETI+Spz8A9bhths=;
        b=cwcK+VQfiRpt9t01X2DoaGWYqhqu9mlg8gIkM9MiYvsrjTbTxaNdTIX5kKJ2AZL2TJ
         DtBG/tvQ4Ue64n7hZvLwaIemEPjPt/717q+gtsGxirWhcu9+o32BeHs4eKCcR9iTjyU4
         KZOFiFX7aEZ/hpkPUztE1H2xp96imWYxwl1sliOWzbZEQgH4s1PMGBdoSOhYagUX8Br5
         5TqvwIKKPgw73DCZc1Svzc+eCVAcgix34msiUTytjWennlYEe9CnzKzg9FeIjgpD3wuW
         U1XIVYEsL6DbDJbr7dgwPf5ejBXwarCT91FeP9hhdeFdFIZTayhmAsBlA0dEWp1m6o8A
         W2JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id d68si3688208pfg.83.2019.03.22.01.28.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2019 01:28:48 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D786E297;
	Fri, 22 Mar 2019 08:28:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB5D6E297;
 Fri, 22 Mar 2019 08:28:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Mar 2019 01:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; 
 d="asc'?scan'208";a="136440414"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2019 01:28:44 -0700
Date: Fri, 22 Mar 2019 16:18:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915/gvt: Fix kerneldoc typo for
 intel_vgpu_emulate_hotplug
Message-ID: <20190322081807.GV10798@zhen-hp.sh.intel.com>
References: <20190205203033.5477-1-chris@chris-wilson.co.uk>
 <20190218085907.GS12380@zhen-hp.sh.intel.com>
 <155324271368.26447.10934641971482383309@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <155324271368.26447.10934641971482383309@skylake-alporthouse-com>
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============1296903146=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1296903146==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z3SYAdNKCFJcUCPa"
Content-Disposition: inline


--z3SYAdNKCFJcUCPa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.22 08:18:33 +0000, Chris Wilson wrote:
> Quoting Zhenyu Wang (2019-02-18 08:59:07)
> > On 2019.02.05 20:30:33 +0000, Chris Wilson wrote:
> > > drivers/gpu/drm/i915/gvt/display.c:457: warning: Function parameter o=
r member 'connected' not described in 'intel_vgpu_emulate_hotplug'
> > > drivers/gpu/drm/i915/gvt/display.c:457: warning: Excess function para=
meter 'conncted' description in 'intel_vgpu_emulate_hotplug'
> > >=20
> > > Fixes: 1ca20f33df42 ("drm/i915/gvt: add hotplug emulation")
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Hang Yuan <hang.yuan@linux.intel.com>
> > > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/display.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i91=
5/gvt/display.c
> > > index 035479e273be..e3f9caa7839f 100644
> > > --- a/drivers/gpu/drm/i915/gvt/display.c
> > > +++ b/drivers/gpu/drm/i915/gvt/display.c
> > > @@ -448,7 +448,7 @@ void intel_gvt_emulate_vblank(struct intel_gvt *g=
vt)
> > >  /**
> > >   * intel_vgpu_emulate_hotplug - trigger hotplug event for vGPU
> > >   * @vgpu: a vGPU
> > > - * @conncted: link state
> > > + * @connected: link state
> > >   *
> > >   * This function is used to trigger hotplug interrupt for vGPU
> > >   *
> > > --=20
> >=20
> > Thanks! Applied this, sorry to miss the check..
>=20
> Still present after the recent gvt merges.

oops, I was pushing this to gvt-next-fixes, but didn't actually
generate the -next-fixes for other dependence. I'll include this
for next pull. Sorry about that.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--z3SYAdNKCFJcUCPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJSaPwAKCRCxBBozTXgY
J45hAKCDqRE8HbQUskPUvbtqtMS3s25D8QCglwLzjONrnwyTX4LURm/MlqDTTz8=
=t9fE
-----END PGP SIGNATURE-----

--z3SYAdNKCFJcUCPa--

--===============1296903146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1296903146==--
