// Initial wiring: [0 5 2 3 1 4 6 8 7]
// Resulting wiring: [0 5 2 6 1 3 4 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[6], q[5];
cx q[7], q[6];
cx q[4], q[7];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[3], q[8];
cx q[5], q[4];
cx q[7], q[6];
cx q[7], q[6];
cx q[7], q[6];
cx q[5], q[6];
cx q[3], q[4];
