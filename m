Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp85275ywb;
        Wed, 27 Mar 2019 19:37:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzYED8xcpe3knupDwUe4o51J0fuIfjFeZzqSTDowHy2zTGBINu7NY502ug17AT44Zi/xYxo
X-Received: by 2002:a17:902:22f:: with SMTP id 44mr40886372plc.138.1553740640968;
        Wed, 27 Mar 2019 19:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553740640; cv=none;
        d=google.com; s=arc-20160816;
        b=lz5X6CyIVs5Gu7mbd0FdwzCDSwTg/Y/FCIw0tTsGg9VdGo0OH5dFTR0S0gaiKnUKnG
         rVyRvMrp5Da/ds9DIAJQJnNMTJapqjnSYehMr9RlkloHGAhfjqtGXenKy46jPxiSMF9w
         Jw80ihM6TsaLdAhztzz3CZI7nhsAGvmI3rAiWLafnY0JyxTd27BfXHHn6KTOvQvoGpI9
         sceGamhGvxOJL4JjxdUw23sEfZMEBvfBUYonp21fy4eoVDBDo1H857fZ/d2bFaNGUft8
         CqmDdn9cMoJ49Zitz4NZNTlnAfVO71rZX+mXwIeYd42iVa3pOcE5zz6ZBVJb8br0HoTn
         XFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=7F8IBww0Da6zKIDRcLc9HPz+XRdxRa5ARkHVDZP8myE=;
        b=qcbT5LKz8JZF6H/+a+zxUXtVN6keH9Ox2F1I9vuvPKqXUOPW5lBJ6mtDpaJYWYLS80
         bLoxV0YCVRNHz115JlH/uddkd5kBYwC7B67ck+gy0iamXb1i0B9CNpJ7vHKalmrZIGUa
         +UahZ8zpXQDW3H0sdKHJUztXBIq/8M0/aDaXr7xbBylC2SqQyqVGsp7fk0lwrfJgMKhS
         RUipPHG4yXb2q+53ogc/vT4ZkZzBJ51p7dvT5ceFZkUD8lP/9piQb+9aG/ATuOuzEvGE
         uFf7RLQBKuoLqa+oqreJYcGu6TaOY5f510PknSmh/GQtn1qiOk92py5Cp9pd5sB8C8EK
         7h6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id o61si22052790pld.280.2019.03.27.19.37.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2019 19:37:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5116E2C6;
	Thu, 28 Mar 2019 02:37:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBB36E2C1;
 Thu, 28 Mar 2019 02:37:17 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Mar 2019 19:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,278,1549958400"; 
 d="asc'?scan'208";a="156465822"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga004.fm.intel.com with ESMTP; 27 Mar 2019 19:37:15 -0700
Date: Thu, 28 Mar 2019 10:26:26 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: Disable semaphore on vGPU for now
Message-ID: <20190328022626.GC20332@zhen-hp.sh.intel.com>
References: <20190327090636.3547-1-zhenyuw@linux.intel.com>
 <155367813647.24691.10538359395237455801@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <155367813647.24691.10538359395237455801@skylake-alporthouse-com>
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
 Kevin Tian <kevin.tian@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1936596373=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1936596373==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.27 09:15:36 +0000, Chris Wilson wrote:
> Quoting Zhenyu Wang (2019-03-27 09:06:36)
> > This is to disable semaphore usage when on vGPU for now. Unfortunately
> > GVT-g hasn't fully enabled semaphore usage yet, so current guest with
> > semaphore use would cause vGPU failure.
> >=20
> > Although current semaphore failure with vGPU can be simply resolved by
> > allowing cmd parser to accept MI_SEMAPHORE_WAIT command with address
> > audit, we're checking general usage of semaphore and how we should
> > handle it properly for virtualization in consider of function and
> > security concern. So we decide to request to disable it for now in
> > guest driver. Once GVT could support it, we would add new compat bit
> > to turn it on.
>=20
> MI_WAIT_SEMAPHORE are used by Vulkan (anvil) as well for VkEvents.

For batch buffer usage, current GVT won't scan on non-privileged buffer
so that's still accepted. We need to consider all use case of semaphore any=
way.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJww0gAKCRCxBBozTXgY
J+0lAJ96WqtjvpoI9Bd6Z2d6KhYSNgzduQCfZFOd7N4Li6LSoPgyYS6Ljx5XOdI=
=xqLg
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--

--===============1936596373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1936596373==--
