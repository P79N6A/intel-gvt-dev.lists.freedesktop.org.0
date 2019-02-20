Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4200765ywa;
        Wed, 20 Feb 2019 00:48:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbEnb2ykeqzqKazLWNAvFE+gP3vuvB5d/nH5yO1iZ2+BgWo3RoQoRFyyLTd+ADXHgDpw6Yu
X-Received: by 2002:a63:5b1c:: with SMTP id p28mr27572881pgb.73.1550652485584;
        Wed, 20 Feb 2019 00:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550652485; cv=none;
        d=google.com; s=arc-20160816;
        b=Xk1KRj/1YYxe6/HDg3X3kDZ4p6D8MG0wN/lpG/yIRM+LWUJJOJz6PUPxT/nUTLN2LG
         z1PDU46DhvXYklS45cM2IT6+lR5fSsBZdWeCNDfeCztHHVdgHExG+c14yuSFS3bePSPR
         oWgOgMoV9jH3xeZxuzeDX7MhWV47irYjZNpscU4LdYCSRkuEwSPPFKQRfifJcN+Y3zjT
         UGj3PG96rcFfIp/gA2GG4+uu17H2Yjli7AUEV+LyA9a+6/6UeVuSNgw8kpt0jn0E+Iow
         4qCd08bqZnS/eQAtMHeuH8eMdT6vHas3iOPeOlDeGRJyzgRWCLSRJNlp2XlD5tAnQ1+f
         7QBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=UcEt/gW5kC8ojVlIjXtAduYrd84n5wkMTtm/ZCvW4T0=;
        b=NkdBKuHtHCF/SsgBsZicUUI99YdmeMr2VTZ7d/vE86N1O+ixXfkcBs9rlCYax5UkUu
         Ia97kwNppk5DPCZ8oRAsLv2hGg/QedrPEQRVnFk98P5NF1NVSgod9tjdDeEgz18x1w9J
         AKGjR7o9ccd8JVsTs1A2cHiKLMFzIWMz/rHDvS8mxmD9nvdYKk9wm+38QlSVfNz7ChPi
         QKNuqFeOb7JFBqOxhyz9JZ8ps6ILXKqIwutBTa5NepooI74NHkgG8qfz9Bt/ebIYqRLI
         1lepQhTBndvmjm5MqGC0iXNTsX19myu/dy6Fa/CnRg4PvRiamm9ZhqTLzDoofAENKHVc
         uOSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id j123si14780394pgc.384.2019.02.20.00.48.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 00:48:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D552891B3;
	Wed, 20 Feb 2019 08:48:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DCF891B3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 08:48:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 07E92155AC;
 Wed, 20 Feb 2019 08:48:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B61AB5D70E;
 Wed, 20 Feb 2019 08:47:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F3E8E11AAF; Wed, 20 Feb 2019 09:47:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] vfio/display: add edid support.
Date: Wed, 20 Feb 2019 09:47:50 +0100
Message-Id: <20190220084753.9130-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 20 Feb 2019 08:48:04 +0000 (UTC)
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
 intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIDUuMCBsaW51eCBrZXJuZWwgaGVhZGVyIHVwZGF0ZSBmaW5hbGx5IGxhbmRlZCBpbiBtYXN0
ZXIuICBTbyB0aGlzCnNlcmllcyBoYXMgbm8gdW5tZXJnZWQgZGVwZW5kZW5jaWVzIGFueSBtb3Jl
LiAgUmViYXNpbmcgYW5kIHJlLXNlbmRpbmcKZm9yIG1lcmdlLgoKVGhpcyBzZXJpZXMgYWRkcyBF
RElEIHN1cHBvcnQgdG8gdGhlIHFlbXUgdmZpbyBkaXNwbGF5IGNvZGUuICBWYXJpb3VzCmRpc3Bs
YXktcmVsYWRlZCBpbmZvcm1hdGlvbiAtLSBtb3N0IGltcG9ydGFudGx5IHRoZSBkaXNwbGF5IHJl
c29sdXRpb24Kd2hpY2ggc2hvdWxkIGJlIHVzZWQgLS0gaXMgcGFzc2VkIHRvIHRoZSBndWVzdCB0
aGF0IHdheS4gIFRoZSAoaW5pdGlhbCkKZGlzcGxheSByZXNvbHV0aW9uIGNhbiBiZSBzZXQgdXNp
bmcgdGhlIG5ldyB4cmVzIGFuZCB5cmVzIHByb3BlcnRpZXMuCldoZW4gc3VwcG9ydGVkIGJ5IHRo
ZSBVSSBpdCB3aWxsIGFsc28gYmUgdXBkYXRlZCBvbiB3aW5kb3cgcmVzaXplcy4KCkdlcmQgSG9m
Zm1hbm4gKDMpOgogIHZmaW8vZGlzcGxheTogYWRkIGVkaWQgc3VwcG9ydC4KICB2ZmlvL2Rpc3Bs
YXk6IGFkZCB4cmVzICsgeXJlcyBwcm9wZXJ0aWVzCiAgdmZpby9kaXNwbGF5OiBkZWxheSBsaW5r
IHVwIGV2ZW50CgogaHcvdmZpby9wY2kuaCAgICAgICAgICAgICAgICAgfCAgIDIgKwogaW5jbHVk
ZS9ody92ZmlvL3ZmaW8tY29tbW9uLmggfCAgIDQgKysKIGh3L3ZmaW8vZGlzcGxheS5jICAgICAg
ICAgICAgIHwgMTU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
aHcvdmZpby9wY2kuYyAgICAgICAgICAgICAgICAgfCAgIDIgKwogaHcvdmZpby90cmFjZS1ldmVu
dHMgICAgICAgICAgfCAgIDcgKysKIDUgZmlsZXMgY2hhbmdlZCwgMTc0IGluc2VydGlvbnMoKykK
Ci0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2
