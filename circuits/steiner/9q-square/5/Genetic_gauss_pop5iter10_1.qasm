// Initial wiring: [0 7 4 3 2 6 5 1 8]
// Resulting wiring: [0 7 4 3 2 6 5 1 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[8], q[7];
cx q[7], q[6];
cx q[1], q[0];
cx q[7], q[4];
