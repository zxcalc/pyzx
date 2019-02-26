// Initial wiring: [0 1 2 3 7 5 8 4 6]
// Resulting wiring: [0 1 2 3 7 5 8 4 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[7], q[6];
cx q[7], q[4];
