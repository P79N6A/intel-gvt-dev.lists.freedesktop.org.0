Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2560946ywd;
        Sun, 13 Jan 2019 18:39:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4tugalbUNTYlodgFezVSsf5aVwnxvA1uZdr1dczmbsopmJu1sGMCWpsKMBt/nWz1Zl53Kv
X-Received: by 2002:a65:434d:: with SMTP id k13mr21469218pgq.269.1547433592010;
        Sun, 13 Jan 2019 18:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547433591; cv=none;
        d=google.com; s=arc-20160816;
        b=X/CrMJHnw5+LcswiGBFZqz939zLoMlFaMZXopHYLcS1PZeKPQWFSpr85ES/l6n7zLh
         JOoP5od7r6Pc7ZLtDa8HT4S2Z9YbD3VSscFYGKGfH0ISQnkKrRkfIHdx39lEsUCIiteL
         /oErr5Vu7jTtznKd/Vg9ueUxJ6n+cpDL2+1+EMN6TufIff5p1oa8mJAcOIfj2ols0R6s
         gl/eQrGmTE574fTwvtJ0bokP1/GQwcQX5nBz9fnxbRtbKafBkBFXfEIDeSilXb0jh4/T
         SDo6tcLtEhAp1yUHkkC8zDFjF65Os4q5VAq3SM2FXkI9KTfCWB3fiCdiwKlM1ufWGwbO
         y+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to:subject:delivered-to;
        bh=R3bnB8PvXLXGhZVHkonn2iXqFIm1AiSNzKdJ0ZZW0wc=;
        b=FHx7Ip1NAn+cIBaHZYFIZc4Ek3AAHXFk1ehl7D9HfY2etBngY+TkRvgTIy7CyFNhum
         1h2s1pSgkkOUaktaEpb4V4L40JFo/TJ+RoppOCFdQRhIFUfq2oLQOfYOIatK3XUW9YWr
         Ez8QOPVoMw43ufbz/zBs+P+32NrFMPltIDioPP7vk/9V8UICil/WcCnPD4mp4OdJWbW6
         2p5Qcu9cPh7jjsgHf1q+Hhj05g0KyXQgFZKVukeVhPNS+kPtc5pK19KC7yGOyYBiPelV
         LMRZRPlYbjRgnN62NyY33N0nPxdL+kiHLadsJQ7Oub5dvG3QPfluMycE9LFszkXEzbqd
         DkgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id d18si18331253pgm.212.2019.01.13.18.39.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 18:39:51 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370AF6E58F;
	Mon, 14 Jan 2019 02:39:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14C56F81B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 15:33:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DE8564100;
 Fri, 11 Jan 2019 15:33:54 +0000 (UTC)
Received: from [10.3.116.216] (ovpn-116-216.phx2.redhat.com [10.3.116.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C85E60920;
 Fri, 11 Jan 2019 15:33:41 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 5/5] [debug] some logging
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20190111093116.17188-1-kraxel@redhat.com>
 <20190111093116.17188-6-kraxel@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <06341f73-6063-8cc3-dc1a-e5022ef2e032@redhat.com>
Date: Fri, 11 Jan 2019 09:33:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190111093116.17188-6-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 11 Jan 2019 15:33:54 +0000 (UTC)
X-Mailman-Approved-At: Mon, 14 Jan 2019 02:39:50 +0000
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0753230497=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0753230497==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YYyj60MWhRyPA4IGQSCM1lILQh3gSQHHz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YYyj60MWhRyPA4IGQSCM1lILQh3gSQHHz
Content-Type: multipart/mixed; boundary="MjlEFmNmNXkYnLuoq24URz8RHkWlxuMQy";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org
Message-ID: <06341f73-6063-8cc3-dc1a-e5022ef2e032@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 5/5] [debug] some logging
References: <20190111093116.17188-1-kraxel@redhat.com>
 <20190111093116.17188-6-kraxel@redhat.com>
In-Reply-To: <20190111093116.17188-6-kraxel@redhat.com>

--MjlEFmNmNXkYnLuoq24URz8RHkWlxuMQy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/11/19 3:31 AM, Gerd Hoffmann wrote:
> ---
>  hw/vfio/display.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/hw/vfio/display.c b/hw/vfio/display.c
> index a3a710b3ee..96b5474243 100644
> --- a/hw/vfio/display.c
> +++ b/hw/vfio/display.c
> @@ -42,6 +42,8 @@ static void vfio_display_edid_link_up(void *opaque)
>      VFIOPCIDevice *vdev =3D opaque;
>      VFIODisplay *dpy =3D vdev->dpy;
> =20
> +    fprintf(stderr, "%s:\n", __func__);

Why fprintf() instead of trace points?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--MjlEFmNmNXkYnLuoq24URz8RHkWlxuMQy--

--YYyj60MWhRyPA4IGQSCM1lILQh3gSQHHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlw4t1QACgkQp6FrSiUn
Q2q5rQf+Ou7cGwv633TGNXHKc9n02pTLuIxoZgP3MjwRK8qyYTLnBwm6l6TuP9D5
89h1e4hoY4DjUmUgOMznXCTNJXWRqBJT05T0SBBexAI3dHBKyydYd0JKtnhde16b
KQyug2FINun1xSvMSo5iYix8u7DdTcLw5KhmSBatnAu+Fd+W3ej7s7nOv9uAd68b
Wbo1CMGvIyZSKvaMN+F3I/NhNCPKN0EM5VX1J6l2gu4G4k934qede7cE94+u68/l
sNMFzxLjhVeaMY3szcQg//8GLK+GTRMhIMH7XpGRdCshNKjFfeymW//PqAwCW8x9
YJcMDyjVs4T5A6X4Kgy9UCg/+foGiA==
=tCiM
-----END PGP SIGNATURE-----

--YYyj60MWhRyPA4IGQSCM1lILQh3gSQHHz--

--===============0753230497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============0753230497==--
