Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3085436ywo;
        Mon, 8 Apr 2019 00:17:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwEM0kRtFUzTBrO/T9UYqanvN0d3ZxyD4SoyEYS5qGvcY7cnQRmLnVS1TrCLMQhPCAEah7
X-Received: by 2002:a63:7c45:: with SMTP id l5mr26947465pgn.303.1554707828218;
        Mon, 08 Apr 2019 00:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554707828; cv=none;
        d=google.com; s=arc-20160816;
        b=cfulTGmJt00SsJ8CSAPD+P+woRQpUShb3sBleb/rngviRopBOWjo/80ZC8KD8uhBt0
         T+ZBed4s+pNy/U7EK3UH4qNFCaQjPBH0rENuso45wlNVeJn1PAOwj+MwOBq2b6pja6/Z
         XL7pZrEnlbJMN6f5KGozxcFzdUaRv6t0mM3c9b83DDODNGUffhXzPoHuaVIKrsc9wfdS
         0tOqxgfbm7iOqoTt+TQ6TkWnA8yUf/PxpMCZZIcs0qhNcTNBGWOlcPRcRjCgxW1Ypicq
         ArRWuzBLkod/jlo2WrWKLBj0LgTKWMJP9vkBX/pphE/ckuoqOobRNDTVmrDMzmGDkGJn
         DQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:delivered-to;
        bh=fk+wgId4TrP+w6DWaTfrVUQvdL2CRJGIS8M6QQSmeBg=;
        b=DcPNAVgkaXbZxqVyaTA/pXuq2ZW4oi3dOhDR4EdoWSi4S/ks9MH3sgMks9Y5OVpD5j
         Z+AQuYBmD/hMzTU2qk+JeH3xODj5M3EYhx4HtxtKf1BxbJVzeZdaXG/qykxKz1fInsMw
         yC+Chvq1eHUlNt3R59mnsrm9gp4RfmVB600OvLqXLcHrAltFwKodtR5lbYTfiq+yw9F4
         EN4yPkdAV7xXZBKmbWfDnWy1aVLtC3j/Bv/SOjzYUETA66eE6ABEnhxz16LWjvfUapxR
         vpOgs1C/eje75j6F0i0qUUGhO5HZsNBoC9PJ2KTBz/W6b/3Nx33GqbJNAKVtY1O0u6ht
         dwgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id e1si25612403pgf.254.2019.04.08.00.17.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2019 00:17:08 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63167891FD;
	Mon,  8 Apr 2019 07:17:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1105891FD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 07:17:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 00:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="313992678"
Received: from coxu-arch-shz.sh.intel.com (HELO [10.239.160.21])
 ([10.239.160.21])
 by orsmga005.jf.intel.com with ESMTP; 08 Apr 2019 00:17:04 -0700
Subject: Re: [PATCH 3/5] drm/i915/gvt: Use snprintf() to prevent possible
 buffer overflow.
To: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 intel-gvt-dev@lists.freedesktop.org
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
 <20190408055502.8474-3-aleksei.gimbitskii@intel.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <79807cd1-7da0-a79a-885f-ea4c466d209d@intel.com>
Date: Mon, 8 Apr 2019 15:17:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408055502.8474-3-aleksei.gimbitskii@intel.com>
Content-Language: en-US
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
Reply-To: Colin.Xu@intel.com
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDQtMDggMTM6NTUsIEFsZWtzZWkgR2ltYml0c2tpaSB3cm90ZToKPiBGb3IgcHJp
bnRpbmcgdGhlIGludGVsX3ZncHUtPmlkLCBhIGJ1ZmZlciB3aXRoIGZpeGVkIGxlbmd0aCBpcyBh
bGxvY2F0ZWQKPiBvbiB0aGUgc3RhY2suIEJ1dCBpZiB2Z3B1LT5pZCBpcyBncmVhdGVyIHRoYW4g
NiBjaGFyYWN0ZXJzLCB0aGUgYnVmZmVyCj4gb3ZlcmZsb3cgd2lsbCBoYXBwZW4uIEV2ZW4gdGhl
IHN0cmluZyBvZiB0aGUgYW1vdW50IG9mIG1heCB2Z3B1IGlzIGxlc3MKPiB0aGF0IHRoZSBsZW5n
dGggYnVmZmVyIHJpZ2h0IG5vdywgaXQncyBiZXR0ZXIgdG8gcmVwbGFjZSBzcHJpbnRmKCkgd2l0
aAo+IHNucHJpbnRmKCkuCj4KPiBUaGlzIHBhdGNoIGZpeGVkIHRoZSBjcml0aWNhbCBpc3N1ZSAj
NjczIHJlcG9ydGVkIGJ5IGtsb2N3b3JrLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxla3NlaSBHaW1i
aXRza2lpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPgo+IENjOiBaaGVueXUgV2FuZyA8
emhlbnl1d0BsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVs
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMgfCAyICst
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYwo+IGluZGV4IDJlYzg5YmNiNTlmMS4uNTFiMjcwNTAx
OGQ1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jCj4gQEAgLTE5OCw3ICsxOTgs
NyBAQCBpbnQgaW50ZWxfZ3Z0X2RlYnVnZnNfYWRkX3ZncHUoc3RydWN0IGludGVsX3ZncHUgKnZn
cHUpCj4gICAJc3RydWN0IGRlbnRyeSAqZW50Owo+ICAgCWNoYXIgbmFtZVsxMF0gPSAiIjsKPiAg
IAo+IC0Jc3ByaW50ZihuYW1lLCAidmdwdSVkIiwgdmdwdS0+aWQpOwo+ICsJc25wcmludGYobmFt
ZSwgMTAsICJ2Z3B1JWQiLCB2Z3B1LT5pZCk7CgpTZWN1cmUgZnVuY3Rpb24gbGlrZSBzbnByaW50
ZiBpcyBhbHdheXMgcHJlZmVycmVkIG92ZXIgbm9uLXNlY3VyZSB2YXJpYW50cy4KQ3VycmVudCBp
bXBsZW1lbnRhdGlvbiBkZWZpbmVzIGludGVsX3ZncHUtPmlkIGFzIGludCwgd2hpY2ggaW5kaWNh
dGVzIGFsdGhvdWdoCnR5cGU4IGlzIHRoZSBtYXggbnVtYmVyIG9mIHZncHUgdGhhdCBndnQgYWxs
b3dzLCB3ZSBjb3VsZCBpbmNyZWFzZSB1cCBsaW1pdAp0byBtb3JlIHRoYW4gOC4gSW4gdGhhdCBj
YXNlIGJ1ZiBzaXplIG9mIDEwIHdpbGwgYmUgaW5zdWZmaWNpZW50LgpJbiBhZGRpdGlvbiB0byB1
c2Ugc25wcmludGYsIGl0IHdpbGwgYmUgYmV0dGVyIHRvIGluY3JlYXNlIHRoZSBidWYgc2l6ZSB0
aGF0CmNvdWxkIGhvbGQgbWF4IHBvc3NpYmxlIHZhbHVlIG9mIGludGVsX3ZncHUtPmlkIHR5cGUu
Cgo+ICAgCXZncHUtPmRlYnVnZnMgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIobmFtZSwgdmdwdS0+Z3Z0
LT5kZWJ1Z2ZzX3Jvb3QpOwo+ICAgCWlmICghdmdwdS0+ZGVidWdmcykKPiAgIAkJcmV0dXJuIC1F
Tk9NRU07CgotLSAKQmVzdCBSZWdhcmRzLApDb2xpbiBYdQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
