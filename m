Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp1083539ywb;
        Sun, 10 Mar 2019 23:28:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNf2HGA6jUQ6o2lfnUVLI5p1xJJz2Aj/QUx5keBmh08+vqg5vwmVJH8TR7XhxOZiVgMOIh
X-Received: by 2002:a63:fd18:: with SMTP id d24mr1436129pgh.223.1552285688153;
        Sun, 10 Mar 2019 23:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552285688; cv=none;
        d=google.com; s=arc-20160816;
        b=U7BXMf1Rqnnsbl2v5TgksjPS6IvXMmc2nvZzCqGMRuU2G8bFJD/0McStznU80avQXA
         xWDtE6jsBq1SzBZxC5H03izfr4OO9HzSR6PPUGxl9saLxh9a2rrrKJpBAkfeOiemVJiD
         Q4tuFMxJcADJ5AXVX+oAds8M8axglpfJvaObG6ikMKAlbRX98wmbXKLKAq9r9NJNeRto
         FL3el1Ne85MUfp+a07qghPOq8OIFYnJ4XG9sLUom0KAKSAjr+2vaoyZtT7li1tdcXuuo
         paVFjOsH3crlTHvdbgv+Hicp7syO3BhX07/1MlBLTcGAXfGenjAiWDioWRh2btVbdyQ+
         or6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=M5ozEC4a04mD83rZtQ4KMOS+d9tXlTMeKfyFinEblmc=;
        b=cp3CuVFeEOHBVRyzdN3U5OXs8hz5NXJ1nmwB1B1qwlu7Hcup1Ll+8iB5gF2c8cDkuZ
         4BZaGOaaZboO+R9eIeTSWBC0OmoijfPovaDVQUhWPncXDCb5xGOaLBHrKpAqz9oBepJ0
         IEz6a+fRg5kGkQh2hOZ90t0M2Gk6NoqsmNq5TYymg0lZYF9fnkqTDYapADXZWXWADCI3
         n/BC5eJ0rfierIeVrxbVx6cfyYwtdUYHZFz5gXlnTk7uc2BoKEY9UF2np4ta/W3KCvDn
         WfynBMBENEXTExEwJlIXex+VIbl55ShdjwDzDQxQxTfiM8u7LGSwVRDkTgZFaOADpUYs
         1ThA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id q20si4685588pls.263.2019.03.10.23.28.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2019 23:28:08 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3603B897E4;
	Mon, 11 Mar 2019 06:28:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807F8897E4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 06:28:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ECF7485376;
 Mon, 11 Mar 2019 06:28:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-211.ams2.redhat.com
 [10.36.116.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E014619C71;
 Mon, 11 Mar 2019 06:28:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EE82C11A9A; Mon, 11 Mar 2019 07:28:00 +0100 (CET)
Date: Mon, 11 Mar 2019 07:28:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 1/3] vfio/display: add edid support.
Message-ID: <20190311062800.ofl7svfek37z4k3c@sirius.home.kraxel.org>
References: <20190222054939.19739-1-kraxel@redhat.com>
 <20190222054939.19739-2-kraxel@redhat.com>
 <e49ae948-5856-e9e2-7c87-76810a44da91@oracle.com>
 <20190308141451.55976c7e@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190308141451.55976c7e@x1.home>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 11 Mar 2019 06:28:05 +0000 (UTC)
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
Cc: Liam Merwick <liam.merwick@oracle.com>, intel-gvt-dev@lists.freedesktop.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ICBIaSwKCj4gTGlhbSBhbmQgSSBib3RoIGZvdW5kIHNvbWUgZGlmZmljdWx0eSB3aXRoIHRoZSBj
bGV2ZXJuZXNzIG9mIHRoZQo+IG1hY3Jvcywgc28gZm9yIHRoZSBzYWtlIG9mIGJldHRlciBtYWlu
dGFpbmFiaWxpdHksIEknZCBsaWtlIHRvIHByb3Bvc2UKPiByb2xsaW5nIGluIHRoZSBmb2xsb3dp
bmcgcGF0Y2gsIGluY2x1ZGluZyBMaWFtJ3MgdHJhY2UgZm9ybWF0IGZpeC4gIEl0J3MKPiBub3Qg
YXMgY29tcGFjdCBhcyB5b3VyIHZlcnNpb24sIGJ1dCBJIHRoaW5rIGl0J3MgZXF1aXZhbGVudCwg
aXQncyBlYXNpZXIKPiB0byBmb2xsb3csIGFuZCBkb2Vzbid0IGNvdmVydGx5IGludHJvZHVjZSBh
IG5vbi1jdXJseSBicmFjZWQgYmxvY2sgOykKPiBJZiB5b3UgYWdyZWUsIEknbGwgcm9sbCB0aGlz
IGludG8geW91ciB2My4gVGhhbmtzLAoKPiAgI2RlZmluZSBwd3JpdGVfZmllbGQoX2ZkLCBfcmVn
LCBfcHRyLCBfZmxkKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgaWYgKHNp
emVvZihfcHRyLT5fZmxkKSAhPSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gLSAgICAgICAgcHdyaXRlKF9mZCwgJihfcHRyLT5fZmxkKSwgc2l6ZW9mKF9wdHIt
Pl9mbGQpLCAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgX3JlZy0+b2Zmc2V0
ICsgb2Zmc2V0b2YodHlwZW9mKCpfcHRyKSwgX2ZsZCkpKSAgICAgICAgICAgXAo+IC0gICAgICAg
IGdvdG8gZXJyOwo+ICsgICAgKHNpemVvZihfcHRyLT5fZmxkKSAhPSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgcHdyaXRlKF9mZCwgJihfcHRy
LT5fZmxkKSwgc2l6ZW9mKF9wdHItPl9mbGQpLCAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgICAgICAgX3JlZy0+b2Zmc2V0ICsgb2Zmc2V0b2YodHlwZW9mKCpfcHRyKSwgX2ZsZCkpKQoK
PiAgICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJT19ERVZJQ0VfR0ZYX0xJTktf
U1RBVEVfRE9XTjsKPiAtICAgIHB3cml0ZV9maWVsZChmZCwgZHB5LT5lZGlkX2luZm8sIGRweS0+
ZWRpZF9yZWdzLCBsaW5rX3N0YXRlKTsKPiArICAgIGlmIChwd3JpdGVfZmllbGQoZmQsIGRweS0+
ZWRpZF9pbmZvLCBkcHktPmVkaWRfcmVncywgbGlua19zdGF0ZSkpIHsKPiArICAgICAgICBnb3Rv
IGVycjsKPiArICAgIH0KCkZpbmUgd2l0aCBtZS4KCnRoYW5rcywKICBHZXJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
