Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp5643007ywb;
        Tue, 26 Mar 2019 23:40:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNR++lKWqv8LwRMmkR+R5bgvGtMJi1ZG/irLpwa5AlNMKD73XLsDWFURWoNZ4qhhZHZxFJ
X-Received: by 2002:a17:902:1123:: with SMTP id d32mr34592066pla.16.1553668840001;
        Tue, 26 Mar 2019 23:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553668839; cv=none;
        d=google.com; s=arc-20160816;
        b=r2WPNR9EBdZpf+stDBDy9UyJ9PVwbI2H+DoCSf15Ampj0XUKhemdNtWtEu9PyO9sl9
         XVcw8/9108cJfXiXMeDMcBGACEeGQZ4GlAORtEu6ZHcHb+2KeKaL7ykAqSxGMC56CzQc
         WW1H8Q6B83SW56Cu7k1S5D/jnnBbkucm5JeseN8Pivp1nhQxWhIRYfo9y7qmw7e+I6Ud
         J7q/YBV2XV+MI6nG+dJ/wPi+0OF/CwY8zjRXWK3Fu2Fl8HJeD/U7XsV0D76Rr63e4jgi
         AKRhEFqGd6t0Q6AnD6hsin8giFszZQzo9CGGFwsS7lh6oYfDbQbZDg+IfZiTJLj9jnYP
         tdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=rEpB9/243OpjBvCyIwSRJNRG6/0t9JZMuJaqCWkKBNI=;
        b=RFqc+C3355zKKriNL0LdsjPYZdwqkYZdW5mYt47uiwxl23gHxcsSftVss/7YRTnyRQ
         HPG20hqVTHkpCmTw7Ijd/gTximM9D1lvxZaS7DY/pyI2zryicUcqk0hrjYxecOi190uq
         h1IgarWn6NsKW/nT26ujwjQa1Nd3zFSaSv56mD6qJ5AfmMJcRQ+bocgLnN2UX0ZV2s3A
         txmmENyM0gylSoPYstjYJeBwciT0Nn656dQ1jQBxKGeDj38oEok8HDtxUq9InktKrqFu
         OIRsf85mbgm48Lg4V43JGT7AUFZylJNCYHzS4Yl+he0nv9WOeWz/T0OP9xMCgV+CrTeX
         eTIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 70si19159234pla.128.2019.03.26.23.40.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2019 23:40:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD0C6E0AA;
	Wed, 27 Mar 2019 06:40:39 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1716E0AA
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Mar 2019 06:40:38 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Mar 2019 23:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,275,1549958400"; d="scan'208";a="310745264"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga005.jf.intel.com with ESMTP; 26 Mar 2019 23:40:33 -0700
Date: Wed, 27 Mar 2019 02:35:09 -0400
From: Zhao Yan <yan.y.zhao@intel.com>
To: Cornelia Huck <cohuck@redhat.com>, alex.williamson@redhat.com
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190327063509.GD14681@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
 <20190220052838.GC16456@joy-OptiPlex-7040>
 <20190220110142.GD2608@work-vm>
 <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
 <20190220124242.5a1685c5.cohuck@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190220124242.5a1685c5.cohuck@redhat.com>
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
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDc6NDI6NDJQTSArMDgwMCwgQ29ybmVsaWEgSHVjayB3
cm90ZToKPiA+ID4gPiA+ICAgYikgSG93IGRvIHdlIGRldGVjdCBpZiB3ZSdyZSBtaWdyYXRpbmcg
ZnJvbS90byB0aGUgd3JvbmcgZGV2aWNlIG9yCj4gPiA+ID4gPiB2ZXJzaW9uIG9mIGRldmljZT8g
IE9yIHNheSB0byBhIGRldmljZSB3aXRoIG9sZGVyIGZpcm13YXJlIG9yIHBlcmhhcHMKPiA+ID4g
PiA+IGEgZGV2aWNlIHRoYXQgaGFzIGxlc3MgZGV2aWNlIG1lbW9yeSA/ICAKPiA+ID4gPiBBY3R1
YWxseSBpdCdzIHN0aWxsIGFuIG9wZW4gZm9yIFZGSU8gbWlncmF0aW9uLiBOZWVkIHRvIHRoaW5r
IGFib3V0Cj4gPiA+ID4gd2hldGhlciBpdCdzIGJldHRlciB0byBjaGVjayB0aGF0IGluIGxpYnZp
cnQgb3IgcWVtdSAobGlrZSBhIGRldmljZSBtYWdpYwo+ID4gPiA+IGFsb25nIHdpdGggdmVyaW9u
ID8pLiAgCj4gPiAKPiA+IFdlIG11c3Qga2VlcCB0aGUgaGFyZHdhcmUgZ2VuZXJhdGlvbiBpcyB0
aGUgc2FtZSB3aXRoIG9uZSBQT0Qgb2YgcHVibGljIGNsb3VkCj4gPiBwcm92aWRlcnMuIEJ1dCB3
ZSBzdGlsbCB0aGluayBhYm91dCB0aGUgbGl2ZSBtaWdyYXRpb24gYmV0d2VlbiBmcm9tIHRoZSB0
aGUgbG93ZXIKPiA+IGdlbmVyYXRpb24gb2YgaGFyZHdhcmUgbWlncmF0ZWQgdG8gdGhlIGhpZ2hl
ciBnZW5lcmF0aW9uLgo+IAo+IEFncmVlZCwgbG93ZXItPmhpZ2hlciBpcyB0aGUgb25lIGRpcmVj
dGlvbiB0aGF0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8KPiBzdXBwb3J0Lgo+IAo+IEJ1dCByZWdhcmRs
ZXNzIG9mIHRoYXQsIEkgdGhpbmsgd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBpbmNvbXBhdGli
bGUKPiBkZXZpY2VzL3ZlcnNpb25zIGZhaWwgZGlyZWN0bHkgaW5zdGVhZCBvZiBmYWlsaW5nIGlu
IGEgc3VidGxlLCBoYXJkIHRvCj4gZGVidWcgd2F5LiBNaWdodCBiZSB1c2VmdWwgdG8gZG8gc29t
ZSBpbml0aWFsIHNhbml0eSBjaGVja3MgaW4gbGlidmlydAo+IGFzIHdlbGwuCj4gCj4gSG93IGVh
c3kgaXMgaXQgdG8gb2J0YWluIHRoYXQgaW5mb3JtYXRpb24gaW4gYSBmb3JtIHRoYXQgY2FuIGJl
Cj4gY29uc3VtZWQgYnkgaGlnaGVyIGxheWVycz8gQ2FuIHdlIGZpbmQgb3V0IHRoZSBkZXZpY2Ug
dHlwZSBhdCBsZWFzdD8KPiBXaGF0IGFib3V0IHNvbWUga2luZCBvZiByZXZpc2lvbj8KaGkgQWxl
eCBhbmQgQ29ybmVsaWEKZm9yIGRldmljZSBjb21wYXRpYmlsaXR5LCBkbyB5b3UgdGhpbmsgaXQn
cyBhIGdvb2QgaWRlYSB0byB1c2UgInZlcnNpb24iCmFuZCAiZGV2aWNlIHZlcnNpb24iIGZpZWxk
cz8KCnZlcnNpb24gZmllbGQ6IGlkZW50aWZ5IGxpdmUgbWlncmF0aW9uIGludGVyZmFjZSdzIHZl
cnNpb24uIGl0IGNhbiBoYXZlIGEKc29ydCBvZiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LCBsaWtl
IHRhcmdldCBtYWNoaW5lJ3MgdmVyc2lvbiA+PSBzb3VyY2UKbWFjaGluZSdzIHZlcnNpb24uIHNv
bWV0aGluZyBsaWtlIHRoYXQuCgpkZXZpY2VfdmVyc2lvbiBmaWVsZCBjb25zaXN0cyB0d28gcGFy
dHM6CjEuIHZlbmRvciBpZCA6IGl0IHRha2VzIDMyIGJpdHMuIGUuZy4gMHg4MDg2LgoyLiB2ZW5k
b3IgcHJvcHJpZXRhcnkgc3RyaW5nOiBpdCBjYW4gYmUgYW55IHN0cmluZyB0aGF0IGEgdmVuZG9y
IGRyaXZlcgp0aGlua3MgY2FuIGlkZW50aWZ5IGEgc291cmNlIGRldmljZS4gZS5nLiBwY2lpZCAr
IG1kZXYgdHlwZS4KInZlbmRvciBpZCIgaXMgdG8gYXZvaWQgb3ZlcmxhcCBvZiAidmVuZG9yIHBy
b3ByaWV0YXJ5IHN0cmluZyIuCgoKc3RydWN0IHZmaW9fZGV2aWNlX3N0YXRlX2N0bCB7CiAgICAg
X191MzIgdmVyc2lvbjsgICAgICAgICAgICAvKiBybyAqLwogICAgIF9fdTggZGV2aWNlX3ZlcnNp
b25bTUFYX0RFVklDRV9WRVJTSU9OX0xFTl07ICAgICAgICAgICAgLyogcm8gKi8KICAgICBzdHJ1
Y3QgewogICAgIAlfX3UzMiBhY3Rpb247IC8qIEdFVF9CVUZGRVIsIFNFVF9CVUZGRVIsIElTX0NP
TVBBVElCTEUqLwoJLi4uCiAgICAgfWRhdGE7CiAgICAgLi4uCiB9OwoKVGhlbiwgYW4gYWN0aW9u
IElTX0NPTVBBVElCTEUgaXMgYWRkZWQgdG8gY2hlY2sgZGV2aWNlIGNvbXBhdGliaWxpdHkuCgpU
aGUgZmxvdyB0byBmaWd1cmUgb3V0IHdoZXRoZXIgYSBzb3VyY2UgZGV2aWNlIGlzIG1pZ3JhdGFi
bGUgdG8gdGFyZ2V0IGRldmljZQppcyBsaWtlIHRoYXQ6CjEuIGluIHNvdXJjZSBzaWRlJ3MgLnNh
dmVfc2V0dXAsIHNhdmUgc291cmNlIGRldmljZSdzIGRldmljZV92ZXJzaW9uIHN0cmluZwoyLiBp
biB0YXJnZXQgc2lkZSdzIC5sb2FkX3N0YXRlLCBsb2FkIHNvdXJjZSBkZXZpY2UncyBkZXZpY2Ug
dmVyc2lvbiBzdHJpbmcKYW5kIHdyaXRlIGl0IHRvIGRhdGEgcmVnaW9uLCBhbmQgY2FsbCBJU19D
T01QQVRJQkxFIGFjdGlvbiB0byBhc2sgdmVuZG9yIGRyaXZlcgp0byBjaGVjayB3aGV0aGVyIHRo
ZSBzb3VyY2UgZGV2aWNlIGlzIGNvbXBhdGlibGUgdG8gaXQuCgpUaGUgYWR2YW50YWdlIG9mIGFk
ZGluZyBhbiBJU19DT01QQVRJQkxFIGFjdGlvbiBpcyB0aGF0LCB2ZW5kb3IgZHJpdmVyIGNhbgpt
YWludGFpbiBhIGNvbXBhdGliaWxpdHkgdGFibGUgYW5kIGRlY2lkZSB3aGV0aGVyIHNvdXJjZSBk
ZXZpY2UgaXMgY29tcGF0aWJsZQp0byB0YXJnZXQgZGV2aWNlIGFjY29yZGluZyB0byBpdHMgcHJv
cHJpZXRhcnkgdGFibGUuCkluIGRldmljZV92ZXJzaW9uIHN0cmluZywgdmVuZG9yIGRyaXZlciBv
bmx5IGhhcyB0byBkZXNjcmliZSB0aGUgc291cmNlCmRldmljZSBhcyBlbGFib3JhdGVseSBhcyBw
b3NzaWJsZSBhbmQgcmVzb3J0cyB0byB2ZW5kb3IgZHJpdmVyIGluIHRhcmdldCBzaWRlCnRvIGZp
Z3VyZSBvdXQgd2hldGhlciB0aGV5IGFyZSBjb21wYXRpYmxlLgoKVGhhbmtzCllhbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
