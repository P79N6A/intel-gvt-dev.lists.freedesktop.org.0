Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp8724276ywe;
        Fri, 8 Mar 2019 19:49:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNnH19JIX4F6+Lskx5EI71kNuUvF2NDdF+rB/d7pnaqK4bRdUOZPJVBWJf5NgZpSiyTPy8
X-Received: by 2002:a17:902:59c3:: with SMTP id d3mr22525740plj.214.1552103388820;
        Fri, 08 Mar 2019 19:49:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552103388; cv=none;
        d=google.com; s=arc-20160816;
        b=ydJD40/5W+xu0NtOiaEBx2DNmjHAQ5oHXawOjQqHTL9mzHTpUiya1C7Gn55Z6ISL4f
         iFS9KV22bund4ecNtiJyhYbna2SmVH3IGxIral6DHcrTdN8lk04XIBeclqQkqgCBd0FL
         5yASRUhyAHlanre+g0ZhE5qazZJluXv56NL4ok8Ypa5fftuF8dn70FhUXvXPRitCaiRY
         exDD6U75VmwbXtKJTAyMxPyRM9LIY2huqOIq0cpUcWa50r/kbPeMQ9s27ZZYipexv3Ep
         HdsQMsD+19AeT1D3OhYKij3z55wrNV9VeoOs7A9mArKM522xcLKr/YUC+6877DpE/48H
         TzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=MO7QE5c/3ezN+sSzJ/1RgY+x7hj/xxuvgGXPNc+PQRQ=;
        b=GF3i/0v9rpoCIW5qjoTWS5KwUblxB9JoKtsAw861vNR+T+B65yZxbsxiW8rBlwEsGr
         i8zqsOh7HfNqRc+IsRUWKIKdHW/uYmyTQNjZwYBPBPUabXrJZQTFJAkXGF7DlRGhzTLR
         QpfiYloXpN50haOYYog8A5zpkd9B6T3rYKM5tLDvcsTM4VkruUwTkZKs2F1nHdpU09T7
         +0nhHIFUq5QxQf3BX2J7BuFTg8+W6yX2LFpHfV23ehjhKcTySwfj945GRTWAbZnRTB9c
         l7/pVRV+oacgzdWpf2EVomWKm7wFR7xQfjXwVu4H9jvGem7aHgiyEyigBHKubbhYhuov
         Di+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id h94si8934106plb.51.2019.03.08.19.49.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 19:49:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4246E34B;
	Sat,  9 Mar 2019 03:49:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666976E348;
 Sat,  9 Mar 2019 03:49:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2019 19:49:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,458,1544515200"; 
 d="asc'?scan'208";a="326960161"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2019 19:49:44 -0800
Date: Sat, 9 Mar 2019 11:39:36 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: relax debug BUG_ON() for closed context in
 hw_id pin
Message-ID: <20190309033936.GA27119@zhen-hp.sh.intel.com>
References: <20190308075238.1778-1-zhenyuw@linux.intel.com>
 <155203390621.27405.3964566776159217086@skylake-alporthouse-com>
MIME-Version: 1.0
In-Reply-To: <155203390621.27405.3964566776159217086@skylake-alporthouse-com>
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
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============1410666473=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1410666473==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.08 08:31:51 +0000, Chris Wilson wrote:
> Quoting Zhenyu Wang (2019-03-08 07:52:37)
> > Current GVT created context is marked closed as not to be used for
> > host user. But its hw_id should still be used. So this is to relax
> > debug BUG_ON() in __i915_gem_context_pin_hw_id() for GVT contexts
> > which can use force single submission flag to identify.
>=20
> The alternative strategy would be to always pin the id for GVT. How many
> gvt contexts? One per host or one per client? Or we don't mark them as
> closed (not so keen on that as it does provide some protection).
>

Currently one per VM guest, always pin the id would also be good.

> I think I'd rather delete the GEM_BUG_ON() if it's not invariant -- we
> only escape it firing for kernel contexts because they pin their id.

I think anyway we'd better pin id for gvt context, as it's good to keep
it for one VM cycle.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXIM1eAAKCRCxBBozTXgY
JwFLAJ99fPuNIprx9aOqcyjtDG57iKkX8wCfT6Dink5RgFDTUgpP01V+28pb7j4=
=mBlA
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--

--===============1410666473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1410666473==--
