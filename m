Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7528745ywe;
        Thu, 7 Mar 2019 18:57:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqw8NECxe4EvLh3Momk7pepohwIlGRR1wAilvpVhzHC7axpFYlR7WT1E0KQGSQcUF4yhmThp
X-Received: by 2002:a17:902:be14:: with SMTP id r20mr15729990pls.327.1552013863063;
        Thu, 07 Mar 2019 18:57:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552013863; cv=none;
        d=google.com; s=arc-20160816;
        b=kkO418VhcyAMPfpO+k4rgbbiY3Wd+pZiORqYF/SOyqK66o5bzDyhhwe8FuYQVYh1EK
         qRGAmZFACw4TOBEXMLK7rV550JqQJw3o8FMiHVpKPF7QvPUikWrCHMsBm9x0V2wmtB3X
         zEr0vpJLNYxXJ21nH8gsJf4uLZOyd0JrRha5izKcBYPT4031vIkl8c/dObsY/Upvlq7V
         y/2R2AjsQRL26ESRLGknfSNIrzvtFkFw22tUc7N4uVjvzvpLQGXYiheNUY+ay7wS4rAE
         JNZr7UrTTuL2bFx6hfFDZwA/LzwYiFm7xDhZskEfK0ujwkMJNeBawN/CTp0LRUcr6but
         wzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=nSPHnO3G2e2RfYsGs0KGwUafP2nuGBN3/FRz8kgVb/0=;
        b=g4b9d2SrGqFdi2OR62NAgMRrxT1XaZ5dHkL6nazkwz5LVUh2d46uGk0lifFIt+LHWo
         BsFfUJGE4kuzG04NrwsAgfe+xjzpCf7WfgoE1rWBqBIJedQpR9JEw1LIEvisRT+x58uk
         ApJ0PXBxriytBO8IpIqEbtKJ6lBbE2Z62Ccn4P+0PxIT+3uHdH0Kt3rJdyBbFgrm0s9Y
         Po1kpS3oRY6+2J4jqv5+LlZl7TnYdBxbXvD9YQtsym8MFjMxU5dus3XOTwg8gE0ksEhE
         qaef/4azE+biHfhxAmIcZnlaUZEWy8iyQMywPpdP9okmi05J8aZc8UcWhmbGJRM8it4M
         o/+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id j19si388286pgk.546.2019.03.07.18.57.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 18:57:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B3B6E271;
	Fri,  8 Mar 2019 02:57:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C656E268;
 Fri,  8 Mar 2019 02:57:40 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 18:57:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,454,1544515200"; 
 d="asc'?scan'208";a="120670780"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga007.jf.intel.com with ESMTP; 07 Mar 2019 18:57:38 -0800
Date: Fri, 8 Mar 2019 10:47:31 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PULL] gvt-fixes for 5.1-rc1
Message-ID: <20190308024731.GY12380@zhen-hp.sh.intel.com>
References: <20190307060810.GT12380@zhen-hp.sh.intel.com>
 <20190307234435.GB13329@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190307234435.GB13329@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: multipart/mixed; boundary="===============0806966449=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0806966449==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ekB8d505ZB0gDS8i"
Content-Disposition: inline


--ekB8d505ZB0gDS8i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.07 15:44:35 -0800, Rodrigo Vivi wrote:
> On Thu, Mar 07, 2019 at 02:08:10PM +0800, Zhenyu Wang wrote:
> >=20
> > Hi,
> >=20
> > Here's gvt-fixes for 5.1-rc1.
>=20
> I'm kind of confused here. this should be -next-fixes right?
>=20
> $ dim apply-pull drm-intel-next-fixes
>=20
> Pulling https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-03-07 =
=2E..
> From https://github.com/intel/gvt-linux
>  * tag                         gvt-fixes-2019-03-07 -> FETCH_HEAD
> dim: Pull request contains commits from drm/drm-fixes
> dim: Please backmerge first
> dim: ERROR: Issues in pull request detected, aborting
>=20
> or am I missing something?
>=20

Looks drm-intel-next-queued has backmerge of 5.0-rc7 from drm-next,
but drm-intel-next-fixes doesn't, some fixes depend on upstreamn
commit, e.g for f0e994372518 ("drm/i915/gvt: Fix workload request
allocation before request add"). For current window, I might hold till
drm-intel-fixes updated.

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--ekB8d505ZB0gDS8i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXIHXwwAKCRCxBBozTXgY
J0WOAJ9fWXvPlxiIiE8o3sCWjnYkJt3eUACgkpTE2/3vQ9mNZpI9HUk95zEw0Hs=
=kktM
-----END PGP SIGNATURE-----

--ekB8d505ZB0gDS8i--

--===============0806966449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0806966449==--
