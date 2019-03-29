// Initial wiring: [5, 7, 2, 13, 12, 19, 6, 11, 8, 9, 15, 18, 0, 1, 17, 10, 14, 16, 3, 4]
// Resulting wiring: [5, 7, 2, 13, 12, 19, 6, 11, 8, 9, 15, 18, 0, 1, 17, 10, 14, 16, 3, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[15];
cx q[12], q[13];
cx q[11], q[18];
cx q[11], q[17];
cx q[18], q[19];
cx q[17], q[16];
cx q[5], q[6];
cx q[6], q[7];
