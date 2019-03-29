// Initial wiring: [1, 10, 3, 0, 19, 15, 16, 14, 13, 18, 4, 7, 6, 5, 17, 9, 2, 8, 11, 12]
// Resulting wiring: [1, 10, 3, 0, 19, 15, 16, 14, 13, 18, 4, 7, 6, 5, 17, 9, 2, 8, 11, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[12], q[18];
cx q[12], q[13];
cx q[9], q[11];
