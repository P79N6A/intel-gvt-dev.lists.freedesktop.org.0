Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5063154ywa;
        Wed, 20 Feb 2019 18:10:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYInFjpsa4PvgPNiz/QomHIKI0PcSJBrgqSAlsPW+1v6zDE7G9Y4AUnkxC6XV9JJTy+5FCT
X-Received: by 2002:a62:4181:: with SMTP id g1mr37591047pfd.45.1550715019106;
        Wed, 20 Feb 2019 18:10:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550715019; cv=none;
        d=google.com; s=arc-20160816;
        b=c8Uj46/vfqoU9J/rR9CiBJuf3lyPy3o+XKzZhivFmJVD+EnTaQdSHKs0dYjc5fhdLO
         yVR/Sx4xALQ4k8KCpjPOjK/mTqy3r21xT1qGroz5T63lhe3TEx4+w4XCf0iVxD+Qfy08
         5Mm6T82qqx5cbNxYCz6iMPsAMEInF4IdAKLPUBpAtjnHOZb2+B2RRWMesTSliOOwO5Ff
         CFnR9PxX2ICnQFfzHvkwqK2Zhcqs+mT6Ki6SEvLRDVm3v8ziyFY7I7F5yJXy5W2fYgob
         z+Deq9g84005oH7/yaa4HSbdq/zjimmoTtN2eTEv3mt7qbBWd3EB8k3lFeL2FTI27zo+
         IH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=enJGO0MQ7qqxI/Da1SD8dHdvdeCEtaVYlNclr2iVG4o=;
        b=YJwlkVbwMNK9EVG9xDo8DLuOC7FKJTXB+uprjefTCxPeNxqZt+VhYG1R1WUnQZ0jQZ
         jih0Jx/bVMKC8X3zbfk/Ug5dZKIzhXjP0zo1N7DthmekQcvj1xEOGHKiZOVEyBJxXbeg
         MsS8HLEoT4UzFrljuB90uWyGle9fO8M10fWbkCa8uQUyGsEdq0RHvLkyEf5TX7sksR0t
         79yl1U3qYZHDH7V0x8h9TZdDL1+q1w2S+rnCt9XZhbuzlx2W0nuSKnN7fm++Ksexjf+2
         qVBFswFs0/YGM3NSsE8wujs9Dez3ORKInyQQB9wRrELZ51tNjcCQmYgodJjozTKqFbR7
         h3kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id e17si8038159pgo.44.2019.02.20.18.10.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 18:10:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA81891DC;
	Thu, 21 Feb 2019 02:10:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669FC891DC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 02:10:18 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2019 18:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="145227169"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2019 18:10:12 -0800
Date: Wed, 20 Feb 2019 21:04:58 -0500
From: Zhao Yan <yan.y.zhao@intel.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190221020457.GL16456@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <33183CC9F5247A488A2544077AF19020DB25D374@dggeml511-mbx.china.huawei.com>
 <20190221002444.GH16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "ziye.yang@intel.com" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiA+IAo+ID4gPiA1KSBBYm91dCBsb2cgc3luYywgd2h5IG5vdCByZWdpc3RlciBsb2dfZ2xvYmFs
X3N0YXJ0L3N0b3AgaW4KPiA+IHZmaW9fbWVtb3J5X2xpc3RlbmVyPwo+ID4gPgo+ID4gPgo+ID4g
c2VlbXMgbG9nX2dsb2JhbF9zdGFydC9zdG9wIGNhbm5vdCBiZSBpdGVyYXRlbHkgY2FsbGVkIGlu
IHByZS1jb3B5IHBoYXNlPwo+ID4gZm9yIGRpcnR5IHBhZ2VzIGluIHN5c3RlbSBtZW1vcnksIGl0
J3MgYmV0dGVyIHRvIHRyYW5zZmVyIGRpcnR5IGRhdGEKPiA+IGl0ZXJhdGl2ZWx5IHRvIHJlZHVj
ZSBkb3duIHRpbWUsIHJpZ2h0Pwo+ID4gCj4gCj4gV2UganVzdCBuZWVkIGludm9raW5nIG9ubHkg
b25jZSBmb3Igc3RhcnQgYW5kIHN0b3AgbG9nZ2luZy4gV2h5IHdlIG5lZWQgdG8gY2FsbAo+IHRo
ZW0gbGl0ZXJhdGVseT8gU2VlIG1lbW9yeV9saXN0ZW5lciBvZiB2aG9zdC4KPgp0aGUgZGlydHkg
cGFnZXMgaW4gc3lzdGVtIG1lbW9yeSBwcm9kdWNlcyBieSBkZXZpY2UgaXMgaW5jcmVtZW50YWwu
CmlmIGl0IGNhbiBiZSBnb3QgaXRlcmF0aXZlbHksIHRoZSBkaXJ0eSBwYWdlcyBpbiBzdG9wLWFu
ZC1jb3B5IHBoYXNlIGNhbiBiZQptaW5pbWFsLiAKOikKCj4gUmVnYXJkcywKPiAtR29uZ2xlaQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQt
ZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
