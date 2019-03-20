// Initial wiring: [0 1 2 4 6 3 5 7 8]
// Resulting wiring: [0 4 2 8 5 3 6 7 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[3], q[8];
cx q[4], q[5];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[1], q[4];
cx q[3], q[8];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[5], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[5], q[4];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[7], q[4];
cx q[6], q[7];
