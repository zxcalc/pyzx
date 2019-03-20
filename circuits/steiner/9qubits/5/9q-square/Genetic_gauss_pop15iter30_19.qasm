// Initial wiring: [0 1 2 8 5 4 6 7 3]
// Resulting wiring: [0 1 2 8 5 7 6 4 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[7], q[6];
cx q[4], q[7];
cx q[5], q[4];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[1], q[4];
