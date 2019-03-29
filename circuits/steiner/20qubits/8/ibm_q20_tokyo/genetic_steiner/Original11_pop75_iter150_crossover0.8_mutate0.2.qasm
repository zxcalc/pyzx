// Initial wiring: [3, 17, 11, 9, 5, 19, 10, 13, 8, 14, 12, 2, 1, 7, 4, 16, 18, 0, 6, 15]
// Resulting wiring: [3, 17, 11, 9, 5, 19, 10, 13, 8, 14, 12, 2, 1, 7, 4, 16, 18, 0, 6, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[6];
cx q[14], q[13];
cx q[16], q[14];
cx q[17], q[12];
cx q[16], q[17];
cx q[13], q[15];
cx q[11], q[17];
cx q[6], q[7];
