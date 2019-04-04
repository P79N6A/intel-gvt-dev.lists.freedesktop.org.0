Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp843863ywo;
        Wed, 3 Apr 2019 18:02:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBl6p7ZGk85Cxljh1w15GpKZo89/jxhgWCcm0uEn7q+vj5nrLjjvDuaw2RT8EDwdZM2ASD
X-Received: by 2002:a62:7590:: with SMTP id q138mr2733434pfc.74.1554339774491;
        Wed, 03 Apr 2019 18:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554339774; cv=none;
        d=google.com; s=arc-20160816;
        b=t4ixmKiRo9hcHLNo1+vH3Wn7hTD1Y3xfoGaPXK3gikJFqrXVxUsSut4DB6+H+w32O9
         cO+q3HuxzCc7kOmmaNczXvljSE0++uNFx2NvOWMxc9aufJ90vN4ivYssEfRVTRmFspOR
         Dmfb/+Gb1aQPBBBHylEdLG8715oSkg24vScB8soHAu1KEQUf5uVGyzDM0t2uEQUzLfLH
         EcRFpfGfQ/Vq8mp1JYam6uHcrJswJElIAE+5pfI6sM30ILNp7I4hdf8qoaGz6RbqKFYt
         fS+uHZ3ikoI+IepnX6END8hPZK76n6Fm3biSnJwzNgePZG1pwG5pWkJu0yVaWW7cFJyu
         tSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=i90b1RLdNX7GDrIp0aeyIaJ8iLaoLRP2tEenGMXaWS8=;
        b=eQKdZAzCjZ7ncpe2dFyQp6pbW0wKkZwKyjypIZP8e2yZIuor57g03fzQx+V1zYXwm6
         +oK1TF5IaWCBKMme+flmcnguIBNAN0lVfwk7Fp5NlgjOvKPPEbWxZXVy7hSp/2NuDTyo
         wPPrjM28bko6ovTh4ULhm+9wIunAgPc7sz3pLbKdVBvXPT7c5qSP97unR61fmdAMS5K2
         lfoNciqKph41Usr7HLEOyNpLMG4wnWYmAfwS71tzvhDsCjanpHbh+YsfeykE00lLX1ba
         u568y5v6Yq26GTQjXw2xwPloWh3yQmf9yJ36yC348O9zu+TXsmhBMtjlilyUraS+FQJu
         LFrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id s26si14837129pfm.143.2019.04.03.18.02.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 18:02:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA706E554;
	Thu,  4 Apr 2019 01:02:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE636E553;
 Thu,  4 Apr 2019 01:02:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 18:02:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="220364143"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga001.jf.intel.com with ESMTP; 03 Apr 2019 18:02:51 -0700
Date: Wed, 3 Apr 2019 18:03:04 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes
Message-ID: <20190404010304.GG25758@intel.com>
References: <20190402094037.GB2322@zhen-hp.sh.intel.com>
 <20190404001237.GA18158@intel.com>
 <20190404003206.GA8327@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190404003206.GA8327@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBBcHIgMDQsIDIwMTkgYXQgMDg6MzI6MDZBTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gT24gMjAxOS4wNC4wMyAxNzoxMjozNyAtMDcwMCwgUm9kcmlnbyBWaXZpIHdyb3RlOgo+
ID4gT24gVHVlLCBBcHIgMDIsIDIwMTkgYXQgMDU6NDA6MzdQTSArMDgwMCwgWmhlbnl1IFdhbmcg
d3JvdGU6Cj4gPiA+IAo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IEhlcmUncyBndnQtZml4ZXMgZm9y
IDUuMS1yYzQgd2hpY2ggaW5jbHVkZXMgbWlzYyBmaXhlcyBmb3IKPiA+ID4gdkdQVSBkaXNwbGF5
IHBsYW5lIHNpemUgY2FsY3VsYXRpb24sIHNoYWRvdyBtbSBwaW4gY291bnQsCj4gPiA+IGVycm9y
IHJlY292ZXJ5IHBhdGggZm9yIHdvcmtsb2FkIGNyZWF0ZSBhbmQgb25lIGtlcm5lbGRvYwo+ID4g
PiBmaXggd2hpY2ggSSBtaXNzZWQgdG8gaW5jbHVkZSBiZWZvcmUuCj4gPiAKPiA+IGRpbTogMDAw
ZDM4OTcwZTk4ICgiZHJtL2k5MTUvZ3Z0OiBDb3JyZWN0IHRoZSBjYWxjdWxhdGlvbiBvZiBwbGFu
ZSBzaXplIik6IEZpeGVzOiBTSEExIG5lZWRzIGF0IGxlYXN0IDEyIGRpZ2l0czoKPiA+IGRpbTog
ICAgIGU1NDZlMjgxZDMzKCJkcm0vaTkxNS9ndnQ6IERtYWJ1ZiBzdXBwb3J0IGZvciBHVlQtZyIp
Cj4gPiBkaW06IEVSUk9SOiBpc3N1ZXMgaW4gY29tbWl0cyBkZXRlY3RlZCwgYWJvcnRpbmcKPiA+
IAo+ID4gSXMgaXQgc29tZXRoaW5nIHlvdSBjb3VsZCBmaXggb24geW91ciBzaWRlIHdpdGhvdXQg
aGF2aW5nCj4gPiB0byBieS1wYXNzIGRpbSB0aGlzIHRpbWU/Cj4gPiAKPiAKPiBTb3JyeSBhYm91
dCB0aGF0LCBsb29rcyBwZW9wbGUgc3RpbGwgZG9lc24ndCBnZW5lcmF0ZSBGaXhlcyB0YWcKPiBw
cm9wZXJseS4KCmRpbSBoYXMgYSBncmVhdCBoZWxwZXIgZm9yIGFsbCBkZXZlbG9wZXJzIHRvIGdl
bmVyYXRlIEZpeGVzIHRhZ3MuCgpkaW0gZml4ZXMgPGhhc2g+CgpCZXNpZGVzIHRoZSByaWdodCB0
YWcgaXQgd2lsbCBhbHNvIGFkZCByaWdodCBjYyBzdGFibGUgYW5kIG90aGVyCmNjIGZvbGtzLgoK
V2Ugc2hvdWxkIGFkdmVydGlzZSBpdCBtb3JlIDspCgo+ICBJJ2xsIGZpeCB0aGF0IGFuZCByZXNl
bmQuCgpJIHB1bGxlZCB0aGUgbmV3IG9uZS4gVGhhbmtzIGZvciB0aGF0LgoKPiAKPiAtLSAKPiBP
cGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlciwgSW50ZWwgbHRkLgo+IAo+ICRncGcgLS1rZXlz
ZXJ2ZXIgd3d3a2V5cy5wZ3AubmV0IC0tcmVjdi1rZXlzIDRENzgxODI3CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
