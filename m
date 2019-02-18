Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp2009410ywa;
        Mon, 18 Feb 2019 01:08:40 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia219Dz/sqCTId5lN6bGTAT/Z1icDdFlYkABCd8IyHIPdiTdRCfUGRE8WUxcy0vjiLkbEHZ
X-Received: by 2002:a63:c745:: with SMTP id v5mr18076099pgg.261.1550480920127;
        Mon, 18 Feb 2019 01:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550480920; cv=none;
        d=google.com; s=arc-20160816;
        b=WikWej4ddw/hIH9C8c91Z6T+EfxvzJURCW3QQqXOLCvpIM2SUq7flolCNEG46/+eQe
         /k6r6PMqEqzPQKa8GyuS7JIrbzstl7hP3N7ROkG5dSaEEugquMhUnArOfmAu7ABCkGW2
         MBHYjqjnMplnTovuGSglGteUKy1l9qUsgxGpCfNmdRnuikOoFSbJJ4AQMtfrgVCJ0FFp
         UrN5OslU2AY1QlNO/chgebCHoinMbvOwyEkk+mImaR/c1IbYQEY3J+O+9Mumjb8Wxd4B
         pxtFm1uz/ddrf4MyRAhqgIKF+UgjtY3JchEVJYDit/8NsBqrfEW+PV9yiT4jOEPbrat9
         HLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=hhid2St3tMcA9HPmMKyA/iaFhbt16YNnirSRsCHF2mE=;
        b=LflnyW/9p8vhs1R58T286R/xhYuL++8hthbzx9HwOTm3FDx/+bo9k3+dnzx2gttWSC
         +M0wBX6DGGve6Iaf1muwTP7PhFyv4c9rqRQ0ttbuDtZdKQyJlCpsFJuzalS3hkbGXm2W
         j0EzhS/vWktel8C6sj3X2EbArp+pPGfYqDO9qCZSkndwnpDBFt2g/uLv4VLIDqtY/spV
         XFPVHtytJCV3N0TEM6t1/UQpNnQb/t8LdxmPOv8CQ38uwLab48EsWKzavhT7BMpyGHoM
         pUZGSvGZVXQE4jVNNcSUE2XPjwC/yUsoIHiO3jDnbaY3jwfcCDKYiqEAEaxi2OGu20HE
         UjvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id x12si12497406plv.4.2019.02.18.01.08.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 01:08:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F52D8919E;
	Mon, 18 Feb 2019 09:08:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8228918E;
 Mon, 18 Feb 2019 09:08:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 01:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,384,1544515200"; 
 d="asc'?scan'208";a="125266171"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga008.fm.intel.com with ESMTP; 18 Feb 2019 01:08:35 -0800
Date: Mon, 18 Feb 2019 16:59:07 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915/gvt: Fix kerneldoc typo for
 intel_vgpu_emulate_hotplug
Message-ID: <20190218085907.GS12380@zhen-hp.sh.intel.com>
References: <20190205203033.5477-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190205203033.5477-1-chris@chris-wilson.co.uk>
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
 intel-gvt-dev@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0236149539=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0236149539==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qZLIv6EoKi7YuaSc"
Content-Disposition: inline


--qZLIv6EoKi7YuaSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.02.05 20:30:33 +0000, Chris Wilson wrote:
> drivers/gpu/drm/i915/gvt/display.c:457: warning: Function parameter or me=
mber 'connected' not described in 'intel_vgpu_emulate_hotplug'
> drivers/gpu/drm/i915/gvt/display.c:457: warning: Excess function paramete=
r 'conncted' description in 'intel_vgpu_emulate_hotplug'
>=20
> Fixes: 1ca20f33df42 ("drm/i915/gvt: add hotplug emulation")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Hang Yuan <hang.yuan@linux.intel.com>
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.a.wang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gv=
t/display.c
> index 035479e273be..e3f9caa7839f 100644
> --- a/drivers/gpu/drm/i915/gvt/display.c
> +++ b/drivers/gpu/drm/i915/gvt/display.c
> @@ -448,7 +448,7 @@ void intel_gvt_emulate_vblank(struct intel_gvt *gvt)
>  /**
>   * intel_vgpu_emulate_hotplug - trigger hotplug event for vGPU
>   * @vgpu: a vGPU
> - * @conncted: link state
> + * @connected: link state
>   *
>   * This function is used to trigger hotplug interrupt for vGPU
>   *
> --=20

Thanks! Applied this, sorry to miss the check..

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--qZLIv6EoKi7YuaSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXGpz2wAKCRCxBBozTXgY
J0icAJ9UwWiFPLTlUgc6Tpk4U9MZ9ZJ6BQCgnfdkBxJ3giQ1sQPrPizYqaU28kY=
=D6YT
-----END PGP SIGNATURE-----

--qZLIv6EoKi7YuaSc--

--===============0236149539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0236149539==--
