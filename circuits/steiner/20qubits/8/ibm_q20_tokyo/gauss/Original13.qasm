// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[12];
cx q[14], q[5];
cx q[15], q[12];
cx q[15], q[5];
cx q[14], q[4];
cx q[19], q[11];
cx q[14], q[15];
cx q[8], q[17];
cx q[3], q[13];
cx q[5], q[12];
